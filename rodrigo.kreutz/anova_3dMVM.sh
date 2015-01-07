#! /bin/bash

DATA_FOLDER=~/DATA/MCRUCIUS/ICA/DR
COMPONENTS=(PUT RFRONT EXEC MOTPL PMOT PRDMN PVIS SVIS)
RESULTS_FOLDER=~/DATA/MCRUCIUS/ICA/ANOVA

for COMPONENT in ${COMPONENTS[*]}; do
	if [ ! -d $RESULTS_FOLDER ] ; then
		echo "Folder $RESULTS_FOLDER doesn't exist. Create it before starting script!!!"
		exit
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
		001	G1	V1	R	$DATA_FOLDER/$COMPONENT/CAT001.visit1.$COMPONENT.Z_standard+tlrc	\
		001	G1	V2	R	$DATA_FOLDER/$COMPONENT/CAT001.visit2.$COMPONENT.Z_standard+tlrc	\
		002	G2	V1	R	$DATA_FOLDER/$COMPONENT/CAT002.visit1.$COMPONENT.Z_standard+tlrc	\
		002	G2	V2	R	$DATA_FOLDER/$COMPONENT/CAT002.visit2.$COMPONENT.Z_standard+tlrc	\
		004	G1	V1	L	$DATA_FOLDER/$COMPONENT/CAT004.visit1.$COMPONENT.Z_standard+tlrc	\
		004	G1	V2	L	$DATA_FOLDER/$COMPONENT/CAT004.visit2.$COMPONENT.Z_standard+tlrc	\
		005	G2	V1	L	$DATA_FOLDER/$COMPONENT/CAT005.visit1.$COMPONENT.Z_standard+tlrc	\
		005	G2	V2	L	$DATA_FOLDER/$COMPONENT/CAT005.visit2.$COMPONENT.Z_standard+tlrc	\
		006	G1	V1	L	$DATA_FOLDER/$COMPONENT/CAT006.visit1.$COMPONENT.Z_standard+tlrc	\
		006	G1	V2	L	$DATA_FOLDER/$COMPONENT/CAT006.visit2.$COMPONENT.Z_standard+tlrc	\
		007	G2	V1	L	$DATA_FOLDER/$COMPONENT/CAT007.visit1.$COMPONENT.Z_standard+tlrc	\
		007	G2	V2	L	$DATA_FOLDER/$COMPONENT/CAT007.visit2.$COMPONENT.Z_standard+tlrc	\
		008	G2	V1	R	$DATA_FOLDER/$COMPONENT/CAT008.visit1.$COMPONENT.Z_standard+tlrc	\
		008	G2	V2	R	$DATA_FOLDER/$COMPONENT/CAT008.visit2.$COMPONENT.Z_standard+tlrc	\
		009	G1	V1	R	$DATA_FOLDER/$COMPONENT/CAT009.visit1.$COMPONENT.Z_standard+tlrc	\
		009	G1	V2	R	$DATA_FOLDER/$COMPONENT/CAT009.visit2.$COMPONENT.Z_standard+tlrc    	\
		010	G1	V1	R	$DATA_FOLDER/$COMPONENT/CAT010.visit1.$COMPONENT.Z_standard+tlrc    	\
		010	G1	V2	R	$DATA_FOLDER/$COMPONENT/CAT010.visit2.$COMPONENT.Z_standard+tlrc    	\
		011	G1	V1	R	$DATA_FOLDER/$COMPONENT/CAT011.visit1.$COMPONENT.Z_standard+tlrc    	\
		011	G1	V2	R	$DATA_FOLDER/$COMPONENT/CAT011.visit2.$COMPONENT.Z_standard+tlrc    	\
		012	G2	V1	R	$DATA_FOLDER/$COMPONENT/CAT012.visit1.$COMPONENT.Z_standard+tlrc    	\
		012	G2	V2	R	$DATA_FOLDER/$COMPONENT/CAT012.visit2.$COMPONENT.Z_standard+tlrc    	\
		013	G1	V1	L	$DATA_FOLDER/$COMPONENT/CAT013.visit1.$COMPONENT.Z_standard+tlrc    	\
		013	G1	V2	L	$DATA_FOLDER/$COMPONENT/CAT013.visit2.$COMPONENT.Z_standard+tlrc    	\
		014	G1	V1	R	$DATA_FOLDER/$COMPONENT/CAT014.visit1.$COMPONENT.Z_standard+tlrc    	\
		014	G1	V2	R	$DATA_FOLDER/$COMPONENT/CAT014.visit2.$COMPONENT.Z_standard+tlrc    	\
		015	G2	V1	R	$DATA_FOLDER/$COMPONENT/CAT015.visit1.$COMPONENT.Z_standard+tlrc    	\
		015	G2	V2	R	$DATA_FOLDER/$COMPONENT/CAT015.visit2.$COMPONENT.Z_standard+tlrc    	\
		016	G1	V1	L	$DATA_FOLDER/$COMPONENT/CAT016.visit1.$COMPONENT.Z_standard+tlrc    	\
		016	G1	V2	L	$DATA_FOLDER/$COMPONENT/CAT016.visit2.$COMPONENT.Z_standard+tlrc    	\
		017	G2	V1	R	$DATA_FOLDER/$COMPONENT/CAT017.visit1.$COMPONENT.Z_standard+tlrc    	\
		017	G2	V2	R	$DATA_FOLDER/$COMPONENT/CAT017.visit2.$COMPONENT.Z_standard+tlrc    	\
		018	G1	V1	L	$DATA_FOLDER/$COMPONENT/CAT018.visit1.$COMPONENT.Z_standard+tlrc    	\
		018	G1	V2	L	$DATA_FOLDER/$COMPONENT/CAT018.visit2.$COMPONENT.Z_standard+tlrc    	\
		019	G1	V1	L	$DATA_FOLDER/$COMPONENT/CAT019.visit1.$COMPONENT.Z_standard+tlrc    	\
		019	G1	V2	L	$DATA_FOLDER/$COMPONENT/CAT019.visit2.$COMPONENT.Z_standard+tlrc
done


