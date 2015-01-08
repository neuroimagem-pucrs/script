#! /bin/csh

# cluster the 3 DMN netorks (PRDMN PODMN MTEMP) for two statistical constrasts 
# V1 vs V2 and Right vs. Left


set networks = (PRDMN PODMN MTEMP) #AUD EXEC LFRONT MOTPL PMOT PUT PVIS RFRONT SVIS)

set mas = /media/DATA/IDEAL_BRAINS/MNI152_T1_1mm_brain.nii.gz


#if (0) then

# First we need to resample these statistical results to 1x1x1
foreach network (${networks})
	3dresample -rmode Cu -master ${mas} -prefix anova_${network}.1x1x1 -inset anova_${network}+tlrc

end

exit


# Cluster these data


foreach network (${networks})


	# p = 0.001
	3dmerge -1clust 1.73 621 -1thresh 4.053    	\
	-prefix anova_${network}.1x1x1.Cluster.Groups.p001.2 	\
	anova_${network}.1x1x1+tlrc'[7]'

	3dmerge -1clust 1.73 621 -1thresh 4.053    	\
	-prefix anova_${network}.1x1x1.Cluster.Visits.p001.2 	\
	anova_${network}.1x1x1+tlrc'[9]'

	3dmerge -1clust 1.73 621 -1thresh 4.053    	\
	-prefix anova_${network}.1x1x1.Cluster.SideOp.p001.2 	\
	anova_${network}.1x1x1+tlrc'[11]'

	# p = 0.005
	3dmerge -1clust 1.73 1323 -1thresh 3.282    	\
	-prefix anova_${network}.1x1x1.Cluster.Groups.p005.2 	\
	anova_${network}.1x1x1+tlrc'[7]'

	3dmerge -1clust 1.73 1323 -1thresh 3.282    	\
	-prefix anova_${network}.1x1x1.Cluster.Visits.p005.2 	\
	anova_${network}.1x1x1+tlrc'[9]'

	3dmerge -1clust 1.73 1323 -1thresh 3.282    	\
	-prefix anova_${network}.1x1x1.Cluster.SideOp.p005.2 	\
	anova_${network}.1x1x1+tlrc'[11]'

end

#endif

# Get cluster report
foreach network (${networks})

	#visit
	3dclust -1Dformat -nosum -1dindex 9 -1tindex 9 -2thresh -3.282 3.282 \
	 -dxyz=1 1.7 1323 anova_${network}.1x1x1+tlrc > ${network}.p005.visit.CLUST_REPORT.txt
end



exit



 


# Now get average cluster values
3dmerge -1clust_order 5.2 540 -1thresh 4.773    \
-prefix Allwords_x_MTrabTotal.bucket.tcorr.CLUSTORD \
Allwords_x_MTrabTotal.bucket+tlrc'[3]'




3dROIstats \
-mask Allwords_x_MTrabTotal.bucket.tcorr.CLUSTORD+tlrc \
../COG00712/PROC.PRIM/statsALLwords.COG00712+tlrc'[0]' \
../COG01312/PROC.PRIM/statsALLwords.COG01312+tlrc'[0]' \
../COG01412/PROC.PRIM/statsALLwords.COG01412+tlrc'[0]' \
../COG07114/PROC.PRIM/statsALLwords.COG07114+tlrc'[0]' \
../COG15114/PROC.PRIM/statsALLwords.COG15114+tlrc'[0]' \
../COG17122/PROC.PRIM/statsALLwords.COG17122+tlrc'[0]' \
../COG19121/PROC.PRIM/statsALLwords.COG19121+tlrc'[0]' > ROISstats.${reg}





