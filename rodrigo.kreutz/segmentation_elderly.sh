#!/bin/bash

if ( ! -f ./$1+orig.HEAD ) then
	3dSkullStrip -input CAT007.ANAT.nii.gz -no_touchup -shrink_fac_bot_lim 0.65 -use_skull -perc_int 0.1 -no_pushout -orig_vol -avoid_vent -avoid_vent -init_radius 75 -prefix $1
	rm *.ply
else
	echo "Arquivo Skullstrip ja existe."
endif

if ( ! -f ./$1+tlrc.HEAD ) then
	3dQwarp -allineate -allinkill -workhard -inilev 5 -maxlev 7 -nowarp -base MNI_caez_N27+tlrc.HEAD -source $1+orig.HEAD
else
	echo "Arquivo TLRC ja existe."
endif


