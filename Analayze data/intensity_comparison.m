function [var_names_list, emotions_list] = intensity_comparison(channel, folder, files2process,...
    disp_last_frames, mode, comparison, ir_back_sub, group_by,...
    filter_type, cutoff_freq)

if folder(end) ~= '\' % case last backslesh is missing
    folder = [folder, '\'];
end

dir_file_list = dir(folder);
dir_file_list = dir_file_list(~ismember({dir_file_list.name},{'.','..'}));
channel = upper(channel);
k_counter = 1;
vids2process = 1:1000;

for k = files2process
    
    exp_num_run = 1;
    i_counter = 1;
    
    for i = vids2process
        
        if exp_num_run == 1
            
            current_file = dir_file_list(k).name;
            dir_file_list(k).name = extractBefore(dir_file_list(k).name, "."); % remove '.mat' from file name
            file2load = fullfile([folder, current_file]);
            
            if strcmp(channel, 'VIS') || strcmp(channel, 'VISR') ||...
                    strcmp(channel, 'VISG') || strcmp(channel, 'VISB')
                load(file2load, 'vis', 'remarks', 'properties');
                eval('data = vis;');
            elseif strcmp(channel, 'NIR') || strcmp(channel, 'NIRR') ||...
                    strcmp(channel, 'NIRG') || strcmp(channel, 'NIRB')
                load(file2load, 'nir', 'remarks', 'properties');
                eval('data = nir;');
            elseif strcmp(channel, 'IR')
                load(file2load, 'ir', 'remarks', 'properties');
                eval('data = ir;');
            else
                disp('Error loading data from file, choose one of the following: VIS / NIR / IR / R / G / B');
                return
            end
            
            if strcmp(group_by, 'Played_order') || strcmp(group_by, 'Video_index')...
                    || strcmp(group_by, 'Emotions') || strcmp(comparison, 'summary')
                if strcmp(comparison, 'summary')
                    group_by = 'Emotions';
                    data = flipper(data, group_by); % arrange by emotions and remove empty spaces
                else
                    data = flipper(data, group_by); % flip data order and remove empty spaces
                end
            end
            
            last_frames_list{k_counter} = data{i}.last_frame; % get last frame image
            
        end
        
        if i <= length(data) && ~isempty(data{i})
            
            if (strcmp(data{i}.type, 'VIS') || strcmp(data{i}.type, 'NIR')) && ...
                    (strcmp(channel, 'VIS') || strcmp(channel, 'NIR'))
                
                var_names_list(i_counter, k_counter) = string(data{i}.var_name);
                emotions_list(i_counter, k_counter) = string(data{i}.expected_emotion);
                eval('sig = data{i}.sig;'); % get the desired signal
    
                fps = data{1, 1}.play_list(i,8);
                
                if strcmp(filter_type, 'low') || strcmp(filter_type, 'high') ||...
                        strcmp(filter_type, 'bandpass') || strcmp(filter_type, 'median') ||...
                        strcmp(filter_type, 'dc') % 'low' / 'high' / 'bandpass' / 'median' / 'no'
                    sig = filterit(sig, fps, filter_type, cutoff_freq, 1);
                end
                
                sig_avg(k_counter, i_counter, :) = mean(sig);
                sig_max(k_counter, i_counter, :) = max(sig);
                sig_min(k_counter, i_counter, :) = min(sig);
                sig_std(k_counter, i_counter, :) = std(sig);
                
            elseif (strcmp(data{i}.type, 'VIS') || strcmp(data{i}.type, 'NIR')) && ...
                    (strcmp(channel, 'VISR') || strcmp(channel, 'NIRR'))
                
                var_names_list(i_counter, k_counter) = string(data{i}.var_name);
                emotions_list(i_counter, k_counter) = string(data{i}.expected_emotion);
                eval('R = data{i}.R;'); % get the desired signal

                fps = data{1, 1}.play_list(i,8);
                
                if strcmp(filter_type, 'low') || strcmp(filter_type, 'high') ||...
                        strcmp(filter_type, 'bandpass') || strcmp(filter_type, 'median') ||...
                        strcmp(filter_type, 'dc') % 'low' / 'high' / 'bandpass' / 'median' / 'no'
                    R = filterit(R, fps, filter_type, cutoff_freq, 1);
                end
                
                sig_avg(k_counter, i_counter, :) = mean(R);
                sig_max(k_counter, i_counter, :) = max(R);
                sig_min(k_counter, i_counter, :) = min(R);
                sig_std(k_counter, i_counter, :) = std(R);
                
            elseif (strcmp(data{i}.type, 'VIS') || strcmp(data{i}.type, 'NIR')) && ...
                    (strcmp(channel, 'VISG') || strcmp(channel, 'NIRG'))
                
                var_names_list(i_counter, k_counter) = string(data{i}.var_name);
                emotions_list(i_counter, k_counter) = string(data{i}.expected_emotion);
                eval('G = data{i}.G;'); % get the desired signal

                fps = data{1, 1}.play_list(i,8);
                
                if strcmp(filter_type, 'low') || strcmp(filter_type, 'high') ||...
                        strcmp(filter_type, 'bandpass') || strcmp(filter_type, 'median') ||...
                        strcmp(filter_type, 'dc') % 'low' / 'high' / 'bandpass' / 'median' / 'no'
                    G = filterit(G, fps, filter_type, cutoff_freq, 1);
                end
                
                sig_avg(k_counter, i_counter, :) = mean(G);
                sig_max(k_counter, i_counter, :) = max(G);
                sig_min(k_counter, i_counter, :) = min(G);
                sig_std(k_counter, i_counter, :) = std(G);
                
            elseif (strcmp(data{i}.type, 'VIS') || strcmp(data{i}.type, 'NIR')) && ...
                    (strcmp(channel, 'VISB') || strcmp(channel, 'NIRB'))
                
                var_names_list(i_counter, k_counter) = string(data{i}.var_name);
                emotions_list(i_counter, k_counter) = string(data{i}.expected_emotion);
                eval('B = data{i}.B;'); % get the desired signal

                fps = data{1, 1}.play_list(i,8);
                
                if strcmp(filter_type, 'low') || strcmp(filter_type, 'high') ||...
                        strcmp(filter_type, 'bandpass') || strcmp(filter_type, 'median') ||...
                        strcmp(filter_type, 'dc') % 'low' / 'high' / 'bandpass' / 'median' / 'no'
                    B = filterit(B, fps, filter_type, cutoff_freq, 1);
                end
                
                sig_avg(k_counter, i_counter, :) = mean(B);
                sig_max(k_counter, i_counter, :) = max(B);
                sig_min(k_counter, i_counter, :) = min(B);
                sig_std(k_counter, i_counter, :) = std(B);
                
            elseif strcmp(data{i}.type, 'IR')
                
                var_names_list(i_counter, k_counter) = string(data{i}.var_name);
                emotions_list(i_counter, k_counter) = string(data{i}.expected_emotion);
                eval('sig = data{i}.sig;'); % get the desired signal
                
                if ir_back_sub ~= 0
                    temp_background = sig(:, ir_back_sub);
                    temp_initial_values = sig(1, :);
                    sig = sig - sig(:, ir_back_sub);
                    sig = sig - mean(sig);
                    sig = sig + temp_initial_values;
                    sig(:, ir_back_sub) = temp_background;
                end
                
                fps = data{1, 1}.play_list(i,8);
                
                if strcmp(filter_type, 'low') || strcmp(filter_type, 'high') ||...
                        strcmp(filter_type, 'bandpass') || strcmp(filter_type, 'median') ||...
                        strcmp(filter_type, 'dc') % 'low' / 'high' / 'bandpass' / 'median' / 'no'
                    sig = filterit(sig, fps, filter_type, cutoff_freq, 1);
                end
                
                sig_avg(k_counter, i_counter, :) = mean(sig);
                sig_max(k_counter, i_counter, :) = max(sig);
                sig_min(k_counter, i_counter, :) = min(sig);
                sig_std(k_counter, i_counter, :) = std(sig);
                
            end
            i_counter = i_counter + 1;
        end
        exp_num_run = exp_num_run + 1;
    end
    k_counter = k_counter + 1;
end

%% Prepares some variabls

roi_labels = data{1, 1}.roi_labels;

first  = extractBefore(group_by, '_');
if ~isempty(first)
    second  = extractAfter(group_by, '_');
    group_by = [first, ' ', second];
end

if strcmp(channel, 'VIS')
    ch_name = 'VIS';
elseif strcmp(channel, 'VISR')
    ch_name = 'VIS-Red';
elseif strcmp(channel, 'VISG')
    ch_name = 'VIS-Green';
elseif strcmp(channel, 'VISB')
    ch_name = 'VIS-Blue';
elseif strcmp(channel, 'NIR')
    ch_name = 'NIR';
elseif strcmp(channel, 'NIRR')
    ch_name = 'NIR-Red';
elseif strcmp(channel, 'NIRG')
    ch_name = 'NIR-Green';
elseif strcmp(channel, 'NIRB')
    ch_name = 'NIR-Blue';
elseif strcmp(channel, 'IR')
    ch_name = 'IR';
end

%% call bar plot function
if strcmp(group_by, 'Played_order') || strcmp(group_by, 'Video_index') || strcmp(group_by, 'Emotions')

    if strcmp(comparison, 'roi')
        bar_plot_roi(sig_avg, sig_max, sig_min, sig_std, ch_name, dir_file_list, files2process, mode, roi_labels, group_by)
    elseif strcmp(comparison, 'file')
        bar_plot_file(sig_avg, sig_max, sig_min, sig_std, ch_name, dir_file_list, files2process, mode, roi_labels, group_by)
    elseif strcmp(comparison, 'summary')
        bar_plot_summary(sig_avg, sig_max, sig_min, sig_std, ch_name, dir_file_list, files2process, mode, roi_labels, emotions_list)
    end

end

%% Display last frames

if disp_last_frames
    
    for k = 1:size(last_frames_list,2)
        
        f_name = dir_file_list(files2process(k)).name;
        figure('Name', f_name)
        sgtitle(f_name);
        imshow(last_frames_list{k}, [])
        
    end
    
end

end