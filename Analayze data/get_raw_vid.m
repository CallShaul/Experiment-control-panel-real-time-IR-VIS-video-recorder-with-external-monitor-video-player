function [raw_vis, raw_nir, raw_ir, vars, vars_idx] = get_raw_vid(file2load, idx, channel, properties)

looking4 = idx;
idx = 1;
cam_num = 0;
vid_num = 0;
vis = 0;
nir = 0;
ir = 0;

file_details = whos('-file', file2load); % get variables list from data file
max_data_vars = size(properties.var_list, 2);

if properties.RGB_camera
    cam_num = cam_num + 1;
end
if properties.NIR_camera
    cam_num = cam_num + 1;
end
if properties.LWIR_camera
    cam_num = cam_num + 1;
end

while idx <= max_data_vars && vid_num ~= looking4

    checked_var = file_details(idx).name; % correlates IR data segment to VIS data segment
    vid_num = str2double(extractAfter(extractAfter(checked_var, '_'), '_'));

    idx = idx + 1;
end

if vid_num ~= looking4
    raw_vis = 0;
    raw_nir = 0;
    raw_ir = 0;
    vars = 0;
    vars_idx = 0;
    return
end

for k=0:cam_num-1
    var = string(file_details(idx-1 + k*max_data_vars).name);
    vars(k+1) = var;
    var_check = extractBefore(var, '_');
    if strcmp(var_check, 'VIS')
        vis = k+1;
    end
    if strcmp(var_check, 'NIR')
        nir = k+1;
    end
    if strcmp(var_check, 'IR')
        ir = k+1;
    end
end

vars_idx = [vis, nir, ir];

if vis ~= 0 && channel(1) == 1
    load(file2load, vars(vis));
end
if nir ~= 0 && channel(2) == 1
    load(file2load, vars(nir));
end
if ir ~= 0 && channel(3) == 1
    load(file2load, vars(ir));
end

if exist(vars(vis), 'var')
    eval(['raw_vis = ', char(vars(vis)),';']);
else
    raw_vis = 0;
end

if exist(vars(nir), 'var')
    eval(['raw_nir = ', char(vars(nir)),';']);
else
    raw_nir = 0;
end

if exist(vars(ir), 'var')
    eval(['raw_ir = ', char(vars(ir)), ';']);
else
    raw_ir = 0;
end

end