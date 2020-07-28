%%  Code written in MATLAB 2018b by Shaul Shvimmer, Electro-Optical engineering M.Sc student. saulsh@post.bgu.ac.il
clear all;
close all;
clc
tic

%% Calculate ROI's pixel's intensity average

file_name = 'Shauls experiment';
save_it = 1; % 1: yes, 0: no
roi_labels = ["Forehead", "Nose", "Left cheek", "Right cheek", "Lip", "Background"];
%roi_labels = "All frame";
remarks = '6 ROIs'; %remarks = 'IR: eyes, VIS: eyes';
channel = [1, 1, 1]; % [VIS, NIR, IR] 0: yes, 1: no

[vis, nir, ir] = get_data(file_name, save_it, channel, roi_labels, remarks);

%% ROI's intensity comparison

folder = 'Analayzed data\';
dir_file_list = dir(folder);
dir_file_list = dir_file_list(~ismember({dir_file_list.name},{'.','..'}));

files2process = [15, 8];%[1, 18]; % choose indexes of data files to calc

channel = 'ir'; % VIS / NIR / IR / VISR / VISG / VISB / NIRR / NIRG / NIRB
disp_last_frames = 0; % 1 / 0
mode = 'avg'; % diff / avg / std
comparison = 'summary'; % file / roi / summary
group_by = 'Emotions'; % Played_order / Video_index / Emotions
ir_back_sub = 6; % 0: off, x: subtract ROI x from the others. (for IR data only!)

filter_type = 'no'; % 'low' / 'high' / 'bandpass' / 'median' / 'dc' / 'no'
cutoff_freq = [0.8, 1.5]; % positive number in case filter is low / high. for bandpass use: [f_low, f_high]

[var_names_list, emotions_list] = intensity_comparison(channel, folder, files2process,...
    disp_last_frames, mode, comparison, ir_back_sub, group_by,...
    filter_type, cutoff_freq);

%% Plot signal

file_name = 'FullPilot Sub3';
subFolder = 'Analayzed data\';
file2load = fullfile(subFolder,file_name);

load(file2load);
subplot = 16;
frame_plot = 0;
ir_back_sub = 0; % 0: off, x: subtract ROI x from the others.
group_by = 'Emotions'; % Played_order / Video_index / Emotions

filter_type = 'dc'; % 'low' / 'high' / 'bandpass' / 'median' / 'dc' / 'no'
cutoff_freq = [0.2, 0.4]; % positive number in case filter is low / high. for bandpass use: [f_low, f_high]

signal_plot(ir, 'sig', subplot, frame_plot, filter_type, cutoff_freq, ir_back_sub, group_by)

%% Signals comparison

folder = 'Analayzed data';
dir_file_list = dir(folder);
dir_file_list = dir_file_list(~ismember({dir_file_list.name},{'.','..'}));

files2process = 6:8; % choose indexes of data files to calc

roi_idx = 1;
group_by = 'Emotions'; % Played_order / Video_index / Emotions
subplot = 16;

filter_type = 'dc'; % 'low' / 'high' / 'bandpass' / 'median' / 'dc' / 'no'
cutoff_freq = 1;%[0.2, 0.4]; % positive number in case filter is low / high. for bandpass use: [f_low, f_high]

signals_comparison('ir', subplot, filter_type, cutoff_freq, folder, files2process, roi_idx, group_by)

%% FFT

load('Analayzed data/Shauls experiment');
subplot = 16;
roi_idx = 1;
freq_limit = 0; %[0.1, 2]; % 2 element vector as frequency (x-axis) limits or 1 element for none.
pow_limit = 0; %[0, 1]; % 2 element vector as power (y-axis) limits or 1 element for none.
filter_type = 'dc'; % 'low' / 'high' / 'bandpass' / 'median' / 'dc' / 'no'
cutoff_freq = 0.02; % positive number in case filter is low / high. for bandpass use: [f_low, f_high]
group_by = 'Emotions'; % Played_order / Video_index / Emotions

FFT_plot(nir, 'sig', freq_limit, pow_limit, subplot, filter_type, cutoff_freq, roi_idx, group_by)

%% STFT

subplot = 16;
freq_limit = [0.5, 3]; % 2 element vector as frequency (x-axis) limits or 1 element for none.
plotMax = 0; % plot maximum value of each frame: 0 = no, 1 = yes.
ns = 6; % divide the signal into ns sections of equal length
ov = 0.5; % precentage overlap between sections

filter_type = 'dc'; % 'low' / 'high' / 'bandpass' / 'median' / 'dc' / 'no'
cutoff_freq = [0.5, 3]; % positive number in case filter is low / high. for bandpass use: [f_low, f_high]

STFTplot(nir, 'sig', freq_limit, subplot, plotMax, ns, ov, filter_type, cutoff_freq);

%% CWT

subplot = 16;
plotMax = 0; % plot maximum value of each frame: 0 = no, 1 = yes.

filter_type = 'bandpass'; % 'low' / 'high' / 'bandpass' / 'median' / 'dc' / 'no'
cutoff_freq = [0.5, 3]; % positive number in case filter is low / high. for bandpass use: [f_low, f_high]

filter_bank.gamma = 3; % standard = 3; must be greater then 1 and lower then timeBandwidth.
filter_bank.timeBandwidth = 10; % must be a scalar in the range 3-120. The standard deviation of the Morse wavelet in time is approximately sqrt(TimeBandwidth/2). The standard deviation of the Morse wavelet in frequency is approximately 1/2*sqrt(2/TimeBandwidth)
filter_bank.VoicesPerOctave = 48; % must be an even integer from 4 to 48, defines the number of scales of the wavelet, between integer scales (fractions)

filter_bank.freq_limit = [0.1, 0.6]; % 2 element vector as x axis (frequency) limits
%CWT_plot(ir, 'IR', plotMax, filter_bank, subplot, filter_type, cutoff_freq);

filter_bank.freq_limit = [0.5, 2]; % 2 element vector as x axis (frequency) limits
CWT_plot(vis, 'VIS', plotMax, filter_bank, subplot, filter_type, cutoff_freq);

%% Play video

% video file name to open:
%subFolder = 'E:\Thesis data\';
subFolder = 'Recordings';
file_name = 'Shauls experiment.mat';
file2load = fullfile(subFolder,file_name);

channel = [1, 1, 1]; % [VIS, NIR, IR] 0: yes, 1: no
fast_play = 0; % 0: regular / manual, 1: fast
segment_time = 0; % time between frames [sec]
show_differences = 0; % 0-1: no (regular), >2: show frame differences between this value.
video_idx = 51; % video number to play

play(file2load, channel, video_idx, fast_play, segment_time, show_differences);

