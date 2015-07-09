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