#! /bin/csh

# Building the protaia script - RESTING STATE - calling afni's afni_proc.py

#set study = CAT
#set subj = 001
#set run = RST
#set visit = visit1

set study = CAT
set subj = $1
set run = RST
set visit = $2



set template = MNI_caez_N27+tlrc


# Get out of the SCRIPTS folder
#cd ..
#cd ${study}${subj}
#cd ${visit}

afni_proc.py \
	-subj_id ${study}${subj}                                \
	-script proc.${study}${subj}.${run}.tcsh 		\
	-out_dir PROC.${run} 					\
	-dsets ${run}/${study}${subj}.${run}+orig		\
	-copy_anat ANAT/${study}${subj}.ANAT+orig		\
	-blocks despike tshift align tlrc volreg blur mask regress \
	-tcat_remove_first_trs 3				\
	-tshift_opts_ts -tpattern alt+z2			\
	-volreg_align_e2a					\
	-volreg_tlrc_warp					\
	-tlrc_NL_warp						\
	-align_opts_aea -skullstrip_opts 			\
		-shrink_fac_bot_lim 0.65 			\
		-no_pushout					\
		-no_touchup					\
		-use_skull					\
		-perc_int 0.1					\
		-orig_vol					\
		-avoid_vent -avoid_vent				\
		-init_radius 75					\
	-tlrc_base ${template}					\
	-mask_segment_anat yes					\
	-blur_filter -1blur_fwhm				\
		-blur_size 6 					\
	-regress_opts_3dD 					\
		-jobs 6						\
		-regress_censor_outliers 0.1			\
		-regress_bandpass 0.01 0.1			\
		-regress_apply_mot_types demean deriv		\
		-regress_ROI WMe CSFe				\
		-regress_run_clustsim no			\
		-regress_est_blur_errts

exit 



