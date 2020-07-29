function [vis, nir, ir] = get_data(file_name, save_it, channel, roi_labels, remarks)
tic

num_crop_cors = size(roi_labels, 2);
vis_crop_cors = num_crop_cors;
nir_crop_cors = num_crop_cors;
ir_crop_cors = num_crop_cors;

max_loop_run = 1000; % 1000: scan all
final_img_disp = 0; % display last frame of each video: 0 = no, 1 = yes.
start_time = 0; % time to start the calculations. 0: runs from the begining of the video file
end_time = 0; % time to finish the calculations. 0: runs until the end of the video file
N = 1; % Divides the large ROI to NxN squares
newFrameRate = 0; % changes VID video frame rate
enhance_image = 0; % enhancment of the image before processing: 0 = no, 1 = yes.
%normalize = 1; % normalize graylevel. 0 = no, 1 = yes.

% video file name to open:
subFolder = 'D:\Experiment data\';
file2load = fullfile(subFolder, file_name);
file_details = whos('-file', file2load);
calc_count = 1;
k = 1;

try
    load('videos_idx_emotions', 'videos_idx_emotions');
catch
    disp('Error loading videos indexes - emotions correlation data from file')
    return
end

load(file2load, 'properties')
if isfield(properties, 'var_list')
    max_data_vars = size(properties.var_list, 2);
else
    how_many_cams = properties.RGB_camera + properties.NIR_camera + properties.LWIR_camera;
    max_data_vars = (size(file_details, 1)-1) / how_many_cams;  
end

for idx=1:max_loop_run
    
    [raw_vis, raw_nir, raw_ir, var_name, vars_idx] = get_raw_vid(file2load, idx, channel, properties); % get video from data file

    if ndims(raw_vis) > 2 || ndims(raw_nir) > 2 || ndims(raw_ir) > 2
        disp(['Calculating... ', num2str(calc_count), '/', num2str(max_data_vars), ' (',...
            num2str(round(((calc_count/max_data_vars)*100),2)), ' %)'])
        
        calc_count = calc_count + 1;
    end
    
    if exist('vis', 'var')
        vis(cellfun('isempty',vis)) = [];
    end
    if exist('nir', 'var')
        nir(cellfun('isempty',nir)) = [];
    end
    if exist('ir', 'var')
        ir(cellfun('isempty',ir)) = [];
    end
    
    if ndims(raw_vis) > 2 && channel(1) == 1
        if exist('vis','var') && isfield(vis{size(vis, 2)}, 'crop_cors')
            vis_crop_cors = vis{size(vis, 2)}.crop_cors;
        end
        vis{k} = roi_intensity(raw_vis, properties, file_name, var_name(vars_idx(1)), idx, N, start_time,...
            end_time, enhance_image, vis_crop_cors, newFrameRate, final_img_disp, roi_labels, videos_idx_emotions);
    elseif channel(1) == 1
        vis{k} = [];
    end
    
    if ndims(raw_nir) > 2 && channel(2) == 1
        if exist('nir','var') && isfield(nir{size(nir, 2)}, 'crop_cors')
            nir_crop_cors = nir{size(nir, 2)}.crop_cors;
        end

        nir{k} = roi_intensity(raw_nir, properties, file_name, var_name(vars_idx(2)), idx, N, start_time,...
            end_time, enhance_image, nir_crop_cors, newFrameRate, final_img_disp, roi_labels, videos_idx_emotions);
    elseif channel(2) == 1
        nir{k} = [];
    end
    
    if ndims(raw_ir) > 2 && channel(3) == 1
        if exist('ir','var') && isfield(ir{size(ir, 2)}, 'crop_cors')
            ir_crop_cors = ir{size(ir, 2)}.crop_cors;
        end
        ir{k} = roi_intensity(raw_ir, properties, file_name, var_name(vars_idx(3)), idx, N, start_time,...
            end_time, enhance_image, ir_crop_cors, newFrameRate, final_img_disp, roi_labels, videos_idx_emotions);
    elseif channel(3) == 1
        ir{k} = [];
    end
    
    k=k+1;
end

if exist('vis', 'var')
    vis(cellfun('isempty',vis)) = [];
end
if exist('nir', 'var')
    nir(cellfun('isempty',nir)) = [];
end
if exist('ir', 'var')
    ir(cellfun('isempty',ir)) = [];
end

disp ('Done calculating.');

%% Save data to file:

if save_it == 1
    
    disp ('Saving data file...');
    [~, dir_feedback, ~] = mkdir ('Analayzed data'); % creates dir if it doesn't exist yet
    filename = avoidOverwrite([file_name,'.mat'], [pwd, '\Analayzed data\'], 3);
    filename = erase(filename, '.mat');
    Analayzed_file_location =(['Analayzed data\', filename]);
    
    if exist('vis','var') || exist('nir','var') || exist('ir','var')
        save(Analayzed_file_location, 'properties','remarks');
    end
    
    if exist('vis','var')
        save(Analayzed_file_location, 'vis', '-append');
    else
        vis = 0;
    end
    
    if exist('nir','var')
        save(Analayzed_file_location, 'nir', '-append');
    else
        nir = 0;
    end
    
    if exist('ir','var')
        save(Analayzed_file_location, 'ir', '-append');
    else
        ir = 0;
    end
    
    disp(['Data file saved sucsusfully (', Analayzed_file_location, '.mat)'])
    
    sound(sin(1:3000))
    pause(0.25)
    sound(sin(1:3000))
    
end
toc
end

