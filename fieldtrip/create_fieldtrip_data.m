%% clear
clear all global
restoredefaultpath

%% set variable
path_to_fiff = '../MEG/sample';
raw_fiff_fname = 'sample_audvis_trunc_raw.fif';

results_path = 'from_mne_sample';

%% get fieldtrip folder from ENV variable
ft_path = getenv('FT_PATH');

%% add ft path and initialize FieldTrip
addpath(ft_path)
ft_defaults

%% load the whole raw fiff file
cfg = [];
cfg.trialdef.triallength = Inf;
cfg.dataset = fullfile(path_to_fiff, raw_fiff_fname);

cfg = ft_definetrial(cfg);

data = ft_preprocessing(cfg);

%% save the raw data...
save(fullfile(results_path, 'raw_v7.mat'), '-v7', 'data')
save(fullfile(results_path, 'raw_v73.mat'), '-v7.3', 'data')

%% get epoched data
cfg = [];
cfg.trialdef.eventtype = 'STI 014';
cfg.trialdef.eventvalue = [1, 2, 3];
cfg.trialdef.prestim = 0.05;
cfg.trialdef.poststim = 0.05;
cfg.dataset = fullfile(path_to_fiff, raw_fiff_fname);

cfg = ft_definetrial(cfg);

data = ft_preprocessing(cfg);

%% save the epoched data...
save(fullfile(results_path, 'epoched_v7.mat'), '-v7', 'data')
save(fullfile(results_path, 'epoched_v73.mat'), '-v7.3', 'data')

%% run timelockanalysis
cfg = [];

data = ft_timelockanalysis(cfg, data);

%% save the averaged data...
save(fullfile(results_path, 'averaged_v7.mat'), '-v7', 'data')
save(fullfile(results_path, 'averaged_v73.mat'), '-v7.3', 'data')