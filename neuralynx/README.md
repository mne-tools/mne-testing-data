---

Author: Kristijan Armeni

---

# Author: Kristijan Armeni

This folder contains unconnected recording (i.e. not attached to a patient) with the [Neuralynx](https://neuralynx.fh-co.com/) acquisition system (ATLAS, Pegasus 2.1.3.). The recording contributed by Ivan Skelin, Krembil Research Institute, University of Toronto.

Folder contents:

- 7 `.ncs` files (continuously sampled signals, 2Khz sampling rate, except `LAHCu1.ncs` which is at 32Khz)
- 7 `.mat` files (.mat version of .ncs files)
- 1 `.nev` file (events file)

The 3 .ncs files (`LAHC1.ncs, LAHC2.ncs, LAHC3.ncs`) should represent an seeg signal. `xAIR1.ncs` and `xEKG1.ncs` represent a potential non-seeg modality (airflow and EKG in this case).  
Two `.ncs` and `.mat` files (`*_3_gaps*`) were created with the matlab reader below to mimick `.ncs` acquisition with missing samples that `read_raw_neuralynx()` should handle.

Folder size: ~1MB
For more info about the file formats, see: [Neuralynx data file formats](https://support.neuralynx.com/hc/en-us/articles/360040444811-TechTip-Neuralynx-Data-File-Formats)

## MATLAB reader used

The `.mat` files were created via the `Nlx2MatCSC.m` (.ncs files) and `Nlx2EV.mat` (.nev file) readers, both version 5.0.0. See project page: https://www.urut.ch/new/serendipity/index.php?/pages/nlxtomatlab.html. Available at: https://neuralynx.fh-co.com/research-software/#file-converters-&-utilities

Example usage:

```matlab
% for csc files
[Timestamps, ChannelNumbers, SampleFrequencies, NumberOfValidSamples, Samples, Header] = Nlx2MatCSC('LAHC1.ncs', [1 1 1 1 1] , 1, 1, 1);

% for events files
[Timestamps, EventIDs, TTLs, Extras, EventStrings, Header] = Nlx2MatEV('Events.nev', [1 1 1 1 1], 1, 1, []);
```

### Creating .ncs channels with discontinuous samples (`*_3_gaps.ncs`)

The following custom MATLAB script was used to read in two `.ncs` channels (`LAHC1`, `LAHC2`), manually mark some samples as invalid, set them to 0, and save back to `.ncs` and `.mat`. These files are used in `test_neuralynx_gaps()`.

```matlab
datadir = "./";
chans = ["LAHC1", "LAHC2"];

for k = 1:length(chans)

    fname = fullfile(datadir, sprintf("%s.ncs", chans(k)));
    
    [Timestamps, ChannelNumbers, SampleFrequencies, NumberOfValidSamples, Samples, Header] = Nlx2MatCSC(char(fname), [1 1 1 1 1], 1, 1, 1);
    
    % create 3 gaps, each of different length
    modified_records = [10, 16, 21];
    modified_records_sizes = [100, 7, 23]; % 130 samples missing total
    
    for i = 1:length(modified_records)
        
        modified_record_id = modified_records(i);
        n_samps_invalid = modified_records_sizes(i); 

        % set "missing" samples as 0
        Samples(end-(n_samps_invalid-1):end, modified_record_id) = 0;
        
        % now adjust the indicator variable accordingly
        record_size = 512;
        NumberOfValidSamples(modified_record_id) = record_size - n_samps_invalid;
        
        assert(sum(Samples(:, modified_record_id) == 0) == n_samps_invalid);
    end
    
    % write matlab variables back to .ncs
    fn = sprintf("%s_3_gaps.ncs", chans(k));
    Mat2NlxCSC(char(fn), 0, 1, 1, [1 1 1 1 1 1], ...
                           Timestamps, ...
                           ChannelNumbers, ...
                           SampleFrequencies, ...
                           NumberOfValidSamples, ...
                           Samples, Header)
    
    % read the create .ncs back to matlab (for sanity check)
    [Timestamps, ChannelNumbers, SampleFrequencies, NumberOfValidSamples, Samples, Header] = Nlx2MatCSC(char(fn), [1 1 1 1 1], 1, 1, 1);
    
    % Now save back to matlab
    fnmat = fullfile(replace(fn, ".ncs", ".mat"));
    save(char(fnmat),...
         "Timestamps", ...
         "ChannelNumbers", ...
         "SampleFrequencies", ...
         "NumberOfValidSamples", ...
         "Samples", "Header");

end
```