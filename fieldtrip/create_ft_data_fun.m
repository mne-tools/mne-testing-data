function create_ft_data_fun(cfg)
% check cfg
ft_checkconfig(cfg, 'required', {'name', 'file_name'});
cfg.crop = ft_getopt(cfg, 'crop', 2);
cfg.prestim = ft_getopt(cfg, 'prestim', 0.01);
cfg.poststim = ft_getopt(cfg, 'poststim', 0.01);
cfg.precision = ft_getopt(cfg, 'precision', 'double');
cfg.eventtype = ft_getopt(cfg, 'eventtype', 'None');
cfg.remove_channels = ft_getopt(cfg, 'remove_channels', []);

cfg_local = cfg;

full_dataset_path = fullfile(fileparts(pwd), cfg_local.file_name);

% set further variables
results_path_base = 'ft_test_data';
results_path = fullfile(results_path_base, cfg_local.name);

mkdir(results_path)

% load the raw data
cfg = [];
cfg.trialdef.triallength = Inf;
cfg.dataset = full_dataset_path;
cfg.precision = cfg_local.precision;

cfg = ft_definetrial(cfg);

data = ft_preprocessing(cfg);

% crop the data
cfg = [];
cfg.latency = [0 cfg_local.crop];

data = ft_selectdata(cfg, data);

% remove channels
all_chans = 1:length(data.label);
all_chans(cfg_local.remove_channels) = [];

cfg_local.removed_chan_names = data.label(cfg_local.remove_channels)

cfg = [];
cfg.channel = all_chans;

data = ft_selectdata(cfg, data);

% save the raw data...
data = rmfield(data, {'cfg', 'hdr'});
if strcmp(cfg_local.precision, 'single')
  data = ft_struct2single(data);
end %if

save(fullfile(results_path, 'raw_v7.mat'), '-v7', 'data', 'cfg_local')
save(fullfile(results_path, 'raw_v73.mat'), '-v7.3', 'data', 'cfg_local')

if strcmp(cfg_local.eventtype, 'None')
  return
end %if

% get epoched data
cfg = [];
cfg.trialdef.eventtype = cfg_local.eventtype;
cfg.trialdef.eventvalue = cfg_local.eventvalue;
cfg.trialdef.prestim = cfg_local.prestim;
cfg.trialdef.poststim = cfg_local.poststim;
cfg.dataset = full_dataset_path;

cfg = ft_definetrial(cfg);

data = ft_redefinetrial(cfg, data);

% only leave good trials in
good_trials = cellfun(@(x) ~any(isnan(x(:))), data.trial);

if sum(good_trials) < 3
  error('not enough trials found. at least 3 needed. increase cfg.crop');
end %if

cfg = [];
cfg.trials = good_trials;

data = ft_selectdata(cfg, data);

% save the epoched data...
data = rmfield(data, {'cfg', 'hdr'});
if strcmp(cfg_local.precision, 'single')
  data = ft_struct2single(data);
end %if
save(fullfile(results_path, 'epoched_v7.mat'), '-v7', 'data', 'cfg_local')
save(fullfile(results_path, 'epoched_v73.mat'), '-v7.3', 'data', 'cfg_local')

% run timelockanalysis
cfg = [];

data = ft_timelockanalysis(cfg, data);

% save the averaged data...
data = rmfield(data, {'cfg'});
if strcmp(cfg_local.precision, 'single')
  data = ft_struct2single(data);
end %if
save(fullfile(results_path, 'averaged_v7.mat'), '-v7', 'data', 'cfg_local')
save(fullfile(results_path, 'averaged_v73.mat'), '-v7.3', 'data', 'cfg_local')
end

