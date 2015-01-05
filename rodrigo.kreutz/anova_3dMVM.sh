#! /bin/bash

DATA_FOLDER=~/DATA/MCRUCIUS/ICA/DR
COMPONENT=AUD
RESULTS_FOLDER=ANOVA

cd $DATA_FOLDER/$COMPONENT

if [ ! -d ./$RESULTS_FOLDER ] ; then
	mkdir $RESULTS_FOLDER
fi

cd $RESULTS_FOLDER

3dMVM	-prefix anova_$COMPONENT -jobs 4				\
	-wsVars Visit							\
	-bsVars	Group							\
	-num_glt 2							\
	-gltLabel 1 G1vsG2 -gltCode 1 'Group : 1*G1 -1*G2'		\
	-gltLabel 2 V1vsV2 -gltCode 2 'Visit : 1*V1 -1*V2'		\
	-dataTable							\
	Subj	Group	Visit	InputFile				\
	001	G1	V1	../CAT001.visit1.AUD.Z_standard+tlrc	\
	001	G1	V2	../CAT001.visit2.AUD.Z_standard+tlrc	\
	002	G2	V1	../CAT002.visit1.AUD.Z_standard+tlrc	\
	002	G2	V2	../CAT002.visit2.AUD.Z_standard+tlrc	\
	004	G1	V1	../CAT004.visit1.AUD.Z_standard+tlrc	\
	004	G1	V2	../CAT004.visit2.AUD.Z_standard+tlrc	\
	005	G2	V1	../CAT005.visit1.AUD.Z_standard+tlrc	\
	005	G2	V2	../CAT005.visit2.AUD.Z_standard+tlrc	\
	006	G1	V1	../CAT006.visit1.AUD.Z_standard+tlrc	\
	006	G1	V2	../CAT006.visit2.AUD.Z_standard+tlrc	\
	007	G2	V1	../CAT007.visit1.AUD.Z_standard+tlrc	\
	007	G2	V2	../CAT007.visit2.AUD.Z_standard+tlrc	\
	008	G2	V1	../CAT008.visit1.AUD.Z_standard+tlrc	\
	008	G2	V2	../CAT008.visit2.AUD.Z_standard+tlrc	\
	009	G1	V1	../CAT009.visit1.AUD.Z_standard+tlrc	\
	009	G1	V2	../CAT009.visit2.AUD.Z_standard+tlrc	\
	010	G1	V1	../CAT010.visit1.AUD.Z_standard+tlrc	\
	010	G1	V2	../CAT010.visit2.AUD.Z_standard+tlrc	\
	011	G1	V1	../CAT011.visit1.AUD.Z_standard+tlrc	\
	011	G1	V2	../CAT011.visit2.AUD.Z_standard+tlrc	\
	012	G2	V1	../CAT012.visit1.AUD.Z_standard+tlrc	\
	012	G2	V2	../CAT012.visit2.AUD.Z_standard+tlrc	\
	013	G1	V1	../CAT013.visit1.AUD.Z_standard+tlrc	\
	013	G1	V2	../CAT013.visit2.AUD.Z_standard+tlrc	\
	014	G1	V1	../CAT014.visit1.AUD.Z_standard+tlrc	\
	014	G1	V2	../CAT014.visit2.AUD.Z_standard+tlrc	\
	015	G2	V1	../CAT015.visit1.AUD.Z_standard+tlrc	\
	015	G2	V2	../CAT015.visit2.AUD.Z_standard+tlrc	\
	016	G1	V1	../CAT016.visit1.AUD.Z_standard+tlrc	\
	016	G1	V2	../CAT016.visit2.AUD.Z_standard+tlrc	\
	017	G2	V1	../CAT017.visit1.AUD.Z_standard+tlrc	\
	017	G2	V2	../CAT017.visit2.AUD.Z_standard+tlrc	\
	018	G1	V1	../CAT018.visit1.AUD.Z_standard+tlrc	\
	018	G1	V2	../CAT018.visit2.AUD.Z_standard+tlrc	\
	019	G1	V1	../CAT019.visit1.AUD.Z_standard+tlrc	\
	019	G1	V2	../CAT019.visit2.AUD.Z_standard+tlrc


