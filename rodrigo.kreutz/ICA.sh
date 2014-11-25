#! /bin/bash

study=CAT
subjs=(001 002 004 005 006 007 008 009 010 011 012 013 014 015 016 017 018 019)
visits=(visit1 visit2)
project_dir=~/DATA/MCRUCIUS

for subj in ${subjs[*]}; do
        for visit in ${visits[*]}; do
                cd $project_dir/$study$subj/$visit/PROC.RST
		if [ ! -f errts.$study$subj.nii.gz ]; then
                	3dAFNItoNIFTI errts.$study$subj+tlrc
			gzip -1v errts.$study$subj.nii
		fi

		if [ -z "$list" ]; then
			echo Creating variable
			list=($project_dir/$study$subj/$visit/PROC.RST/errts.$study$subj.nii.gz)
		else
			echo Appending variable
			list=( ${list},$project_dir/$study$subj/$visit/PROC.RST/errts.$study$subj.nii.gz )
		fi
	done
done
echo ${list}

cd $project_dir
melodic --verbose --approach=concat --Oall -i ${list} -o ICA -m ./ICA/MNI152_T1_3mm_resampled.nii

