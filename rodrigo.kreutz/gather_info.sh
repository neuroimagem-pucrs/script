#!/bin/bash

study=CAT
subjs=(016 017 018 019)
visits=(visit1 visit2)
project_dir=~/DATA/MCRUCIUS
file=~/neuro-scripts/rodrigo.kreutz/dados.txt

for subj in ${subjs[*]}; do
	for visit in ${visits[*]}; do
		cd $project_dir/$study$subj/$visit/PROC.RST
		#./@ss_review_basic
		./@ss_review_driver
		#./@epi_review.$study$subj
		echo ""
		echo ""
		echo ""
		echo "Anote as informacoes e pressione enter."
		echo $study$subj - $visit
		read -n 1 -s
	done
done
