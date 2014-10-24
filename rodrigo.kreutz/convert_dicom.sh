#!/bin/bash

study=CAT
subj=004
visit=visit2

cd ~/DATA/MCRUCIUS/$study$subj/$visit
subj_folder=`pwd`

if [ -d DICOM/ ]; then
	echo Performing conversion of DICOM.
	dcm2nii -c -g -o $subj_folder DICOM/*
else
	echo "No DICOM directory found. Trying to find it compressed."
	if [ -f ./dicom.tar.gz ]; then
		tar -zxvf ./dicom.tar.gz
		if [ ! -d DICOM/ ]; then
			echo "The file which was compressed doesn't contain DICOM at it's root."
			exit
		fi
		dcm2nii -c -g -o $subj_folder DICOM/*
	else
		echo "Nothing found."
		exit
	fi
fi

if [ ! -d ANAT ]; then
	mkdir ANAT
fi

if [ ! -d RST ]; then
	mkdir RST
fi

cd ANAT
mv ../2*t1*.nii.gz $study$subj.ANAT.nii.gz
3dcopy $study$subj.ANAT.nii.gz $study$subj.ANAT+orig
cd $subj_folder

cd RST
mv ../2*ep*bold*.nii.gz $study$subj.RST.nii.gz
3dcopy $study$subj.RST.nii.gz $study$subj.RST+orig
cd $subj_folder

echo "Conversion is done!"
echo You may delete all other files inside $subj_folder EXCEPT the ANAT and RST folders.
echo "You should consider to compress the DICOM directory and save it. For that try:"
echo "tar -zcvf dicom.tar.gz DICOM"

exit
