#! /bin/csh

# cluster the 3 DMN netorks (PRDMN PODMN MTEMP) for two statistical constrasts 
# V1 vs V2 and Right vs. Left


set networks = (PRDMN PODMN MTEMP) #AUD EXEC LFRONT MOTPL PMOT PUT PVIS RFRONT SVIS)

set mas = /media/DATA/IDEAL_BRAINS/MNI152_T1_1mm_brain.nii.gz

set DATA_FOLDER = ~/DATA/MCRUCIUS/ICA/DR


if (0) then

# First we need to resample these statistical results to 1x1x1
foreach network (${networks})
	3dresample -rmode Cu -master ${mas} -prefix anova_${network}.1x1x1 -inset anova_${network}+tlrc

end

exit


# Cluster these data and get the cluster report

foreach network (${networks})


	# p = 0.001
	3dmerge -1clust 1.73 621 -1thresh 4.053    	\
	-prefix anova_${network}.1x1x1.Cluster.Groups.p001 	\
	anova_${network}.1x1x1+tlrc'[7]'

	3dclust -1Dformat -nosum -1dindex 9 -1tindex 9 -2thresh -4.053 4.053 \
	 -dxyz=1 1.73 621 anova_${network}.1x1x1+tlrc'[7]' > ${network}.p001.groups.CLUST_REPORT.txt

	3dmerge -1clust 1.73 621 -1thresh 4.053    	\
	-prefix anova_${network}.1x1x1.Cluster.Visits.p001 	\
	anova_${network}.1x1x1+tlrc'[9]'

	3dclust -1Dformat -nosum -1dindex 9 -1tindex 9 -2thresh -4.053 4.053 \
	 -dxyz=1 1.73 621 anova_${network}.1x1x1+tlrc'[9]' > ${network}.p001.visits.CLUST_REPORT.txt

	3dmerge -1clust 1.73 621 -1thresh 4.053    	\
	-prefix anova_${network}.1x1x1.Cluster.SideOp.p001 	\
	anova_${network}.1x1x1+tlrc'[11]'

	3dclust -1Dformat -nosum -1dindex 9 -1tindex 9 -2thresh -4.053 4.053 \
	 -dxyz=1 1.73 621 anova_${network}.1x1x1+tlrc'[11]' > ${network}.p001.sideop.CLUST_REPORT.txt

	# p = 0.005
	3dmerge -1clust 1.73 1323 -1thresh 3.282    	\
	-prefix anova_${network}.1x1x1.Cluster.Groups.p005 	\
	anova_${network}.1x1x1+tlrc'[7]'

	3dclust -1Dformat -nosum -1dindex 9 -1tindex 9 -2thresh -3.282 3.282 \
	 -dxyz=1 1.73 1323 anova_${network}.1x1x1+tlrc'[7]' > ${network}.p005.groups.CLUST_REPORT.txt

	3dmerge -1clust 1.73 1323 -1thresh 3.282    	\
	-prefix anova_${network}.1x1x1.Cluster.Visits.p005 	\
	anova_${network}.1x1x1+tlrc'[9]'

	3dclust -1Dformat -nosum -1dindex 9 -1tindex 9 -2thresh -3.282 3.282 \
	 -dxyz=1 1.73 1323 anova_${network}.1x1x1+tlrc'[9]' > ${network}.p005.visit.CLUST_REPORT.txt

	3dmerge -1clust 1.73 1323 -1thresh 3.282    	\
	-prefix anova_${network}.1x1x1.Cluster.SideOp.p005 	\
	anova_${network}.1x1x1+tlrc'[11]'

	3dclust -1Dformat -nosum -1dindex 9 -1tindex 9 -2thresh -3.282 3.282 \
	 -dxyz=1 1.73 1323 anova_${network}.1x1x1+tlrc'[11]' > ${network}.p005.sideop.CLUST_REPORT.txt

end


exit

endif


 

# Volume stays the same because it's given by ul instead of voxels. Using volume of 621ul.
# The maximum distance changes because we have changed our resolution (was 1x1x1 now it's 3x3x3), because our subjects are on 3x3x3 space.
# Now get average cluster values using p = 0.01 for power analysis.

foreach network (${networks})

	#G1vsG2
	3dmerge -1clust_order 5.2 621 -1thresh 2.950    \
	-prefix anova_${network}.cluster_order.groups.p01 \
	anova_${network}+tlrc'[7]'

	3dROIstats \
	-mask anova_${network}.cluster_order.groups.p01+tlrc \
	$DATA_FOLDER/$network/CAT001.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT001.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT002.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT002.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT004.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT004.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT005.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT005.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT006.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT006.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT007.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT007.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT008.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT008.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT009.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT009.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT010.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT010.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT011.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT011.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT012.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT012.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT013.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT013.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT014.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT014.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT015.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT015.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT016.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT016.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT017.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT017.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT018.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT018.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT019.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT019.visit2.$network.Z_standard+tlrc > ROISstats.${network}.groups

	# V1vsV2
	3dmerge -1clust_order 5.2 621 -1thresh 2.950    \
	-prefix anova_${network}.cluster_order.visits.p01 \
	anova_${network}+tlrc'[9]'

	3dROIstats \
	-mask anova_${network}.cluster_order.visits.p01+tlrc \
	$DATA_FOLDER/$network/CAT001.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT001.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT002.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT002.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT004.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT004.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT005.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT005.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT006.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT006.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT007.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT007.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT008.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT008.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT009.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT009.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT010.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT010.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT011.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT011.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT012.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT012.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT013.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT013.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT014.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT014.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT015.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT015.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT016.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT016.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT017.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT017.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT018.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT018.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT019.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT019.visit2.$network.Z_standard+tlrc > ROISstats.${network}.visits

	# RvsL
	3dmerge -1clust_order 5.2 621 -1thresh 2.950    \
	-prefix anova_${network}.cluster_order.sideop.p01 \
	anova_${network}+tlrc'[11]'

	3dROIstats \
	-mask anova_${network}.cluster_order.sideop.p01+tlrc \
	$DATA_FOLDER/$network/CAT001.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT001.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT002.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT002.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT004.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT004.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT005.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT005.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT006.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT006.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT007.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT007.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT008.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT008.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT009.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT009.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT010.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT010.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT011.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT011.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT012.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT012.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT013.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT013.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT014.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT014.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT015.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT015.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT016.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT016.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT017.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT017.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT018.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT018.visit2.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT019.visit1.$network.Z_standard+tlrc \
	$DATA_FOLDER/$network/CAT019.visit2.$network.Z_standard+tlrc > ROISstats.${network}.sideop

end

exit




