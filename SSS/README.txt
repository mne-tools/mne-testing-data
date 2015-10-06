Using Elekta MaxFilter version 2.2


test_move_anon_raw.fif
Raw data anonymized using `.anonymize()`, and magnetometers with channel type '3022' or '3023' were force to be T3 with channel type '3024'.
This file is the unprocessed version of all subsequent fif files.


test_move_anon_raw_sss.fif
MaxFilter params: ''


test_move_anon_simp_stdOrigin_raw_sss.fif
Filter is using simplified params and the standard head origin.
Data was cropped post hoc (after running MaxFilter) to keep only first second of data because '-skip' param wasn't working.
MaxFilter params: '-regularize off -cal off -ctc off -iterate 0 -hpisubt off -autobad off'


test_move_anon_nonStdOrigin_raw_sss.fif
Filter is using simplified params but an arbitrary origin.
Data was cropped post hoc (after running MaxFilter) to keep only first second of data because '-skip' param wasn't working.
MaxFilter params: '-frame head -origin 0 20 20 -regularize off -cal off -ctc off -iterate 0 -hpisubt off -autobad off'


test_move_anon_fineCal_raw_sss.fif
Filter is using simplified params and (1d) fine calibration.
Data was cropped post hoc (after running MaxFilter) to keep only first second of data because '-skip' param wasn't working.
MaxFilter params: '-regularize off -cal sss_cal_3053.dat -ctc off -iterate 0 -hpisubt off -autobad off'


test_move_anon_crossTalk_raw_sss.fif
Filter is using simplified params and cross-talk cancellation.
Data was cropped post hoc (after running MaxFilter) to keep only first second of data because '-skip' param wasn't working.
MaxFilter params: '-regularize off -cal off -ctc ct_sparse.fif -iterate 0 -hpisubt off -autobad off  -force -bad 0912 1722 2213 0132 1312 0432 2433 1022 0442 2332 0633 1043 1713 0422 0932 1622 1343 0943 0643 0143 2142 0813 2143 1323 0522 1123 0423 2122 2532 0812'
Python command: python -c "import mne; mne.io.Raw('test_move_anon_raw_crossTalk_sss.fif').crop(0, 1., copy=False).load_data().save('test_move_anon_raw_fineCal_sss.fif', overwrite=True)"

test_move_anon_st4s_raw_sss.fif
Filter is using simplified params and spatiotemporal filtering (tSSS) with a 4 second buffer. MaxFilter has an irregularity in 
how it processes the last window of data if that buffer is less than the specified duration. Sometimes it will process it
separately, and sometimes it will lump it onto the previous window. For the 17 sec data, Elekta's tSSS uses the 4s window to
break the data into 4s, 4s, 4s, 4s, 5s chunks. I.e., it DID lump the tail window into the previous data.
MaxFilter params: '-regularize off -cal off -ctc off -iterate 0 -hpisubt off -autobad off -st 4'


test_move_anon_st10s_raw_sss.fif
Filter is using simplified params and spatiotemporal filtering (tSSS) with a 10 second buffer (default in MaxFilter v2.2).
MaxFilter has an irregularity in how it processes the last window of data if that buffer is less than the specified duration as
noted above. For the 17 sec data, Elekta's tSSS uses the 10s window to break the data into 10s and 7s chunks. I.e., it DID NOT 
lump the tail window into the previous data.To get around this, this file was cropped to 10s prior to Elekta's tSSS processing. 
MaxFilter params: '-regularize off -cal off -ctc off -iterate 0 -hpisubt off -autobad off -st 10'


test_move_anon_badRecon_raw_sss.fif
Filter is using simplified params and 30 random bad channels.
Data was cropped post hoc (after running MaxFilter) to keep only first second of data because '-skip' param wasn't working.
MaxFilter params: '-regularize off -cal off -ctc off -iterate 0 -hpisubt off -autobad off -force -bad 0912 1722 2213 0132 1312 0432 2433 1022 0442 2332 0633 1043 1713 0422 0932 1622 1343 0943 0643 0143 2142 0813 2143 1323 0522 1123 0423 2122 2532 0812'

test_move_anon_raw.pos
MaxFilter was run with these parameters:
maxfilter -headpos -hp test_move_anon_raw.pos -f test_move_anon_raw.fif -v -autobad off
The test_move_anon_raw_quat.fif file was deleted. 

test_move_anon_raw_subsampled.pos
This file was made by subsampling test_move_anon_raw.pos both to make simulation more efficient, and to remove the last seven rows of the .pos file that belonged to times outside the valid range of the raw file ("26.060, 26.080, 26.090, 26.100, 26.110, 26.120, 26.140").

NOTE: Symbolic links can be removed once PR changing names (#2374) is merged !
