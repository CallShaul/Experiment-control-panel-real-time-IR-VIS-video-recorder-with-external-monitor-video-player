function err = save_parameters(properties, filename, t, fps, playlist)

try
    
    if properties.save_data == 1 && properties.popup == 1 % case there was a questions pop-up
        
        global feedback;
        properties.feel = feedback.feel;
        properties.wake = feedback.wake;
        properties.posneg = feedback.posneg;
        
    end
    
    if properties.playVideofiles == 1
        
        list_length = length(playlist);
        fps(end,3) = 0; % fixing last index error
        vid_num = fps(:,3);
        
        for i=1:list_length
            
            idxes = uint16(find(vid_num == i)); % find indexes of video number i
            idxes = idxes(2:end-1); % drop the first and the last value for the average calculation
            mean_fps(i) = mean(fps(idxes,1)); % calculate the average FPS
            
        end
        
        for i=1:list_length % creates double array for relevant data
            
            play_list(i,1) = str2double(extractBefore(playlist(i).name,"."));
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
            
            play_list(i,7) = single(mean_fps(i));
            playlist(i).AVG_FPS = mean_fps(i);
            
        end
        
        properties.play_list = play_list;
        properties.playlist = playlist;
        properties.play_list_fields = ["File Name", "Duration", "Start time", "End time", "start frame", "end frame", "AVG FPS"];    
        
    end
    properties.fps = fps;
    properties.t = t';
    properties.frame_rate = properties.constantFrameRate;
    properties.fps_fields = ["FPS", "elapsed time (sec)", "played video number (zero is black screen)"];
    
    save(filename,'properties','-append'); % adds variables to the saved data file
    
catch
    err = 1;
end
err = 0;

end