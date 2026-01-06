This file contains a small sample of fNIRS data recorded with a Shimadzu Labnirs system.

Since Labnirs does not provide native support for saving data in the `.snirf` format, the raw measurements were first exported as `.txt` files and then converted using the [labnirs2snirf](https://github.com/zEdS15B3GCwq/labnirs2snirf) tool.

The dataset includes 250 time points from 15 optode pairs, each measured at three wavelengths (780, 805, 830 nm), resulting in a total of 45 channels. Optode positions were arranged on a grid with 1 cm spacing between optodes of the same type and 3 cm spacing between sources and detectors with the same index.

This dataset was created for testing processing of multi-wavelength data (≥3 wavelengths).

It is licensed under CC0.
