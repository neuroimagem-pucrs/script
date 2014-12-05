#! /bin/csh

set ICA_FOLDER=~/DATA/MCRUCIUS/ICA

############## Set these values
set nums=(1 2 3 4 5 6 7 8 10 11 12 13)
set names=(SVIS AUD PUT PRDMN PODMN MTEMP MOTPL PVIS RFRONT EXEC PMOT LFRONT)
set num_of_comp = 12
##############

cd $ICA_FOLDER

foreach ii (`count -dig 1 1 ${num_of_comp}`)

	3dcalc 	-fscale 				\
 		-a melodic_IC.nii.gz'['${nums[$ii]}']' 	\
  		-expr 'a+0' 				\
  		-prefix Comp.${names[${ii}]}.ica

        echo ${ii}
end

