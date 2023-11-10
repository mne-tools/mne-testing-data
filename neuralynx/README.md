---

Author: Kristijan Armeni

---

# Author: Kristijan Armeni

This folder contains unconnected recording (i.e. not attached to a patient) with the [Neuralynx](https://neuralynx.fh-co.com/) acquisition system. The recording contributed by Ivan Skelin, Krembil Research Institute, University of Toronto.

Folder contents:

- 5 `.ncs` files (continuously sampled signals, 2Khz sampling rate, except `LAHCu1.ncs` which is at 32Khz)
- 5 `.mat` files (.mat version of .ncs files)
- 1 `.nev` file (events file)

The 3 .ncs files (`LAHC1.ncs, LAHC2.ncs, LAHC3.ncs`) should represent an seeg signal. `xAIR1.ncs` and `xEKG1.ncs` represent a potential non-seeg modality (airflow and EKG in this case). 

Folder size: 1MB
For more info about the file formats, see: [Neuralynx data file formats](https://support.neuralynx.com/hc/en-us/articles/360040444811-TechTip-Neuralynx-Data-File-Formats)

## MATLAB reader used

The `.mat` files were created via the `Nlx2MatCSC.m` (.ncs files) and `Nlx2EV.mat` (.nev file).

Example usage:

```matlab
% for csc files
[Timestamps, ChannelNumbers, SampleFrequencies, NumberOfValidSamples, Samples, Header] = Nlx2MatCSC('LAHC1.ncs', [1 1 1 1 1] , 1, 1, 1);

%for events files
[Timestamps, EventIDs, TTLs, Extras, EventStrings, Header] = Nlx2MatEV('Events.nev', [1 1 1 1 1], 1, 1, []);
```
