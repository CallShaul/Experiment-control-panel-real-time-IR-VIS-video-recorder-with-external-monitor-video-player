function bar_plot_summary(sig_avg, sig_max, sig_min, sig_std, channel, dir_file_list,...
    files2process, mode, roi_labels, emotions_list, roi, roi_found_err)

sub = 5; % number of emotions
%vids_num = size(sig_avg, 2);
roi_num = size(sig_avg, 3);
%vids2process = 1:vids_num;
batch = 1;
sub_count = 1;
i_counter = 1;
emotions_letters = ['N'; 'D'; 'F'; 'A'; 'S'];
exp = size(emotions_list, 2);
emot_idx = ones(sub + 1, exp);

for k=1:exp
    
    emotions_list_vec = emotions_list(:,k);
    emotions_list_vec(cellfun('isempty',emotions_list_vec)) = [];
    last = emotions_list_vec(1, 1);
    i_counter = 1;
    
    for i=1:size(emotions_list_vec, 1)
        if ~strcmp(last, emotions_list_vec(i, 1))
            last = emotions_list_vec(i, 1);
            emot_idx(i_counter+1, k) = i;
            i_counter = i_counter + 1;
        end
    end

end

i_counter = 1;

for k=1:exp
    sig_vec = sig_avg(k, :);
    sig_vec(sig_vec == 0) = [];
    siglen(k) = length(sig_vec);
    for i=1:sub
        signal_avg(k, i) = mean(sig_avg(k, emot_idx(i, k):emot_idx(i+1, k), :), 2);
        signal_max(k, i) = max(sig_max(k, emot_idx(i, k):emot_idx(i+1, k), :), [], 2);
        signal_min(k, i) = min(sig_min(k, emot_idx(i, k):emot_idx(i+1, k), :), [], 2);
        signal_std(k, i) = std(sig_std(k, emot_idx(i, k):emot_idx(i+1, k), :), 0, 2);
    end
end

errlow = signal_avg - signal_min;
errhigh = signal_max - signal_avg;

if strcmp(mode, 'diff')
    bar_data = errhigh - errlow;
elseif strcmp(mode, 'avg')
    bar_data = signal_avg;
elseif strcmp(mode, 'std')
    bar_data = signal_std;
end

bar_data(bar_data == 0) = nan;
nan_loc = isnan(bar_data);

k = 1;
for i = files2process
    xvec(k) = categorical({append('(', num2str(k) ,') ' , dir_file_list(i).name,...
        ' [', num2str(siglen(k)), ' vids]')});
    first_nan = find(nan_loc(k,:)==1);
    if isempty(first_nan)
        legend_std(k) = std(bar_data(k,:));
    else
        legend_std(k) = std(bar_data(k,1:first_nan(1,1)-1));
    end
    legend_range(k) = max(bar_data(k,:)) - min(bar_data(k,:));
    std_txt(k) = 'STD ' + string(k) + ': ' + string(round(legend_std(k), 3));
    range_txt(k) = 'Range ' + string(k) + ': ' + string(round(legend_range(k), 3));
    k = k + 1;
end

for i=1:roi_num
    
    if roi == 0 || roi_found_err == 1
        str = ['Roi: ', char(roi_labels(i)), ', Channel: ', channel];
    else
        str = ['Roi: ', char(roi_labels(roi)), ', Channel: ', channel];
    end
    figure('Name', str); % opens a new figure window
    sgtitle(str); % plots the emot_idx-title
    
    if strcmp(channel, 'Red')
        b = bar(xvec, bar_data(:,:,i), 'BarWidth', 0.6, 'FaceColor', 'r');
    elseif strcmp(channel, 'Green')
        b = bar(xvec, bar_data(:,:,i), 'BarWidth', 0.6, 'FaceColor', 'g');
    elseif strcmp(channel, 'Blue')
        b = bar(xvec, bar_data(:,:,i), 'BarWidth', 0.6, 'FaceColor', 'b');
    else
        b = bar(xvec, bar_data(:,:,i), 'BarWidth', 0.6, 'FaceColor', [50 50 50]/255);
    end

    for k=1:5
        xtips1 = double(b(k).XEndPoints);
        ytips1 = double(b(k).YEndPoints);
        labels1 = emotions_letters(k);
        text(xtips1,ytips1,labels1,'HorizontalAlignment','center', 'VerticalAlignment','bottom')
    end

    xlabel('File name');
    mini = min(min(bar_data(:,:,i)));
    maxi = max(max(bar_data(:,:,i)));
    ylim([mini - 0.01*mini, maxi + 0.01*maxi]);
    axis on;
    
    if strcmp(channel,'IR') == 1
        ylabel('Temperature [C]');
    else
        ylabel('Gray level');
    end
    
    if i == 1
        y_loc = max(max(max(bar_data)));
        text(0, double(y_loc), std_txt)
        text(0, double(y_loc*0.97), range_txt)
    end
    
    sub_count = sub_count + 1;
    if mod(i_counter, sub) == 0 && i ~= roi_num 
        batch = batch + 1;
        sub_count = 1;
    end
    i_counter = i_counter + 1;
    
end

end

