#!/bin/bash

cd ~/DATA/MCRUCIUS/CAT007/visit1/ANAT/TESTAR_SS

if [ ! -f ./$1+orig.HEAD ]; then
	3dSkullStrip -input CAT007.ANAT.nii.gz 	\
		     -no_touchup 		\
		     -shrink_fac_bot_lim 0.65 	\
		     -use_skull			\
		     -perc_int 0.1		\
		     -no_pushout		\
		     -orig_vol			\
		     -avoid_vent -avoid_vent	\
		     -init_radius 75		\
		     -prefix $1
	rm *.ply
else
	echo "Arquivo Skullstrip ja existe."
fi

if [ ! -f ./$1+tlrc.HEAD ]; then
	@auto_tlrc -base MNI_caez_N27+tlrc -input $1+orig -no_ss
	3dQwarp	-workhard			\
 		-maxlev 7			\
 		-nowarp				\
		-blur 0 3			\
		-overwrite			\
 		-base MNI_caez_N27+tlrc.HEAD	\
 		-source $1+tlrc.HEAD		\
		-prefix $1
else
	echo "Arquivo TLRC ja existe."
fi

gzip -1v *.BRIK
