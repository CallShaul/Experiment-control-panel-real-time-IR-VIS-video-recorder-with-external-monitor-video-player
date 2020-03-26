function recorder(app, properties)
clc;
%% Set global variables

global viewer_is_running; % initialize the main frame grabber loop as global variable
global IRInterface; % initialize the interface as a global variable
global feedback;
feedback.posneg = 0;
feedback.wake = 0;
feedback.feel = zeros(1,5);
feedback.status = 0;

%% Initializing IR camera

err = 0; % declare no errors so far

if properties.IR_camera == 1
    try
    err = status(app, 'Connecting to IR camera...', 'g', 1, 0);
    
    IRInterface = EvoIRMatlabInterface;
    IRViewer = EvoIRViewer; % initialize the viewer
    close(1); % closes the Evocortex special window, so a new "regular" figure window will be opnened.
    viewer_is_running = 1; % ok to run frame grabber loop
    
    if ~IRInterface.connect()
        close all;
        err = status(app, 'Error connecting to IR camera.', 'r', 1, 1);
    end
    
    catch
       err = status(app, 'Error connecting to IR camera.', 'r', 1, 1);
     end
end
%% Initializing VIS camera
if properties.VIS_camera == 1 && err == 0
    try
        err = status(app, 'Connecting to VIS camera...', 'g', 1, 0);
        cam = webcam(properties.camera2connect);
        cam.Resolution = properties.camera_resolution;
        viewer_is_running = 1; % ok to run frame grabber loop
    catch
        err = status(app, 'Error connecting to VIS camera.', 'r', 1, 1);
    end
end

%% Initializing VLC player and playlist files
if properties.playVideofiles == 1 && err == 0
    
    try
        err = status(app, 'Initializing VLC player and playlist video files...', 'g', 1, 0);
        v = VLC(); % creating VLC object
        v.play('black.png'); % display black screen
    catch
        err = status(app, 'Error connecting to VLC player.', 'r', 1, 1);
    end
    
    try
        
        for i=1:length(properties.playlist_idx) % creating the playlist by the right order (idx)
            playlist(i) = properties.list(properties.playlist_idx(i));
            playlist(i).idx = i;
        end
        
        playlist(1).startTime = 0;
        playlist(1).endTime = 0;
        list_length = length(playlist);
    catch
        err = status(app, 'Error loading video files playlist.', 'r', 1, 1);
    end
    
    if properties.do_not_record_on_black.Value == 0
        black_record = 0; % save frames during the whole time
    else
        black_record = 1; % save frames ONLY when playing the videos
    end
    
else
    
    black_record = 0; % save frames during the whole time
    
end
%% Saving data file
if properties.save_data == 1 && err == 0
    err = status(app, 'Creating data file to save videos to...', 'g', 1, 0);
    
    if properties.timeStamp4savedFile == 0
        filename = ['Recordings\', properties.title, '.mat']; % file name without timestamp
    elseif properties.timeStamp4savedFile == 1
        filename = ['Recordings\', properties.title, '_', num2str(now), '.mat']; % file name with timestamp
    end
    
    try
        
        % get resulution values:
        res_A = str2double(extractAfter(properties.camera_resolution,"x"));
        res_B = str2double(extractBefore(properties.camera_resolution,"x"));
        
        % Allocates memory:
        if properties.VIS_camera == 1 && properties.gray == 1
            buffer_VIS(res_A, res_B, str2double(properties.allocation)) = 0; % gray
        elseif properties.VIS_camera == 1 && properties.gray == 0
            buffer_VIS(res_A, res_B, 3, str2double(properties.allocation)) = 0; % RGB
        else
            buffer_VIS = 0;
        end
        
        if properties.IR_camera == 1 && properties.tempORcolor == 1
            buffer_IR(288, 382, str2double(properties.allocation)) = 0;
        elseif properties.IR_camera == 1 && properties.tempORcolor == 0
            buffer_IR(288, 382, 3, str2double(properties.allocation)) = 0;
        else
            buffer_IR = 0;
        end
        
        [~, dir_feedback, ~] = mkdir ('Recordings'); % creates dir if it doesn't exist yet
        
        save(filename,'-v7.3','properties'); % creates the data file and stores first variable in it
        
        if properties.playVideofiles == 1 && properties.saveONblack == 1

            err = save_buffer(app, properties, filename, buffer_VIS, buffer_IR, 1, 1);
            saveObject = matfile(filename,'Writable',true); % create partial variable saving object
            
        else
            saveObject = 0;
        end
        
    catch
        err = status(app, 'Error creating and saving data file, program ends.', 'r', 1, 1);
    end
end

%% Setting frame loop parameters

idx = 1;
buff_idx = 0;
saved_frames_counter = 0;
j = 1;
q = 1;
videosPlayed = 0;
frameCount = 0;
tLast_play = 1;
tLast_display = 1;
t = uint64(zeros(1));
t_seg = zeros(2,1);
tStart = tic;
playFlag = 2;

if ~exist('playlist', 'var')
    playlist = 0;
end

if properties.playTime == 0 && properties.playVideofiles == 1% case auto mode is on
    properties.play_mode = 0;
    properties.playTime = playlist(j).duration; % save length of first video
else
    properties.play_mode = 1;
end

if properties.crop_cor ~= 0
    crop_cor = str2num(properties.crop_cor); % case should crop VIS image
end

if properties.VIS_camera == 0 && properties.IR_camera == 0
    err = status(app, 'No camera was selected.', 'r', 1, 1);
end

if properties.IR_camera == 1 && err == 0
    IRViewer.trigger_shutter_flag(); % triggers flag (temperature drift reset)
end

if properties.warm_up == 1 && err == 0 % delay recording if needed
    if properties.VIS_camera == 1
        err = warm_up(app, properties, cam);
    else
        err = warm_up(app, properties);
    end
    tStart = tic;
end

if properties.save_data == 1 && err == 0
    err = status(app, 'Recording...', 'g', 1, 0);
elseif properties.save_data == 0 && err == 0
    err = status(app, 'Playing live stream...', 'g', 1, 0);
end

%% Frames loop
while(viewer_is_running) % main loop
    
    if properties.constantFrameRate ~= 0
        while t_seg(2) - t_seg(1) <= (1000/properties.constantFrameRate) % checks if elpased time is larger then 0.125 sec
            t_seg(2) = (round(toc(tStart)*1000)); % saves time delta
        end
        t_seg(1) = t_seg(2); % updates last time stamp
    end
    
    t(idx) = (round(toc(tStart)*1000)); % saves time delta
    
    if properties.VIS_camera == 1 % if needs to get frame from VIS camera
        
        if properties.gray == 1
            frame_VIS = rgb2gray(snapshot(cam)); % get imgage from VIS camera if needed and transform to gray
        else
            frame_VIS = snapshot(cam); % get imgage from VIS camera if needed
        end
        if properties.crop_cor ~= 0
            frame_VIS = imcrop(frame_VIS,crop_cor); % cropping the frame
        end
        
    end
    
    if properties.IR_camera == 1 % if needs to get frame from IR camera
        
        if properties.tempORcolor == 1
            THM = single(IRInterface.get_thermal()); % get gray image from IR camera
            frame_IR = ((THM - 10000) ./ 100); % change values to Celsius temperature values
        elseif properties.tempORcolor == 0
            frame_IR = (IRInterface.get_palette()); % get color image from IR camera
        end
        
    end
    
    if properties.save_data == 1 && playFlag == 1 || (properties.save_data == 1 && black_record == 0) % case needs to save recorded frames
        
            buff_idx = buff_idx + 1;
            saved_frames_counter = saved_frames_counter + 1;
            
            %disp (['saving frame...', num2str(buff_idx)]);
            
        try
            
            if properties.VIS_camera == 1
                if properties.gray == 1
                    buffer_VIS(:,:,buff_idx) = frame_VIS; % storing VIS camera gray image
                else
                    buffer_VIS(:,:,:,buff_idx) = frame_VIS; % storing VIS camera RGB image
                end
            end
            
            if properties.IR_camera == 1
                if properties.tempORcolor == 1
                    buffer_IR(:,:,buff_idx) = frame_IR; % storing IR camera temperature image
                else
                    buffer_IR(:,:,:,buff_idx) = frame_IR; % storing IR camera color image
                end
            end
            
        catch
            status(app, 'Error saving buffer data, program ends.', 'r', 1, 1);
            err = 2;
        end
        
    end
    
    if properties.live_view == 1 % if needs to display live view
        
        if properties.VIS_camera == 1 && properties.IR_camera == 1
            imagesc(subplot(1,2,1),frame_VIS); % draw VIS image
            imagesc(subplot(1,2,2),frame_IR); colormap(gray);% draw IR image
        elseif properties.VIS_camera == 0 && properties.IR_camera == 1
            imagesc(frame_IR); colormap(gray);% draw IR image
        elseif properties.VIS_camera == 1 && properties.IR_camera == 0
            imagesc(frame_VIS); colormap(gray);% draw VIS image
        end
        
    end
    
    drawnow(); % updates image and callbacks
    
    if properties.playVideofiles == 1
        
        if t(idx) - t(1) >= properties.initialBlackScreen*1000 && playFlag == 2 % keeps initial black screen
            playFlag = 0;
        end
        
        if properties.save_data == 1 && properties.popup == 1 && feedback.status == 1 % re-open popup in case it was close using X not using OK button
            if ishandle(popup_fig) == 0
                popup_fig = popup_fig_finder(true); % opens popup UI figure with always-on-top mode
                popup_fig.Position = str2num(app.PopuppositionEditField.Value); % locate pop-up figure where it should be
            end
        end
        
        if (t(idx) - t(tLast_play) >= properties.pauseTime*1000 && playFlag == 0 &&...
                videosPlayed < list_length) || (playFlag == 0 && videosPlayed == 0) % checks if it's time to play a video
            
            if properties.save_data == 1 && properties.popup == 1
                
                if feedback.status == 0
                    
                    try
                        app.Status1.FontColor = [0.29,0.58,0.07]; % dark green
                        app.Status1.Value = sprintf('%s', ['Playing video: ', num2str(j), ' / ', num2str(list_length), '.']);
                    catch
                    end
                    
                    v.play([playlist(j).folder, '\', playlist(j).name]);
                    playlist(j).startTime = toc(tStart); % saves time stamp to playlist
                    playlist(j).startFrame = saved_frames_counter + 1; % saves start frame to playlist
                    playFlag = 1; % marks next time to do a black screen
                    tLast_play = idx; % saves the index of the last time found
                    videosPlayed = videosPlayed + 1; % increase number of videos played counter
                    
                end
                
            else
                
                try
                    app.Status1.FontColor = [0.29,0.58,0.07]; % dark green
                    app.Status1.Value = sprintf('%s', ['Playing video: ', num2str(j), ' / ', num2str(list_length), '.']);
                catch
                end
                
                v.play([playlist(j).folder, '\', playlist(j).name]);
                playlist(j).startTime = toc(tStart); % saves time stamp to playlist
                playlist(j).startFrame = saved_frames_counter + 1; % saves start frame to playlist
                playFlag = 1; % marks next time to do a black screen
                tLast_play = idx; % saves the index of the last time found
                videosPlayed = videosPlayed + 1; % increase number of videos played counter
                
            end
            
        end
        
        if t(idx) - t(tLast_play) >= properties.playTime*1000 && playFlag == 1 % checks if elpased time is larger then X
            
            err = status(app, 'Displaying black screen.', 'g', 1, 0);
            v.play('black.png'); % display black screen
            playlist(j).endTime = toc(tStart); % saves time stamp to playlist
            playlist(j).endFrame = saved_frames_counter; % saves end frame to playlist
            % IRViewer.trigger_shutter_flag(); % trigger flag (temperature drift reset)
            j = j + 1; % new line at playlist structure
            playFlag = 0; % marks next time to play a video
            tLast_play = idx; % saves the index of the last time found
            
            if j <= length(playlist) && properties.play_mode == 0
                properties.playTime = playlist(j).duration; % save length of next video - if exists
            end
            
            if properties.popup == 1 && feedback.status == 0 % if popup is desired - get location and call function
                
                popup_fig = popup_fig_finder(true); % opens popup UI figure with always-on-top mode
                popup_fig.Position = str2num(app.PopuppositionEditField.Value); % locate pop-up figure where it should be
                feedback.status = 1;
                
            end
            
            if properties.saveONblack == 1 && properties.save_data == 1 % save buffer data
                
                err = save_buffer(app, properties, filename, buffer_VIS, ...
                    buffer_IR, saveObject, buff_idx); % update data to mat file

                % re-create matrices:
                if properties.VIS_camera == 1 && properties.gray == 1
                    buffer_VIS(res_A, res_B, properties.allocation) = 0; % gray
                else
                    buffer_VIS(res_A, res_B, 3, properties.allocation) = 0; % RGB
                end

                if properties.IR_camera == 1 && properties.tempORcolor == 1
                    buffer_IR(288, 382, properties.allocation) = 0;
                else
                    buffer_IR(288, 382, 3, properties.allocation) = 0;
                end
                
                buff_idx = 0;
                
            end
            
        end
        
        if t(idx) - t(tLast_play) >= properties.lastBlackScreen*1000 && videosPlayed == list_length && playFlag == 0
            
            if properties.save_data == 1 && properties.popup == 1
                if feedback.status == 0
                    viewer_is_running = 0; % finish program
                end
            else
                viewer_is_running = 0; % finish program
            end
            
        end
        
    end
    
    if t(idx) - t(tLast_display) >= 1000 % checks if elpased time is larger then 1 sec
        FPS(1,q) = frameCount;
        FPS(2,q) = (t(idx) / 1000);
        
        try
            if properties.dispCWstatus == 1
                plot(app.UIAxes, FPS(1,:), '-r'); % updates FPS graph
            end
            
            app.Status2.Text = sprintf('%s', num2str(t(idx) / 1000)); % updates elapsed time
        catch
        end
        q = q + 1;
        frameCount = 0; % reset the frames counter
        tLast_display = idx; % saves the index of the last time found
        
        if properties.playVideofiles == 1 && properties.verifyFullscreen == 1
            v.Fullscreen = 'on'; % makes VLC player fullscreen
        end
    end
    
    if properties.force_end == 1
        
        if properties.force_end_seconds == 1 && t(idx) - t(1) >= properties.force_end_period * 1000 ||...
                properties.force_end_seconds == 0 && idx >= properties.force_end_period
            viewer_is_running = 0; % finish program
        end
        
    end
    
    frameCount = frameCount + 1;
    idx = idx + 1;
    
end
%% Adds data to the saved file

if properties.playVideofiles == 1 && err ~= 1
    v.quit(); % close VLC player
end

if properties.save_data == 1 && err ~= 1
    
    err = status(app, 'Saving data file...', 'g', 1, 0);
    
    try
        
        err = save_parameters(properties, filename, t, FPS, playlist); % saves recording parameters
        err = save_buffer(app, properties, filename, buffer_VIS, buffer_IR, saveObject, buff_idx);
        
        try
            app.Status1.FontColor = [0.29,0.58,0.07]; % dark green
            app.Status1.Value = sprintf('%s', ['File saved at: ',filename, ' successfully!']);
            app.StopButton.ButtonPushedFcn(1,1); % brings UI back to 'run' mode
        catch
        end
        
    catch
        status(app, 'Error saving data file!!!', 'r', 1, 0);
        err = 1;
    end
    
else
    if err == 0
        err = status(app, 'Program finished successfully.', 'g', 1, 0);
    end
end

%% Terminate
try
    if properties.IR_camera == 1
        IRInterface.terminate(); % disconnect from IR camera
    end
    if properties.VIS_camera == 1
        clear('cam'); % disconnect from VIS camera
    end
    if properties.playVideofiles == 1
        v.quit(); % close VLC player
    end
catch
end

close all;

try
    
    app.StopButton.ButtonPushedFcn(1,1); % brings UI back to 'run' mode
    
    if err == 0
        disp('Program ended successfully.');
    elseif err == 2
        app.Status1.FontColor = [0.78,0.09,0.21]; % dark red
        app.Status1.Value = sprintf('%s', ['program ended prematurely! File saved at: ',filename]);
    end
    
catch
end

end