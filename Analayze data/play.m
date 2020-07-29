function play(file2load, channel, video_idx, fast_play, segment_time, diff)

load(file2load, 'properties')

[raw_vis, raw_nir, raw_ir, var_name, ~] = get_raw_vid(file2load, video_idx, channel, properties); % get video from data file

mode = 0;
flag = 0;

vis_dim = ndims(raw_vis);
if vis_dim > 2
    len = size(raw_vis, vis_dim);
    mode = mode + 1;
end
nir_dim = ndims(raw_nir);
if nir_dim  > 2
    len = size(raw_nir, nir_dim);
    mode = mode + 1;
end
ir_dim = ndims(raw_ir);
if ir_dim > 2
    len = size(raw_ir, ir_dim);
    mode = mode + 1;
end

if mode == 0
    disp('Error loading video from data file.');
    return
end

if diff
    diff = 0;
end

if isfield(properties, 'play_list')
    frame_rate = properties.play_list(video_idx, 8);
else
    frame_rate = properties.constantFrameRate;
end

if segment_time == 0
    segment_time = 1/frame_rate; % original frame time
end

i = 1;
fig = figure();
name = char(extractAfter(var_name(1), '_'));
fig.Name = ['Video file: ', name]; % print signal's title
tStart = tic;

if vis_dim == 3
    sum_diff_img = uint8(zeros(size(raw_vis(:,:,1))));
elseif vis_dim == 4
    sum_diff_img = uint8(zeros(size(raw_vis(:,:,:,1))));
end

%tTotal = tic;

while(i < (len - diff)) & (ishandle(fig))
    
    if mode == 1
        
        if channel(1) % case VIS
            if vis_dim == 4
                imagesc(raw_vis(:,:,:,i));
            elseif vis_dim ==3
                imagesc(raw_vis(:,:,i));
                colormap(gray);
            end
        elseif channel(2) % case NIR
            if nir_dim == 4
                imagesc(raw_nir(:,:,:,i));
            elseif nir_dim ==3
                imagesc(raw_nir(:,:,i));
                colormap(gray);
            end
        elseif channel(3) % case IR
            if ir_dim == 4
                imagesc(raw_ir(:,:,:,i));
            elseif ir_dim ==3
                imagesc(raw_ir(:,:,i));
                colormap(gray);
            end
        end
        
    elseif mode == 2
        
        if channel(1) && channel(2)% case VIS
            
            imagesc(subplot(1,2,1));
            if vis_dim == 4
                imagesc(raw_vis(:,:,:,i));
            elseif vis_dim ==3
                imagesc(raw_vis(:,:,i));
                colormap(gray);
            end
            
            imagesc(subplot(1,2,2));
            if nir_dim == 4
                imagesc(raw_nir(:,:,:,i));
            elseif nir_dim ==3
                imagesc(raw_nir(:,:,i));
                colormap(gray);
            end
            
        elseif channel(1) && channel(3)% case VIS
            
            imagesc(subplot(1,2,1));
            if vis_dim == 4
                imagesc(raw_vis(:,:,:,i));
            elseif vis_dim ==3
                imagesc(raw_vis(:,:,i));
                colormap(gray);
            end
            
            imagesc(subplot(1,2,2));
            if ir_dim == 4
                imagesc(raw_ir(:,:,:,i));
            elseif ir_dim ==3
                imagesc(raw_ir(:,:,i));
                colormap(gray);
            end
            
        elseif channel(2) && channel(3)% case VIS
            
            imagesc(subplot(1,2,1));
            if nir_dim == 4
                imagesc(raw_nir(:,:,:,i));
            elseif nir_dim ==3
                imagesc(raw_nir(:,:,i));
                colormap(gray);
            end
            
            imagesc(subplot(1,2,2));
            if ir_dim == 4
                imagesc(raw_ir(:,:,:,i));
            elseif ir_dim ==3
                imagesc(raw_ir(:,:,i));
                colormap(gray);
            end
            
        end
        
    elseif mode == 3
        
        imagesc(subplot(1,3,1));
        if vis_dim == 4
            imagesc(raw_vis(:,:,:,i));
        elseif vis_dim ==3
            imagesc(raw_vis(:,:,i));
            colormap(gray);
        end
        imagesc(subplot(1,3,2));
        if nir_dim == 4
            imagesc(raw_nir(:,:,:,i));
        elseif nir_dim ==3
            imagesc(raw_nir(:,:,i));
            colormap(gray);
        end
        imagesc(subplot(1,3,3));
        if ir_dim == 4
            imagesc(raw_ir(:,:,:,i));
        elseif ir_dim ==3
            imagesc(raw_ir(:,:,i));
            colormap(gray);
        end
    end
    
    drawnow();
    t = toc(tStart);
    
    if fast_play == 0
        
        if t >= segment_time
            clc
            disp ([num2str(i/frame_rate), ' [Sec]']);
            
            if diff == 0
                i = i + 1;
            else
                i = i + diff;
            end
            
            tStart = tic;
        else
            pause(segment_time - t);
            clc
            disp ([num2str(i/frame_rate), ' [Sec]']);
            
            if diff == 0
                i = i + 1;
            else
                i = i + diff;
            end
            
            tStart = tic;
        end
        
    elseif fast_play == 1
        
        clc
        disp ([num2str(i/frame_rate), ' [Sec]']);
        
        if diff == 0
            i = i + 1;
        else
            i = i + diff;
            
        end
        tStart = tic;
        
    end
    
end % end while loop


%toc(tTotal)
if ishandle(fig)
    close(fig);
end

end