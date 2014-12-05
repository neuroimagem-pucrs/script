#! /bin/bash

comps=(SVIS AUD PUT PRDMN PODMN MTEMP MOTPL PVIS RFRONT EXEC PMOT LFRONT)
subjpath=~/DATA/MCRUCIUS
ICA_FOLDER=$subjpath/ICA
study=CAT
subjs=(001 002 004 005 006 007 008 009 010 011 012 013 014 015 016 017 018 019)
visits=(visit1 visit2)

#mask=/media/DATA/IDEAL_BRAINS/nihpd_asym_04.5-18.5_t1w.brain.3x3x3_mask.nii.gz
mask=$ICA_FOLDER/mask.nii.gz

cd $ICA_FOLDER

if [ ! -d ./DR ] ; then
	mkdir DR
fi

cd DR

for subj in ${subjs[*]} ; do
        for visit in ${visits[*]} ; do
		for comp in ${comps[*]} ; do
			echo $study$subj/$visit   $comp

			if [ ! -f ./DR_ic.$study$subj.$visit.$comp.ica_Z_2standard.nii.gz ] ; then
				echo "First regression: DR_template map as regressor ..."

				if [ ! -f ../Comp.$comp.ica.nii.gz ] ; then
					cd ..
					3dAFNItoNIFTI Comp.$comp.ica+tlrc
					gzip -1v Comp.$comp.ica.nii
					cd DR
				fi

				fsl_glm -i $subjpath/$study$subj/$visit/PROC.RST/errts.$study$subj.nii.gz	\
					-d ../Comp.$comp.ica.nii.gz -o dr_tc.$study$subj.$visit.$comp.ica.1D	\
					--demean -m ${mask}

				echo "Second regression: individual time course as regressor ..."

				fsl_glm -i $subjpath/$study$subj/$visit/PROC.RST/errts.$study$subj.nii.gz	\
					-d dr_tc.$study$subj.$visit.$comp.ica.1D				\
					-o DR_ic.$study$subj.$visit.$comp.ica					\
					--out_z=DR_ic.$study$subj.$visit.$comp.ica_Z_2standard 			\
					--out_sigsq=DR_ic.$study$subj.$visit.$comp.ica_sigsq 			\
					--demean -m $mask

				## only keep the first volume of the output image
    				fslroi DR_ic.$study$subj.$visit.$comp.ica_Z_2standard.nii.gz \
           		       	       DR_ic.$study$subj.$visit.$comp.ica_Z_2standard.nii.gz 0 1
			fi

			if [ ! -d ./$comp ] ; then
				mkdir $comp
			fi

			mv *$study$subj.$visit.$comp.* $comp/
			3dcopy $comp/DR_ic.$study$subj.$visit.$comp.ica_Z_2standard.nii.gz $comp/$study$subj.$visit.$comp.Z_standard
		done
	done
done
