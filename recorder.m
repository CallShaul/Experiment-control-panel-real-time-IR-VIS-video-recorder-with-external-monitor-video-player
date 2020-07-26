function recorder(app, properties)
clc;
%% Set global variables

global viewer_is_running; % initialize the main frame grabber loop as global variable
global IRInterface; % initialize the interface as a global variable
global feedback;
feedback.posneg = 0;
feedback.wake = 0;
feedback.feel = zeros(1, 6);
feedback.status = 0;
feedback.age = 0;
feedback.sex = 'nan';
feedback.orientation = 'nan';

%% Initializing LWIR camera

err = 0; % declare no errors so far

if properties.LWIR_camera == 1
    if strcmp(properties.LWIR_camera2connect, 'PI IMAGER') % case LWIR camera is OPTRIS PI450
        %try
        err = status(app, 'Connecting to IR camera...', 'g', 1, 0);

        IRInterface = EvoIRMatlabInterface;
        IRViewer = EvoIRViewer; % initialize the viewer
        close(1); % closes the Evocortex special window, so a new "regular" figure window will be opnened.
        viewer_is_running = 1; % ok to run frame grabber loop

        if ~IRInterface.connect()
            close all;
            err = status(app, 'Error connecting to IR camera.', 'r', 1, 1);
        end

        %catch
        %err = status(app, 'Error connecting to IR camera.', 'r', 1, 1);
        %end
    end
end

%% Initializing RGB camera

if properties.RGB_camera == 1 && err == 0
    try
        err = status(app, 'Connecting to RGB camera...', 'g', 1, 0);
        rgb_cam = webcam(properties.RGB_camera2connect);
        rgb_cam.Resolution = [num2str(properties.RGB_resolution(2)) ,'x', num2str(properties.RGB_resolution(1))];
        frame_VIS = snapshot(rgb_cam); % get imgage from NIR camera if needed
        
        if properties.RGB_crop_cor ~= 0
            vis_crop_cor = str2num(properties.RGB_crop_cor); % case should crop NIR image
            frame_VIS = imcrop(frame_VIS, vis_crop_cor); % cropping the frame
        end
        if properties.RGB_camera2gray == 1
            frame_VIS = rgb2gray(frame_VIS); % get imgage from VIS camera if needed and transform to gray
        end
        
        viewer_is_running = 1; % ok to run frame grabber loop
    catch
        err = status(app, 'Error connecting to RGB camera.', 'r', 1, 1);
    end
    
else
    rgb_cam = 0;
end

%% Initializing NIR camera

if properties.NIR_camera == 1 && err == 0
    try
        err = status(app, 'Connecting to NIR camera...', 'g', 1, 0);
        nir_cam = webcam(properties.NIR_camera2connect);
        nir_cam.Resolution = [num2str(properties.NIR_resolution(2)) ,'x', num2str(properties.NIR_resolution(1))];
        frame_NIR = snapshot(nir_cam); % get imgage from NIR camera if needed
        
        if properties.NIR_crop_cor ~= 0
            nir_crop_cor = str2num(properties.NIR_crop_cor); % case should crop NIR image
            frame_NIR = imcrop(frame_NIR, nir_crop_cor); % cropping the frame
        end
        if properties.NIR_camera2gray == 1
            frame_NIR = rgb2gray(frame_NIR); % get imgage from VIS camera if needed and transform to gray
        end

        viewer_is_running = 1; % ok to run frame grabber loop
    catch
        err = status(app, 'Error connecting to NIR camera.', 'r', 1, 1);
    end
    
else
    nir_cam = 0;
end

%% Initializing VLC player and playlist files
if properties.playVideofiles == 1 && err == 0
    
    try
        err = status(app, 'Initializing VLC player and playlist video files...', 'g', 1, 0);
        vlc = VLC(); % creating VLC object
        if properties.initialIntroScreen == 0
            vlc.play('black.png'); % display black screen
        else
            vlc.play('Intro_msg.png'); % display black screen
        end
    catch
        err = status(app, 'Error connecting to VLC player.', 'r', 1, 1);
    end
    
    %     if properties.popup == 1  % if popup is desired - get location and call function
    %         intro_popup_fig = popup_fig_finder(app, 'intro_popup.mlapp', 'Intro Pop-up', true); % opens popup UI figure with always-on-top mode
    %         playFlag = 3; % 3 stands for: waiting for user to press OK button on the intro pop-up window.
    %     end
    
    %try
    
    for i=1:length(properties.playlist_idx) % creating the playlist by the right order (idx)
        playlist(i) = properties.list(properties.playlist_idx(i));
        playlist(i).idx = i;
    end
    
    playlist(1).startTime = 0;
    playlist(1).endTime = 0;
    playlist(1).startFrame = 0;
    playlist(1).endFrame = 0;
    list_length = length(playlist);
    %catch
    %    err = status(app, 'Error loading video files playlist.', 'r', 1, 1);
    %end
    
    if properties.do_not_record_on_black == 0
        black_record = 0; % save frames during the whole time
    else
        black_record = 1; % save frames ONLY when playing the videos
    end
    
else
    
    vlc = 0;
    black_record = 0; % save frames during the whole time
    
end
%% Saving data file
if properties.save_data == 1 && err == 0
    
    err = status(app, 'Creating data file...', 'g', 1, 0);
    
    [~, dir_feedback, ~] = mkdir ('Recordings'); % creates dir if it doesn't exist yet
    
    filename = avoidOverwrite([properties.desired_file_name, '.mat'], [pwd, '\Recordings\'], 3);
    
    properties.final_file_name = filename;
    filename = ['Recordings\', filename]; % file name without timestamp
    
    %try
    
    if properties.manual_memory_allocation == 0
        
        if properties.stop_after == 1
            properties.allocation = properties.constantFrameRate*properties.stop_after_duration;
        elseif properties.playTime == 0
            properties.allocation = uint32(properties.constantFrameRate*max([playlist.duration]));
        else
            properties.allocation = properties.constantFrameRate*properties.playTime;
        end
        
    end
    
    % Allocates memory:
    
    properties.allocation = round(properties.allocation + 0.1*properties.allocation);
    
    if properties.RGB_camera == 1 && properties.RGB_camera2gray == 1
        buffer_VIS = zeros(size(frame_VIS, 1), size(frame_VIS, 2), properties.allocation,'uint8'); % gray
    elseif properties.RGB_camera == 1 && properties.RGB_camera2gray == 0
        buffer_VIS = zeros(size(frame_VIS, 1), size(frame_VIS, 2), 3, properties.allocation,'uint8'); % color
    else
        buffer_VIS = 0;
    end
    
    if properties.NIR_camera == 1 && properties.NIR_camera2gray == 1
        buffer_NIR = zeros(size(frame_NIR, 1), size(frame_NIR, 2), properties.allocation,'uint8'); % gray
    elseif properties.NIR_camera == 1 && properties.NIR_camera2gray == 0
        buffer_NIR = zeros(size(frame_NIR, 1), size(frame_NIR, 2), 3, properties.allocation,'uint8'); % color
    else
        buffer_NIR = 0;
    end
    
    if properties.LWIR_camera == 1
        
        res = get_IR_resolution(properties, IRInterface); % getting the IR camera resolution
        properties.IR_resolution = res;
        
        if properties.LWIR_tempORcolor == 1
            buffer_IR = zeros(res(1), res(2), properties.allocation,'single'); % temperature
        elseif properties.LWIR_tempORcolor == 0
            buffer_IR = zeros(res(1), res(2), 3, properties.allocation,'single'); % psaudo-color
        end
        
    else
        buffer_IR = 0;
    end
    
    properties.exp_start_time = datetime;
    properties.exp_start_time_unix = posixtime(datetime);
    
    save(filename,'-v7.3','properties'); % creates the data file and stores first variable in it
    
    %catch
    %    err = status(app, 'Error creating and saving data file, program ends.', 'r', 1, 1);
    %end
    
end

%% Setting frame loop parameters

ready2end = 0;
last_popup_stat = 0;
timing = single(zeros(2,4));
idx = 1;
buff_idx = 0;
saved_frames_counter = 0;
video_idx = 1;
timing_idx = 1;
videosPlayed = 0;
frameCount = 0;
tLast_play = 1;
tLast_flag = 1;
tLast_display = 1;
t = uint64(zeros(1));
t_seg = zeros(2,1);
tStart = tic;
delay_corrector = str2double(app.FPSdelaycorrectorEditField.Value);
delay_corrector_step = str2double(app.FPSdelaycorrectorstepEditField.Value);
playFlag = 2; % 2: initial intro screen mode, 1: a video is playing, 0: black screen is playing

if ~exist('playlist', 'var')
    playlist = 0;
end

if properties.playTime == 0 && properties.playVideofiles == 1 && err == 0 % case auto mode is on
    properties.play_mode = 0;
    properties.playTime = playlist(video_idx).duration; % save length of first video
else
    properties.play_mode = 1;
end

if ~exist('rgb_crop_cor', 'var') & properties.RGB_crop_cor ~= 0 & err == 0
    rgb_crop_cor = str2num(properties.RGB_crop_cor); % case should crop VIS image
end

if ~exist('nir_crop_cor', 'var') & properties.NIR_crop_cor ~= 0 & err == 0
    nir_crop_cor = str2num(properties.NIR_crop_cor); % case should crop VIS image
end

if properties.RGB_camera == 0 && properties.NIR_camera == 0 && properties.LWIR_camera == 0 && err == 0
    err = status(app, 'No camera was selected.', 'r', 1, 1);
end

if ~exist('IRViewer', 'var')
   IRViewer = 0; 
end

if properties.warm_up == 1 && err == 0 % delay recording if needed
    err = warm_up(app, properties, IRViewer, vlc);
    tStart = tic;
end

if properties.LWIR_camera == 1 && err == 0
    IRViewer.trigger_shutter_flag(); % triggers flag (temperature drift reset)
end

if properties.save_data == 1 && playFlag == 2 && err == 0
    err = status(app, 'Recording...', 'g', 1, 0);
elseif properties.save_data == 0 && playFlag == 2 && err == 0
    err = status(app, 'Playing live stream...', 'g', 1, 0);
end

%% Frames loop
while(viewer_is_running) % main loop
    
    %% Maintain constant frame rate
    
    if properties.constantFrameRate ~= 0
        
        time_delta = t_seg(2) - t_seg(1);
        t_seg(2) = round(toc(tStart)*1000); % saves time delta [ms]
        time_parameter = 1000/properties.constantFrameRate;
        
        if time_delta <= time_parameter
            pause(((time_parameter - time_delta) / 1000) * delay_corrector);
        end
        
        t_seg(1) = t_seg(2); % updates last time stamp
        
    end
    
    %% Get RGB / NIR / IR frame from camera
    
    if properties.RGB_camera == 1 % if needs to get frame from VIS camera
        
        frame_VIS = snapshot(rgb_cam); % get imgage from VIS camera if needed
        if properties.RGB_crop_cor ~= 0
            frame_VIS = imcrop(frame_VIS, rgb_crop_cor); % cropping the frame
        end
        if properties.RGB_camera2gray == 1
            frame_VIS = rgb2gray(frame_VIS); % get imgage from VIS camera if needed and transform to gray
        end

    end
    
    if properties.NIR_camera == 1 % if needs to get frame from VIS camera
        
        frame_NIR = snapshot(nir_cam); % get imgage from NIR camera if needed
        if properties.NIR_crop_cor ~= 0
            frame_NIR = imcrop(frame_NIR, nir_crop_cor); % cropping the frame
        end
        if properties.NIR_camera2gray == 1
            frame_NIR = rgb2gray(frame_NIR); % get imgage from VIS camera if needed and transform to gray
        end
        
    end
    
    t(idx) = (round(toc(tStart)*1000)); % saves time delta
    
    if properties.LWIR_camera == 1 % if needs to get frame from IR camera
        
        if properties.LWIR_tempORcolor == 1
            THM = single(IRInterface.get_thermal()); % get gray image from IR camera
            frame_IR = ((THM - 10000) ./ 100); % change values to Celsius temperature values
        elseif properties.LWIR_tempORcolor == 0
            frame_IR = (IRInterface.get_palette()); % get color image from IR camera
        end
        
    end
    
    %% Store frames in RAM memory
    
    if (properties.save_data == 1 && playFlag == 1) || (properties.save_data == 1 && black_record == 0) % case needs to save recorded frames
        
        buff_idx = buff_idx + 1;
        saved_frames_counter = saved_frames_counter + 1;
        
        try
            
            if properties.RGB_camera == 1
                if properties.RGB_camera2gray == 1
                    buffer_VIS(:,:,buff_idx) = frame_VIS; % storing VIS camera gray image
                else
                    buffer_VIS(:,:,:,buff_idx) = frame_VIS; % storing VIS camera RGB image
                end
            end
            
            if properties.NIR_camera == 1
                if properties.NIR_camera2gray == 1
                    buffer_NIR(:,:,buff_idx) = frame_NIR; % storing VIS camera gray image
                else
                    buffer_NIR(:,:,:,buff_idx) = frame_NIR; % storing VIS camera RGB image
                end
            end
            
            if properties.LWIR_camera == 1
                if properties.LWIR_tempORcolor == 1
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
    
    %% Display live view
    
    if properties.live_view == 1 % if needs to display live view
        
        if properties.RGB_camera && properties.NIR_camera && properties.LWIR_camera
            imagesc(subplot(1,3,1),frame_VIS); % draw VIS image
            if properties.RGB_camera2gray
                colormap(gray);
            end
            imagesc(subplot(1,3,2),frame_NIR); % draw NIR image
            if properties.NIR_camera2gray
                colormap(gray);
            end
            imagesc(subplot(1,3,3),frame_IR); % draw IR image
            if properties.LWIR_tempORcolor
                colormap(gray);
            end
        elseif properties.RGB_camera && properties.NIR_camera && properties.LWIR_camera == 0
            imagesc(subplot(1,2,1),frame_VIS); % draw VIS image
            if properties.RGB_camera2gray
                colormap(gray);
            end
            imagesc(subplot(1,2,2),frame_NIR); % draw NIR image
            if properties.NIR_camera2gray
                colormap(gray);
            end
        elseif properties.RGB_camera && properties.NIR_camera == 0 && properties.LWIR_camera
            imagesc(subplot(1,2,1),frame_VIS); % draw VIS image
            if properties.RGB_camera2gray
                colormap(gray);
            end
            imagesc(subplot(1,2,2),frame_IR); colormap(gray);% draw IR image
            if properties.LWIR_tempORcolor
                colormap(gray);
            end
        elseif properties.RGB_camera == 0 && properties.NIR_camera && properties.LWIR_camera
            imagesc(subplot(1,2,1),frame_NIR); % draw NIR image
            if properties.NIR_camera2gray
                colormap(gray);
            end
            imagesc(subplot(1,2,2),frame_IR); colormap(gray);% draw IR image
            if properties.LWIR_tempORcolor
                colormap(gray);
            end
        elseif properties.RGB_camera == 0 && properties.NIR_camera == 0 && properties.LWIR_camera == 1
            imagesc(frame_IR); colormap(gray);% draw IR image
            if properties.LWIR_tempORcolor
                colormap(gray);
            end
        elseif properties.RGB_camera == 0 && properties.NIR_camera && properties.LWIR_camera == 0
            imagesc(frame_NIR); %colormap(gray);% draw NIR image
            if properties.NIR_camera2gray
                colormap(gray);
            end
        elseif properties.RGB_camera && properties.NIR_camera == 0 && properties.LWIR_camera == 0
            imagesc(frame_VIS); %colormap(gray);% draw VIS image
            if properties.RGB_camera2gray
                colormap(gray);
            end
        end
        
    end
    
    drawnow(); % updates image and callbacks
    
    %% Play videos (VLC) [and save buffer!]
    
    if properties.playVideofiles == 1
        
        if videosPlayed == list_length && feedback.status == 0 && last_popup_stat == 1 && properties.popup == 1
            if ishandle(intro_popup_fig) == 0 && feedback.age == 0 % re-open popup if it was closed by X and not by OK button
                intro_popup_fig = popup_fig_finder(app, 'intro_popup.mlapp', 'Intro Pop-up', true); % opens popup UI figure with always-on-top mode
            end
        end
        
        if t(idx) - t(1) >= properties.initialIntroScreen*1000 && playFlag == 2 % keeps initial black screen
            playFlag = 0;
        end
        
        if properties.save_data == 1 && properties.popup == 1 && feedback.status == 1 % re-open popup in case it was close using X not using OK button
            if ishandle(popup_fig) == 0
                popup_fig = popup_fig_finder(app, 'popup_fig.mlapp', 'Popup_questions', true); % opens popup UI figure with always-on-top mode
            end
        end
        
        if t(idx) - t(tLast_play) >= (properties.pauseTime*1000 - 1000) && playFlag == 0 ... % flags LWIR camera 1 sec before new video starts
                && (t(idx) - t(tLast_flag) >= 2000) && properties.flag_IR_camera_on_black == 1 ...
                && properties.LWIR_camera == 1

            IRViewer.trigger_shutter_flag(); % triggers flag (temperature drift reset)
            tLast_flag = idx; % saves current flag time
            
        end
        
        if (t(idx) - t(tLast_play) >= properties.pauseTime*1000 && playFlag == 0 &&...
                videosPlayed < list_length) || (playFlag == 0 && videosPlayed == 0) % checks if it's time to play a video

            if properties.popup == 1 % case need to wait for popup feedback
                
                if feedback.status == 0
                    
                    try
                        app.Status1.FontColor = [0.29,0.58,0.07]; % dark green
                        app.Status1.Value = sprintf('%s', ['Playing video: ', num2str(video_idx), ' / ', num2str(list_length), '.']);
                    catch
                    end
                    
                    vlc.play([playlist(video_idx).folder, '\', playlist(video_idx).name]);
                    playlist(video_idx).startTime = toc(tStart); % saves time stamp to playlist
                    playlist(video_idx).startFrame = saved_frames_counter + 1; % saves start frame to playlist
                    playFlag = 1; % marks next time to do a black screen
                    tLast_play = idx; % saves the index of the last time found
                    videosPlayed = videosPlayed + 1; % increase number of videos played counter
                    
                end
                
            else
                
                try
                    app.Status1.FontColor = [0.29,0.58,0.07]; % dark green
                    app.Status1.Value = sprintf('%s', ['Playing video: ', num2str(video_idx), ' / ', num2str(list_length), '.']);
                catch
                end
                
                vlc.play([playlist(video_idx).folder, '\', playlist(video_idx).name]);
                playlist(video_idx).startTime = toc(tStart); % saves time stamp to playlist
                playlist(video_idx).startFrame = saved_frames_counter + 1; % saves start frame to playlist
                playFlag = 1; % marks next time to do a black screen
                tLast_play = idx; % saves the index of the last time found
                videosPlayed = videosPlayed + 1; % increase number of videos played counter
                
            end
            
        end
        
        if t(idx) - t(tLast_play) >= properties.playTime*1000 && playFlag == 1 % checks if elpased time is larger then X
            
            err = status(app, 'Displaying black screen.', 'g', 1, 0);
            vlc.play('black.png'); % display black screen
            
            if properties.popup == 1 && feedback.status == 0 % if popup is desired - get location and call function
                popup_fig = popup_fig_finder(app, 'popup_fig.mlapp', 'Popup_questions', true); % opens popup UI figure with always-on-top mode
                feedback.status = 1;
                if videosPlayed == list_length
                    ready2end = 1;
                end
            end
            
            playlist(video_idx).endTime = toc(tStart); % saves time stamp to playlist
            playlist(video_idx).endFrame = saved_frames_counter; % saves end frame to playlist
            video_idx = video_idx + 1; % new line at playlist structure
            playFlag = 0; % marks next time to play a video
            tLast_play = idx; % saves the index of the last time found

            if video_idx <= list_length && properties.play_mode == 0
                properties.playTime = playlist(video_idx).duration; % save length of next video - if exists
            end
            
            if properties.saveONblack == 1 && properties.save_data == 1  % save buffer data
                
                if videosPlayed == list_length && properties.popup == 0
                    err = status(app, 'Displaying last screen.', 'g', 1, 0);
                    vlc.play('final_msg.png'); % display last black screen
                end
                
                err = save_buffer(app, properties, filename, playlist, buffer_VIS, buffer_NIR ,buffer_IR, video_idx-1, buff_idx); % update data to mat file
                buff_idx = 0;
            end
            
        end
        
        if videosPlayed == list_length && feedback.status == 0 && last_popup_stat == 0 && ready2end == 1 && properties.popup == 1
            err = status(app, 'Displaying last screen.', 'g', 1, 0);
            vlc.play('final_msg.png'); % display last black screen
            last_popup_stat = 1;
            intro_popup_fig = popup_fig_finder(app, 'intro_popup.mlapp', 'Intro Pop-up', true); % opens popup UI figure with always-on-top mode
        end
        
        if t(idx) - t(tLast_play) >= properties.lastBlackScreen*1000 && videosPlayed == list_length && playFlag == 0
            
            if properties.save_data == 1 && properties.popup == 1
                if feedback.status == 0 && feedback.age ~= 0
                    viewer_is_running = 0; % finish program
                end
            else
                viewer_is_running = 0; % finish program
            end
            
        end
        
    end
    
    %% Force end
    if properties.force_end == 1
        
        if properties.force_end_seconds == 1 && t(idx) - t(1) >= properties.force_end_period * 1000 ||...
                properties.force_end_seconds == 0 && idx >= properties.force_end_period
            viewer_is_running = 0; % finish program
        end
        
    end
    
    %% Elpased time is larger then 1 sec
    if t(idx) - t(tLast_display) >= 1000 % checks if elpased time is larger then 1 sec
        timing(timing_idx,1) = (t(idx) / 1000);
        timing(timing_idx,2) = frameCount;
        
        if properties.playVideofiles == 1 && viewer_is_running == 1 && playFlag == 1
            timing(timing_idx,3) = video_idx;
        end
        
        try
            
            app.FPS_status.Text = sprintf('%s', num2str(timing(timing_idx,2))); % updates frame rate
            app.Status2.Text = sprintf('%s', num2str(t(idx) / 1000)); % updates elapsed time
            
        catch
        end
        
        if properties.playVideofiles == 1 && properties.verifyFullscreen == 1
            vlc.Fullscreen = 'on'; % makes sure VLC player is at fullscreen mode (every second)
        end
        
            if timing(end, 2) ~= properties.constantFrameRate % perform minor time delay adjustments to get accurate FPS
                if timing(end, 2) > properties.constantFrameRate
                    delay_corrector = delay_corrector + delay_corrector_step; % FPS is too high - increase delay by 0.1% between frames
                elseif timing(end, 2) < properties.constantFrameRate && delay_corrector > 0
                    delay_corrector = delay_corrector - delay_corrector_step; % FPS is too low - reduce delay by 0.1% between frames
                end
                if delay_corrector < 0 
                    delay_corrector = 0; % make sure delay_corrector will never be negative
                end
                app.FPSdelaycorrectorEditField.Value = num2str(delay_corrector);
            end
        
        timing_idx = timing_idx + 1;
        frameCount = 0; % reset the frames counter
        tLast_display = idx; % saves the index of the last time found
        
    end
    
    %% Increase counters
    
    frameCount = frameCount + 1;
    idx = idx + 1;
    
end % end main loop

%% Adds data to the saved file

if properties.playVideofiles == 1 && err ~= 1
    vlc.quit(); % close VLC player
end

if properties.save_data == 1 && err ~= 1
    
    try
        app.RemarksEditField.Enable = 0;
        app.RemarksEditFieldLabel.Enable = 0;
    catch
    end
    
    err = status(app, 'Saving data file...', 'g', 1, 0);
    
    %try
    
    properties.exp_end_time = datetime;
    properties.exp_end_time_unix = posixtime(datetime);
    
    err = save_parameters(app, properties, filename, t, timing, playlist); % saves recording parameters
    err = save_buffer(app, properties, filename, playlist, buffer_VIS, buffer_NIR, buffer_IR, video_idx, buff_idx); % update data to mat file
    
    try
        app.Status1.FontColor = [0.29,0.58,0.07]; % dark green
        app.Status1.Value = sprintf('%s', ['File saved at: ',filename, ' successfully!']);
        app.StopButton.ButtonPushedFcn(1,1); % brings UI back to 'run' mode
    catch
    end
    
    %catch
    %   status(app, 'Error saving data file!!!', 'r', 1, 0);
    %   err = 1;
    %end
    
else
    if err == 0
        err = status(app, 'Program finished successfully.', 'g', 1, 0);
    end
end

%% Terminate
try
    if properties.LWIR_camera == 1
        IRInterface.terminate(); % disconnect from IR camera
    end
    if properties.RGB_camera == 1
        clear('rgb_cam'); % disconnect from VIS camera
    end
    if properties.playVideofiles == 1
        vlc.quit(); % close VLC player
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