function CWT_plot(data, channel, plotMax, filter_bank, sub)

disp ([datestr(now), ' - Calculating CWT']); % displays progress

eval(['signal = data.', channel, ';']); % get the desired signal

if isfield(data, 'play_list') == 1
    play_list = data.play_list;
    exp_num = size(play_list,1); % find number of videos in recieved data
else
    exp_num = 1;
end

if exp_num > 1 && sub ~= 0 % case need to subplot
    
    iter_num = ceil(exp_num / sub); % calculates number of batches
    current_vid = 1;
    
    for i=1:1:iter_num
        
        str = ['File: ', data.fileName, ', Channel: ', channel ,', Batch: ', num2str(i)];
        figure('Name', str); % opens a new figure window
        sgtitle(str); % plots the idx-title
        
        for j=1:sub
            
            if current_vid == exp_num + 1
                break;
            end
            
            frame_rate = play_list(current_vid,7);
            len = double(play_list(current_vid,6) - play_list(current_vid,5) + 1);
            sig = signal(play_list(current_vid,5):play_list(current_vid,6));
            
            if numel(filter_bank.freq_limit) == 2
                freq_limit = filter_bank.freq_limit;
            else
                freq_limit = [0, frame_rate/2];
            end
            
            fb = cwtfilterbank('SamplingFrequency',frame_rate,'FrequencyLimits',freq_limit, ...
                'SignalLength',len,'WaveletParameters',[filter_bank.gamma,filter_bank.timeBandwidth],...
                'VoicesPerOctave',filter_bank.VoicesPerOctave); % prepares the CWT filter bank
            
            [tfr(:,:),frq] = cwt(double(sig),'FilterBank',fb); % 'morse', 'amor', and 'bump', specify the Morse, Morlet (Gabor), and bump wavelets respectively
            
            tvec = linspace(0, len, len) ./ frame_rate; % create the time axis vector
            
            subplot(ceil(sqrt(sub)),round(sqrt(sub)),j); % create subplot
            
            surface(tvec,frq,abs(tfr))
            title(['Video number: ' num2str(current_vid)]);
            xlabel('Time [sec]'); ylabel('Frequency [Hz]');
            shading interp
            colorbar;
            xlim([1, len/frame_rate]);
            
            %{
                if ndims(filter_bank.freq_limit) == 2
                    ylim([filter_bank.freq_limit]);
                end
            %}
            % set(gca,'yscale','log');
            
            clear frq tfr tvec
            current_vid = current_vid + 1;
        end
        
    end
    
else % case single plot is desired
    
    for i=1:1:exp_num
        
        if isfield(data, 'play_list') == 1
            frame_rate = play_list(i,7);
        elseif data.frame_rate ~= 0
            frame_rate = data.frame_rate;
        else
            frame_rate = mean(data.fps(:,1));
        end
        
        if exp_num == 1
            len = length(signal);
            sig = signal;
        else
            len = double(play_list(i,6) - play_list(i,5) + 1);
            sig = signal(play_list(i,5):play_list(i,6));
        end
        
        if numel(filter_bank.freq_limit) == 2
            freq_limit = filter_bank.freq_limit;
        else
            freq_limit = [0, frame_rate/2];
        end
        
        fb = cwtfilterbank('SamplingFrequency',frame_rate,'FrequencyLimits',freq_limit, ...
            'SignalLength',len,'WaveletParameters',[filter_bank.gamma,filter_bank.timeBandwidth],...
            'VoicesPerOctave',filter_bank.VoicesPerOctave); % prepares the CWT filter bank
        
        [tfr(:,:),frq] = cwt(double(sig),'FilterBank',fb); % 'morse', 'amor', and 'bump', specify the Morse, Morlet (Gabor), and bump wavelets respectively
        
        tvec = linspace(0, len, len) ./ frame_rate; % create the time axis vector
        
        figure('Name', ['File: ', data.fileName, ', Channel: ', channel , ', sub: ', num2str(i)]); % opens a new figure window
        
        surface(tvec,frq,abs(tfr))
        title(['Video number: ' num2str(i)]);
        xlabel('Time [sec]'); ylabel('Frequency [Hz]');
        shading interp
        colorbar;
        xlim([1, len/frame_rate]);
        %{
            if ndims(filter_bank.freq_limit) == 2
                ylim([filter_bank.freq_limit]);
            end
        %}
        % set(gca,'yscale','log');
        clear frq tfr tvec
    end
    
end

end