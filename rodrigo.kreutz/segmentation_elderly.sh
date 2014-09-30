#!/bin/bash

study=CAT
subjs=(007 008 009 010 011)
visits=(visit1 visit2)

for subj in ${subjs[*]} ; do
	for visit in ${visits[*]} ; do
		cd ~/DATA/MCRUCIUS/$study$subj/$visit/ANAT

		if [ ! -f ./MNI_caez_N27+tlrc.HEAD ]; then
			cp ~/neuro-scripts/rodrigo.kreutz/MNI_caez_N27+tlrc.BRIK.gz ./
			cp ~/neuro-scripts/rodrigo.kreutz/MNI_caez_N27+tlrc.HEAD ./
		fi

		if [ ! -f ./NS+orig.HEAD ]; then
			3dSkullStrip -input $study$subj.ANAT.nii.gz 	\
		     		     -no_touchup 			\
		     		     -shrink_fac_bot_lim 0.65 		\
		     		     -use_skull				\
		     		     -perc_int 0.1			\
		     		     -no_pushout			\
		     		     -orig_vol				\
		     		     -avoid_vent -avoid_vent		\
		     		     -init_radius 75			\
		     		     -prefix NS
		else
			echo "Arquivo Skullstrip ja existe."
		fi

		if [ ! -f ./NS+tlrc.HEAD ]; then
			@auto_tlrc -base MNI_caez_N27+tlrc -input NS+orig -no_ss
			3dQwarp	-workhard			\
 				-maxlev 7			\
 				-nowarp				\
				-blur 0 3			\
				-overwrite			\
 				-base MNI_caez_N27+tlrc.HEAD	\
 				-source NS+tlrc.HEAD		\
				-prefix NS
			3dmerge -1noneg -1clip 10 -prefix NS -overwrite $1+tlrc.HEAD
		else
			echo "Arquivo TLRC ja existe."
		fi
	done
done

gzip -9v *.BRIK
