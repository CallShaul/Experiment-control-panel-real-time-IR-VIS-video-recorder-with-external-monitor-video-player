function data = IR_analysis(data, file2load, N, start_time, end_time, enhance_image, crop_cor1, ROIcomparison, average2zero)
%% Load data
tic
disp ('[0] Loading IR video data...');

try
    load(file2load);
catch
    error('Could not load data file') % no data file to process
    return 
end

if exist('buffer_IR','var') == 0
    error('No video file to process was found inside the selected data file') % no data file to process
    return
end

%% Prepare variables
k = 1;

if length(size(buffer_IR)) == 4 % in case color data exists in the file
    IRpalette = 1;
else
    IRpalette = 0;
end

len = length(buffer_IR); % number of recorded frames

%if frame_rate == 0
    frameRate = mean(FPS(:,1));
%else
    %frameRate = frame_rate; % assignts it to a local variable so function could work after vidObj was closed
%end

if start_time == 0 % setting parameters to the desired begining
    frameStart = 1;
else
    frameStart = round(start_time*frameRate);
end

if end_time == 0 % setting the end time in range
    end_time = (single(t(end,1)) / 1000);
    
    if end_time < 0.1
        end_time = (single(t(1,end)) / 1000); % temporary fix for old files
    end
end

frameStop = round(end_time*frameRate); % defining the frame number to stop the calculation at

if frameStop > len % for cases frameStop is larger then max frames
    frameStop = len;
end

duration = end_time-start_time;

data.IR_intens = double(zeros(floor(frameRate*(duration).*0.9), N^2));
if numel(ROIcomparison) == 4 | ROIcomparison == 1
data.IR_intens2 = double(zeros(floor(frameRate*(duration).*0.9), N^2));
end
cor = zeros(N^2,4);

%% loop over the frames
while (k <= (frameStop - frameStart + 1))% running on each frame of the video file
    clc
    disp ('[1] Extracting signal from face regions...'); % displays precentage of progress
    disp ([num2str(round((k /(frameRate*((duration))))*100)), ' [%]']);
    
    if IRpalette == 0
        frame = im2double(buffer_IR(:,:,k + frameStart - 1)); % reads current frame from gray IR video
    elseif IRpalette == 1
        frame = im2double(buffer_IR(:,:,:,k + frameStart - 1)); % reads current frame from color IR video
    end
    
    if enhance_image == 1 && IRpalette == 1
        frame = img_enhancement(frame); % calls image enhancement function
    end
    
    if k == 1 % case first loop run
        
        if crop_cor1 == 0
            crop_cor1 = ROIcrop(2, frame); % calls ROI crop function
        end
        
        if numel(ROIcomparison) == 4
            crop_cor2 = ROIcomparison;
        else
            if ROIcomparison == 1 % case the user need to provide 2nd ROI coordinates
                crop_cor2 = ROIcrop(2, frame); % calls ROI crop function again
            end
        end
        
    end
    
    cropped_frame = imcrop(frame,crop_cor1); % cropping the frame
    
    %if normalize == 1
    %    cropped_frame = cropped_frame ./ max(max(cropped_frame)); % normalize data to 0-1
    %end
    
    data.IR_intens(k,:) = intensity_calc(N, cropped_frame, 0); % calculate averaged intensity at ROI's
    
    if ROIcomparison(1) == 1 || numel(ROIcomparison) == 4 % case 2nd ROI needs to be calculated
        
        cropped_frame2 = cropped_frame2 ./ max(max(cropped_frame2)); % normalize data to 0-1
        
        %if normalize == 1
        %    cropped_frame2 = im2double(cropped_frame2); % normalize data to 0-1
        %end
        
        data.IR_intens2(k,:) = intensity_calc(N, cropped_frame2, 0); % calculate averaged intensity at 2nd ROI
        
    end
    
    if k == 1 % case first loop run
        cor = intensity_calc(N, cropped_frame, crop_cor1); % get all small ROI's cropped coordinates
        
        if ROIcomparison(1) == 1 || numel(ROIcomparison) == 4
            cor2 = intensity_calc(N, cropped_frame2, crop_cor2); % get all small ROI's cropped coordinates
        end
    end
    
    k = k + 1; % increasing the loop index for the next frame extraction itteration
end % end hasframe while loop

%% Some more calculations

data.IR_exist = 1;
data.IR_crop_cor1 = crop_cor1; % save cropping coordinates
data.frame_rate = frameRate;
data.FPS = single(FPS);
data.t = t;
data.N = N;
data.start_time = start_time;
data.end_time = end_time;

data.crop_cor1 = crop_cor1;
data.ROI1_size = size(cropped_frame);
data.ROI1_max_temp = max(data.IR_intens);
data.ROI1_min_temp = min(data.IR_intens);
data.ROI1_max_temp_diff = data.ROI1_max_temp - data.ROI1_min_temp;

if exist('play_list', 'var') == 1
    data.eventsTiming = play_list(:,3:4); % takes the start and end time of videos playback
end

if ROIcomparison(1) == 1 || numel(ROIcomparison) == 4
    data.IR_diff = abs(data.IR_intens - data.IR_intens2); % calculates the difference between the 2 ROI's
    data.IR_crop_cor2 = crop_cor2; % save 2nd cropping coordinates
    
    if average2zero == 1
        data.IR_intens2 = data.IR_intens2 - mean(data.IR_intens2);
    end
end

if average2zero == 1
    data.IR_intens = data.IR_intens - mean(data.IR_intens);
end

tvec = single((frameStart + 1 : length(data.IR_intens) + frameStart) ./ frameRate); % creates the time vector
data.tvec = tvec';
%% plot frame

file_name = retrieve_name(file2load); % get file name from full file path

figure('Name','IR camera: ROI selected');
imshow(frame,[]); axis on; % plotting image and channels locations
title(['Video file name: ', file_name], 'Interpreter', 'none');

for i=1:N^2 % 1st ROI
    rectangle('Position',cor(i,:),'LineWidth',1,'EdgeColor','k'); % prints channels (1st ROI) rectangular
    text(cor(i,1) + round(cor(i,3)/15), cor(i,2) +...
        round(cor(i,4)/15), num2str(i)); % prints channels numbers
end

if ROIcomparison(1) == 1 || numel(ROIcomparison) == 4 % 2nd ROI
    for i=1:N^2
        rectangle('Position',cor2(i,:),'LineWidth',1,'EdgeColor','b'); % prints channels (2nd ROI) rectangular
        text(cor2(i,1) + round(cor2(i,3)/15), cor2(i,2) +...
            round(cor2(i,4)/15), num2str(i)); % prints channels numbers
    end
end

%% Finish
clc
disp ('Done.');
toc
end % end of function