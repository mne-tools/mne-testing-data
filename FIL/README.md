# FIL OPM-MEG data

OPM Data recorded from the Functional Imaging Lab (FIL), Department of Imaging Neuroscience, University College London

Dataset provided courtesey of George O'Neill

### Experiments

`sub-noise_ses-001_task-noise220622_run-001` - 5 second empty room recording from 22nd June 2022. Included is the output from a [FieldTrip-like importer](https://github.com/neurofractal/analyse_OPMEG) for the same data (as the `_fieldTrip.mat` file).

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

The `_meg.bin` contains the raw sensor-level data. There are no header bytes. Data is stored by default as single-precision IEEE big-endian binaries. However, [some older (pre Sept 2019) public datasets](https://github.com/tierneytim/OPM/tree/master/testData) may be double precision. 
Data is ordered in as $\text{channels} \times \text{time}$, but as a single vector. For example in a single precision dataset with 4 channels the byte ordering would correspond to 

| Bytes | Channel | Timepoint |
| --- |  --- | --- |
| 0-3 | 0 | 0 |
| 4-7 | 1 | 0 |
| 8-11 | 2 | 0 |
| 12-15 | 3 | 0 |
| 16-19 | 0 | 1 |
| 20-23 | 1 | 1 |
| 24-27 | 2 | 1 |
| 28-31 | 3 | 1 |
| 32-35 | 0 | 2 |

etc.
