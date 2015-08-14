Using Elekta MaxFilter version 2.2


test_move_anon_raw.fif
Raw data, but magnetometers with channel type '3022' were force to be T3 with channel type '3024' and then raw file was resaved.
This file is the unprocessed version of all subsequent fif files.


test_move_anon_raw_sss.fif
MaxFilter params: ''


test_move_anon_raw_simp_stdOrigin_sss.fif
Filter is using simplified params and the standard head origin.
Data was cropped post hoc (after running MaxFilter) to keep only first second of data because '-skip' param wasn't working.
MaxFilter params: '-regularize off -cal off -ctc off -iterate 0 -hpisubt off -autobad off'


test_move_anon_raw_simp_nonStdOrigin_sss.fif
Filter is using simplified params but an arbitrary origin.
Data was cropped post hoc (after running MaxFilter) to keep only first second of data because '-skip' param wasn't working.
MaxFilter params: '-frame head -origin 0 20 20 -regularize off -cal off -ctc off -iterate 0 -hpisubt off -autobad off'


test_move_anon_raw_fineCal_sss.fif
Filter is using simplified params and (1d) fine calibration.
Data was cropped post hoc (after running MaxFilter) to keep only first second of data because '-skip' param wasn't working.
MaxFilter params: '-regularize off -cal sss_cal_3053.dat -ctc off -iterate 0 -hpisubt off -autobad off'


test_move_anon_raw_spatiotemporal_sss.fif
Filter is using simplified params and spatiotemporal filtering (tSSS) with a 10 second buffer (default in MaxFilter v2.2).
MaxFilter params: '-regularize off -cal off -ctc off -iterate 0 -hpisubt off -autobad off -st'


test_move_anon_raw_bad_recon_sss.fif
Filter is using simplified params and 30 random bad channels.
Data was cropped post hoc (after running MaxFilter) to keep only first second of data because '-skip' param wasn't working.
MaxFilter params: '-regularize off -cal off -ctc off -iterate 0 -hpisubt off -autobad off -bad 0912 1722 2213 0132 1312 0432 2433 1022 0442 2332 0633 1043 1713 0422 0932 1622 1343 0943 0643 0143 2142 0813 2143 1323 0522 1123 0423 2122 2532 0812'
