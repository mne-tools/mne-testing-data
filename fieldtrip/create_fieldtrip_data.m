%% clear
clear all global
restoredefaultpath

%% get fieldtrip folder from ENV variable
ft_path = getenv('FT_PATH');

%% add ft path and initialize FieldTrip
addpath(ft_path)
ft_defaults

%% create neuromag dataset....
cfg = [];
cfg.name = 'neuromag306';
cfg.file_name = 'MEG/sample/sample_audvis_trunc_raw.fif';
cfg.eventtype = 'STI 014';
cfg.eventvalue = [1, 2, 3, 4, 5];
cfg.crop = 5;
cfg.remove_channels = [10, 20, 30];

create_ft_data_fun(cfg);

%% create BTI dataset...
cfg = [];
cfg.name = 'BTI';
cfg.file_name = 'BTi/erm_HFH/c,rfDC';
cfg.eventtype = 'None';
cfg.eventvalue = [1, 2];
cfg.remove_channels = [10, 20, 30];

create_ft_data_fun(cfg);

%% create CNT dataset...
cfg = [];
cfg.name = 'CNT';
cfg.file_name = 'CNT/scan41_short.cnt';
cfg.eventtype = 'trigger';
cfg.eventvalue = [0, 7, 109];
cfg.crop = 5;
cfg.remove_channels = [10, 20, 30];

create_ft_data_fun(cfg);

%% create CTF dataset...
cfg = [];
cfg.name = 'CTF';
cfg.file_name = 'CTF/testdata_ctf_mc.ds';
cfg.eventtype = 'HTRG001';
cfg.eventvalue = [1];
cfg.crop = 0.15;
cfg.remove_channels = [10, 20, 30];

create_ft_data_fun(cfg);

%% create EGI dataset...
cfg = [];
cfg.name = 'EGI';
cfg.file_name = 'EGI/test_egi.mff';
cfg.eventtype = {'DIN1', 'DIN2', 'DIN3'};
cfg.eventvalue = {'DIN1', 'DIN2', 'DIN3'};
cfg.crop = 8;
cfg.remove_channels = [10, 20, 30];

create_ft_data_fun(cfg);

%% create eximia dataset
cfg = [];
cfg.name = 'eximia';
cfg.file_name = 'eximia/test_eximia.nxe';
cfg.crop = 0.15;
cfg.remove_channels = [10, 20, 30];

create_ft_data_fun(cfg);

%% create KIT dataset...
cfg = [];
cfg.name = 'KIT';
cfg.file_name = 'KIT/test_as-raw.con';
cfg.remove_channels = [10, 20, 30];

create_ft_data_fun(cfg);