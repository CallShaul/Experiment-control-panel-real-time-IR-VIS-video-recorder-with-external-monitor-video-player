function [err, properties] = save_parameters(app, properties, filename, t, raw_timing, playlist)

%try

if properties.save_data == 1 && properties.popup == 1 % case there was a questions pop-up
    
    global feedback;
    properties.feel = uint8(feedback.feel);
    properties.wake = uint8(feedback.wake);
    properties.posneg = uint8(feedback.posneg);
    properties.age = feedback.age;
    properties.sex = feedback.sex;
    properties.orientation = feedback.orientation;

end

if properties.playVideofiles == 1
    
    list_length = length(playlist);
    timing = raw_timing(raw_timing(:,3)~=0,:); % drop the zeros (zeros represent black screen while popup window still open)
    vid_list = timing(:,3);
    
    for i=1:list_length
        
        idxes = uint16(find(vid_list == i)); % find indexes of video number i
        idxes = idxes(2:end); % drops the first FPS value!! (useally at the first second the FPS drops a little so i decided not to include it in the average FPS calculation)
        mean_fps(i) = mean(timing(idxes,2)); % calculate the average FPS
        
    end
    
    properties.timing = timing;
    
    for i=1:list_length % creates double array for relevant data
        
        current_var = extractBefore(playlist(i).name,".");
        var_list(i) = string(current_var);
        
        if isa(current_var, 'char') == 1
            play_list(i,1) = single(properties.playlist_idx(i)); % saves video list number
        else
            play_list(i,1) = single(str2double(extractBefore(playlist(i).name,"."))); % save video file name number
        end
        
        play_list(i,2) = single(playlist(i).duration);
        
        if ~isempty(playlist(i).startTime)
            play_list(i,3) = single(playlist(i).startTime);
        else
            play_list(i,3) = 0; % case startTime is empty due to program ends before all videos were played
        end
        if ~isempty(playlist(i).endTime)
            play_list(i,4) = single(playlist(i).endTime);
        else
            play_list(i,4) = 0; % case endTime is empty due to program ends before all videos were played
        end
        
        if ~isempty(playlist(i).startFrame)
            play_list(i,5) = single(playlist(i).startFrame);
        else
            play_list(i,5) = 0; % case endTime is empty due to program ends before all videos were played
        end
        if ~isempty(playlist(i).endFrame)
            play_list(i,6) = single(playlist(i).endFrame);
        else
            play_list(i,6) = 0; % case endTime is empty due to program ends before all videos were played
        end
        
        frame__dur_val = playlist(i).endFrame - playlist(i).startFrame + 1;
        if ~isempty(frame__dur_val)
            play_list(i,7) = frame__dur_val;
        end
        
        frame_count_val = playlist(i).endFrame - playlist(i).startFrame + 1;
        if ~isempty(frame_count_val)
            playlist(i).frames_count = frame_count_val;
        end
        
        play_list(i,8) = single(mean_fps(i));
        playlist(i).AVG_FPS = mean_fps(i);
        
    end
    
    properties.var_list = var_list;
    properties.play_list = play_list;
    properties.playlist = playlist;
    properties.play_list_fields = ["File Name", "Duration", "Start time", "End time", "start frame", "end frame", "AVG FPS"];
    
end

properties.exp_remarks = app.RemarksEditField.Value; % Saves the experiment remarks text
properties.raw_timing = raw_timing;
properties.t = t';
properties.frame_rate = properties.constantFrameRate;
properties.timing_fields = ["Elapsed time (sec)", "FPS", "played video index", "FPS corrector"];

save(filename,'properties','-append'); % adds variables to the saved data file

%catch
%    err = 1;
%end
err = 0;

end