test_move_anon_raw.fif
Raw data, but magnetometers with channel type '3022' were force to be T3 with channel type '3024'.

test_move_anon_raw_sss.fif
MaxFilter params: '-in 8 -out 3'

test_move_anon_raw_simp_stdOrigin_sss.fif
1st second of test_move_anon_raw filtered with Maxfilter. Filter is using simplified params and the standard head origin.
MaxFilter params: '-frame head -origin 0 0 40 -regularize off -in 8 -out 3 -cal off -ctc off -iterate 0 -hpisubt off -autobad off -magscale 100 -v'

test_move_anon_raw_simp_nonStdOrigin_sss.fif
1st second of test_move_anon_raw filtered with Maxfilter. Filter is using simplified params but an arbitrary origin.
MaxFilter params: '-frame head -origin 0 20 20 -regularize off -in 8 -out 3 -cal off -ctc off -iterate 0 -hpisubt off -autobad off -magscale 100 -v'