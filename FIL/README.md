# FIL OPM-MEG data

OPM Data recorded from the Functional Imaging Lab (FIL), Department of Imaging Neroscience, University College London

Dataset provided courtesey of George O'Neill

### Experiments

`sub-noise_ses-001_task-noise220622_run-001` - 5 second empty room recording from 22nd June 2022. Included is the output from a [FieldTrip-like importer](https://github.com/neurofractal/analyse_OPMEG) for the same data 

### About

The data is organised in a BIDS-eque format listed below. 

```

data_folder
│
├───[FILE_PREFIX]_meg.bin             [REQUIRED]
├───[FILE_PREFIX]_meg.json            [REQUIRED]
├───[FILE_PREFIX]_channels.tsv        [REQUIRED]
├───[FILE_PREFIX]_positions.tsv       [OPTIONAL]
└───[FILE_PREFIX]_coordsystem.json    [OPTIONAL]

```
However, distinct to BIDS we store no dupliate metadata within our `_meg.bin` file, all metadata is provided within the BIDS-mandated supplementary files. 

#### _meg.bin info

The `_meg.bin` contains the raw sensor-level data. There are no header bytes. Data is stored by default as single-precision IEEE big-endian binaries. However, some older (pre Sept 2019) available datasets may be double precision. 
Data is ordered in as $\text{channels} \times \text{time}$ vector. (e.g. in a 10 channel system the bytes 0-3 will be _channel 1, timepoint 1_, 4-7 will be _channel 2, timepoint 1_ etc. The first set of bytes corresponding to _channel 1, timepoint 2_ would be bytes 40-43).
