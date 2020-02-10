%% clear
clear all global
restoredefaultpath

%% set variables
data_folder = 'ft_test_data';
source_folder = 'CNT';
target_folder = 'cellarray';

%% create data...
all_files = dir(fullfile(data_folder, source_folder, '*.mat'));

for idx_file = 1:length(all_files)
  f_name = all_files(idx_file).name;
  
  data = load(fullfile(data_folder, source_folder, f_name));
  
  new_data = {};
  new_data{1} = data.data;
  new_data{2} = data.data;
  data.data = new_data;
  
  save(fullfile(data_folder, target_folder, f_name), '-struct', 'data');
end %for