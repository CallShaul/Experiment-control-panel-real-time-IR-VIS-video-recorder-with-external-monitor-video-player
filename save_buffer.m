function [err, properties] = save_buffer(app, properties, filename, playlist, buffer_VIS, buffer_NIR, buffer_IR,...
    RGB_frame_err, NIR_frame_err, LWIR_frame_err, vid_num, buff_idx)

if buff_idx == 0
    err = 0;
    return;
end

%try

if properties.flag_IR_camera_on_black == 1 && properties.LWIR_camera == 1
    %err = status(app, 'Saving data to file & performing IR camera flag (Temp. drift reset)...', 'g', 1, 0);
    app.Status1.FontColor = [0.29,0.58,0.07]; % dark green
    app.Status1.Value = sprintf('%s', ['Saving ', num2str(buff_idx), ' frames to file & performing IR camera flag...']);
else
    %err = status(app, 'Saving data to file...', 'g', 1, 0);
    app.Status1.FontColor = [0.29,0.58,0.07]; % dark green
    app.Status1.Value = sprintf('%s', ['Saving ', num2str(buff_idx), ' frames to file...']);
end

drawnow(); % updates callback functions

if properties.save_data == 1 && properties.popup == 1 % case there was a questions pop-up data to save
    
    global feedback;
    properties.feel = uint8(feedback.feel);
    properties.wake = uint8(feedback.wake);
    properties.posneg = uint8(feedback.posneg);
    save(filename, 'properties', '-append'); % adds the variables to the saved data file
    
end

if properties.playVideofiles == 1 && properties.saveONblack == 1 && properties.save_vid_by_order == 0
    
    org_vid_name = extractBefore(playlist(vid_num).name,"."); % get file name
    vid_name = str2num(org_vid_name); % get it to numerical value
    
    if isvarname(['VIS_', org_vid_name]) == 1
        
        VIS_name = ['VIS_', org_vid_name];
        NIR_name = ['NIR_', org_vid_name];
        IR_name = ['IR_', org_vid_name];
        
    elseif isempty(vid_name) == 1
        
        vid_name = matlab.lang.makeValidName(org_vid_name); % change the name to something similar and legal
        vid_name = strcat(vid_name,['_', num2str(vid_num)]);
        
        VIS_name = ['VIS_', vid_name];
        NIR_name = ['NIR_', vid_name];
        IR_name = ['IR_', vid_name];
        
    end
    
elseif properties.playVideofiles == 1 && properties.saveONblack == 0
    vid_name = 0;
    VIS_name = ['VIS_', num2str(vid_name)];
    NIR_name = ['NIR_', num2str(vid_name)];
    IR_name = ['IR_', num2str(vid_name)];
else
    vid_name = vid_num; % case there only one data file
    VIS_name = ['VIS_', num2str(vid_name)];
    NIR_name = ['NIR_', num2str(vid_name)];
    IR_name = ['IR_', num2str(vid_name)];
end

if properties.RGB_camera == 1 && RGB_frame_err == 0
    
    if ndims(buffer_VIS) == 3
        buffer_VIS = buffer_VIS(:,:,1:buff_idx);
    elseif ndims(buffer_VIS) == 4
        buffer_VIS = buffer_VIS(:,:,:,1:buff_idx);
    end
    
    eval([VIS_name, ' = buffer_VIS;']); % get the desired signal
    save(filename, VIS_name,'-append'); % adds variables to the saved data file
    
end

if properties.NIR_camera == 1 && NIR_frame_err == 0
    
    if ndims(buffer_NIR) == 3
        buffer_NIR = buffer_NIR(:,:,1:buff_idx);
    elseif ndims(buffer_VIS) == 4
        buffer_NIR = buffer_NIR(:,:,:,1:buff_idx);
    end
    
    eval([NIR_name, ' = buffer_NIR;']); % get the desired signal
    save(filename, NIR_name,'-append'); % adds variables to the saved data file
    
end

if properties.LWIR_camera == 1 && LWIR_frame_err == 0
    
    if ndims(buffer_IR) == 3
        buffer_IR = buffer_IR(:,:,1:buff_idx);
    elseif ndims(buffer_IR) == 4
        buffer_IR = buffer_IR(:,:,:,1:buff_idx);
    end
    
    eval([IR_name, ' = buffer_IR;']); % get the desired signal
    save(filename,IR_name,'-append'); % adds variables to the saved data file
    
end

if RGB_frame_err ~= 0
    err = status(app, 'Done Saving data (RGB camera is down)', 'r', 1, 0);
elseif RGB_frame_err ~= 0
    err = status(app, 'Done Saving data (NIR camera is down)', 'r', 1, 0);
elseif RGB_frame_err ~= 0
    err = status(app, 'Done Saving data (LWIR camera is down)', 'r', 1, 0);
else
    err = status(app, 'Done Saving data', 'g', 1, 0);
end

%catch
%err = status(app, 'Error Saving buffer data to file!', 'r', 1, 1);
%end

end

