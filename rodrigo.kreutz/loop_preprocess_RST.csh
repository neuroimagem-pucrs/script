#! /bin/csh

# In this script we will loop through the subjects 
# and process the Historinhas pardigme Version 2


set script_loc = `pwd`
set study = CAT
set subjs = (006 007 008 009 010 011 012 013 014 015 016 017)
#set visits = (visit1)
set visits = (visit1 visit2)

foreach subj (${subjs})

foreach visit (${visits})

	cd ${script_loc}
	
	# Now get into the subjects folder

	cd ..
	cd ${study}${subj}

	cd ${visit}

	
	# run the script to create the preprocessing script
	csh ${script_loc}/create_script_RST.csh ${subj} ${visit}
	
	
	# Now actually preprocess the subject
	tcsh -xef proc.${study}${subj}.RST.tcsh |& tee output.proc.${study}${subj}.RST.tcsh

	
end
end



