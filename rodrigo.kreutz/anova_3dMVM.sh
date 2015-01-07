#! /bin/bash

DATA_FOLDER=~/InsCer
COMPONENTS=(PUT RFRONT EXEC MOTPL PMOT PRDMN PVIS SVIS)
RESULTS_FOLDER=ANOVA

for COMPONENT in ${COMPONENTS[*]}; do
	cd $DATA_FOLDER/$COMPONENT

	if [ ! -d ./$RESULTS_FOLDER ] ; then
		mkdir $RESULTS_FOLDER
	fi

	cd $RESULTS_FOLDER

	3dMVM	-prefix anova_$COMPONENT -jobs 7						\
		-wsVars Visit									\
		-bsVars	'Group+SideOp'								\
		-num_glt 3									\
		-gltLabel 1 G1vsG2 -gltCode 1 'Group : 1*G1 -1*G2'				\
		-gltLabel 2 V1vsV2 -gltCode 2 'Visit : 1*V1 -1*V2'				\
		-gltLabel 3 RvsL   -gltCode 3 'SideOp : 1*R -1*L'				\
		-dataTable									\
		Subj	Group	Visit	SideOp	InputFile					\
		001	G1	V1	R	../CAT001.visit1.$COMPONENT.Z_standard+tlrc	\
		001	G1	V2	R	../CAT001.visit2.$COMPONENT.Z_standard+tlrc	\
		002	G2	V1	R	../CAT002.visit1.$COMPONENT.Z_standard+tlrc	\
		002	G2	V2	R	../CAT002.visit2.$COMPONENT.Z_standard+tlrc	\
		004	G1	V1	L	../CAT004.visit1.$COMPONENT.Z_standard+tlrc	\
		004	G1	V2	L	../CAT004.visit2.$COMPONENT.Z_standard+tlrc	\
		005	G2	V1	L	../CAT005.visit1.$COMPONENT.Z_standard+tlrc	\
		005	G2	V2	L	../CAT005.visit2.$COMPONENT.Z_standard+tlrc	\
		006	G1	V1	L	../CAT006.visit1.$COMPONENT.Z_standard+tlrc	\
		006	G1	V2	L	../CAT006.visit2.$COMPONENT.Z_standard+tlrc	\
		007	G2	V1	L	../CAT007.visit1.$COMPONENT.Z_standard+tlrc	\
		007	G2	V2	L	../CAT007.visit2.$COMPONENT.Z_standard+tlrc	\
		008	G2	V1	R	../CAT008.visit1.$COMPONENT.Z_standard+tlrc	\
		008	G2	V2	R	../CAT008.visit2.$COMPONENT.Z_standard+tlrc	\
		009	G1	V1	R	../CAT009.visit1.$COMPONENT.Z_standard+tlrc	\
		009	G1	V2	R	../CAT009.visit2.$COMPONENT.Z_standard+tlrc    	\
		010	G1	V1	R	../CAT010.visit1.$COMPONENT.Z_standard+tlrc    	\
		010	G1	V2	R	../CAT010.visit2.$COMPONENT.Z_standard+tlrc    	\
		011	G1	V1	R	../CAT011.visit1.$COMPONENT.Z_standard+tlrc    	\
		011	G1	V2	R	../CAT011.visit2.$COMPONENT.Z_standard+tlrc    	\
		012	G2	V1	R	../CAT012.visit1.$COMPONENT.Z_standard+tlrc    	\
		012	G2	V2	R	../CAT012.visit2.$COMPONENT.Z_standard+tlrc    	\
		013	G1	V1	L	../CAT013.visit1.$COMPONENT.Z_standard+tlrc    	\
		013	G1	V2	L	../CAT013.visit2.$COMPONENT.Z_standard+tlrc    	\
		014	G1	V1	R	../CAT014.visit1.$COMPONENT.Z_standard+tlrc    	\
		014	G1	V2	R	../CAT014.visit2.$COMPONENT.Z_standard+tlrc    	\
		015	G2	V1	R	../CAT015.visit1.$COMPONENT.Z_standard+tlrc    	\
		015	G2	V2	R	../CAT015.visit2.$COMPONENT.Z_standard+tlrc    	\
		016	G1	V1	L	../CAT016.visit1.$COMPONENT.Z_standard+tlrc    	\
		016	G1	V2	L	../CAT016.visit2.$COMPONENT.Z_standard+tlrc    	\
		017	G2	V1	R	../CAT017.visit1.$COMPONENT.Z_standard+tlrc    	\
		017	G2	V2	R	../CAT017.visit2.$COMPONENT.Z_standard+tlrc    	\
		018	G1	V1	L	../CAT018.visit1.$COMPONENT.Z_standard+tlrc    	\
		018	G1	V2	L	../CAT018.visit2.$COMPONENT.Z_standard+tlrc    	\
		019	G1	V1	L	../CAT019.visit1.$COMPONENT.Z_standard+tlrc    	\
		019	G1	V2	L	../CAT019.visit2.$COMPONENT.Z_standard+tlrc
done


