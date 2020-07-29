function data = roi_intensity(vid, properties, file_name, var_name, vid_num, N, start_time,...
    end_time, enhance_image, crop_cors, newFrameRate, final_img_disp, roi_labels, videos_idx_emotions)
%% Pre-flight check

if ndims(vid) == 3
    dim4 = 0;
    len = size(vid, 3); % get number of recorded frames
elseif ndims(vid) == 4
    dim4 = 1;
    len = size(vid, 4); % get number of recorded frames
else
    disp('No video file to process was found inside the selected data file') % no data file to process
    return
end

%% Prepare variables

type = char(extractBefore(var_name, '_'));
vid_play_order = str2double(extractBefore(extractAfter(var_name, '_'), '_'));

if isfield(properties, 'frame_rate')
    frame_rate = properties.frame_rate;
else
    frame_rate = properties.constantFrameRate;
end

if isfield(properties, 'play_list') == 1
    
    NaNidx = find(isnan(properties.play_list(:,8)),1); % check if there's NaN in the properties.timing data vector

    if newFrameRate == 0 % case no need to change frame rate
        if frame_rate == 0
            frame_rate = properties.play_list(vid_play_order, 8);
        else
            newFrameRate = frame_rate;
        end
        skipper = 1;
    else
        skipper = newFrameRate / frame_rate; % calculates the skipper value
        skipper = round(1/skipper); % inverts and rounds the skipper value to the nearest decent value that can divide the original frmae rate
        newFrameRate = frame_rate / skipper; % updates the new frame rate value
        frame_rate = newFrameRate; % assignts it to a local variable so function could work after vidObj was closed
    end
    
else
    skipper = 1;
    %frameRate = mean(properties.raw_timing(:, 2));
end

if start_time == 0 % setting parameters to the desired begining
    frameStart = 1;
elseif isfield(properties, 'frame_rate')
    frameStart = round(start_time*frame_rate);
else
    frameStart = 1;
end

if end_time == 0 % setting the end time
    
    if isfield(properties, 'play_list')
        end_time = properties.play_list(vid_play_order, 2);
    elseif isfield(properties, 't')
        end_time = (single(properties.t(end,1)) / 1000);
    else
        end_time = len/frame_rate;
    end
    
    frameStop = len;
    
else
    frameStop = round(end_time*frame_rate); % defining the frame number to stop the calculation at
end

if frameStop > len % for cases frameStop is larger then max frames
    frameStop = len;
end

if size(crop_cors, 2) == 4
    ROIs_num = size(crop_cors, 1);
else
    ROIs_num = crop_cors;
    
    if dim4 == 1
        frame = vid(:,:,:,frameStart); % color
    else
        frame = vid(:,:,frameStart); % gray
    end
    
    if strcmp(type, 'VIS') || strcmp(type, 'NIR')
        frame = im2double(frame); % reads current frame from video
    elseif strcmp(type, 'IR')
        % change values from temperature (C) to uint8
        im = frame - min(min(frame));
        im = im ./ max(max(im));
        frame = im2uint8(im);
    end
    
    crop_cors = zeros(ROIs_num, 4);
    
    for i=1:ROIs_num
        crop_cors(i, :) = ROIcrop(2, frame); % calls ROI crop function
    end
end

numOfFrames = single(frameStop - frameStart + 1);
k = 1;

if dim4 == 1
    data.R = zeros(numOfFrames, ROIs_num, 'single');
    data.G = zeros(numOfFrames, ROIs_num, 'single');
    data.B = zeros(numOfFrames, ROIs_num, 'single');
end

data.sig = zeros(numOfFrames, ROIs_num, 'single');

%% loop over the frames

while k <= numOfFrames % running on each frame of the video file
    
    if dim4 == 1
        frame = vid(:,:,:,k + frameStart - 1); % color
    else
        frame = vid(:,:,k + frameStart - 1); % gray
    end
    
    if strcmp(type, 'VIS') || strcmp(type, 'NIR')
        frame = im2double(frame); % reads current frame from video
    end

    if enhance_image == 1
        frame = img_enhancement(frame); % calls image enhancement function
    end
    
    for i=1:ROIs_num
        
        cropped_frame{i} = imcrop(frame, crop_cors(i,:)); % cropping the frame

        if dim4 == 1

            data.R(k,i) = intensity_calc(N, cropped_frame{i}(:,:,1), 0); % calculate averaged R channel intensity at ROI's
            data.G(k,i) = intensity_calc(N, cropped_frame{i}(:,:,2), 0); % calculate averaged G channel at ROI's
            data.B(k,i) = intensity_calc(N, cropped_frame{i}(:,:,3), 0); % calculate averaged B channel at ROI's
        
            cropped_frame{i} = rgb2gray(cropped_frame{i});
            
        end
        
        data.sig(k,i) = intensity_calc(N, cropped_frame{i}, 0); % calculate averaged intensity at ROI's

    end
    k = k + 1;
end % end while

%% UV transformation for color video

if dim4 == 1
    
    V = 1.5.*data.R + 2.*data.G - 1.5.*data.B;
    U = 3.*data.R - 2.*data.G;
    
    lambda = std(U) ./ std(V);
    data.sig_uv = U - lambda.*V; % final data matrix: equation 3 in the paper

end

%% Parameters transfer

data.process_time = datetime;
data.process_time_unix = posixtime(datetime);
data.roi_labels = roi_labels;
data.type = type;
data.crop_cors = crop_cors;
data.play_order = uint8(vid_play_order);
data.var_name = char(extractAfter(var_name, '_'));
data.vid_num = vid_num;
data.file_name = file_name;
data.VIS_crop_cor1 = uint16(crop_cors); % save cropping coordinates
data.frame_rate = frame_rate;
data.N = N;
data.start_time = start_time;
data.end_time = end_time;
if isfield(properties, 't')
    data.t = properties.t;
end
if isfield(properties, 'raw_timing')
    data.raw_timing = properties.raw_timing;
end

if vid_num <= length(videos_idx_emotions)
    data.expected_emotion = videos_idx_emotions(vid_num, 2);
else
    data.expected_emotion = 'nan';
end

if properties.playVideofiles == 1
    
    if isfield(properties, 'timing')
        data.timing = properties.timing;
    end
    if isfield(properties, 'timing_fields')
        data.timing_fields = properties.timing_fields;
    end
    
    if exist('NaNidx', 'var')
        if isempty(NaNidx)
            data.playlist = properties.playlist;
            data.play_list = properties.play_list;
        else % case need to slice the NAN's
            data.playlist = properties.playlist;
            data.play_list = properties.play_list(1:NaNidx-1,:);
        end
    end
end

if properties.popup == 1
    try
        data.feel = properties.feel;
        data.posneg = properties.posneg;
        data.wake = properties.wake;
        data.age = properties.age;
        data.sex = properties.sex;
        data.orientation = properties.orientation;
    catch
    end
end

%% Show / Save last frame

if final_img_disp == 1
    
    figure('Name','vid camera: ROI selected');
    imshow(frame,[]); axis on; % plotting image and channels locations
    title(['Video file name: ', file_name], 'Interpreter', 'none');
    
    for i=1:ROIs_num % 1st ROI
        rectangle('Position', crop_cors(i,:),'LineWidth',1,'EdgeColor','k'); % prints channels (1st ROI) rectangular
        text(double(crop_cors(i,1) + round(crop_cors(i,3)/15)), double(crop_cors(i,2) +...
            round(crop_cors(i,4)/15)), num2str(i)); % prints channels numbers
    end
    
end
    
figure('Name','IR camera: ROI selected', 'visible', 'off');
imshow(frame,[]);
hold on;
axis on; % plotting image and channels locations
title(['Video file name: ', file_name], 'Interpreter', 'none');

for i=1:ROIs_num % 1st ROI
    rectangle('Position', crop_cors(i,:),'LineWidth',1,'EdgeColor','k'); % prints channels (1st ROI) rectangular
    text(double(crop_cors(i,1) + round(crop_cors(i,3)/15)), double(crop_cors(i,2) +...
        round(crop_cors(i,4)/15)), num2str(i)); % prints channels numbers
end

F = getframe;
data.last_frame = F.cdata; % save last frame into data
close(figure)

end % end of function