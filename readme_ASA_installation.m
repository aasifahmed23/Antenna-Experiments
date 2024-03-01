% Compilation Instructions
% Step 1: Download  ASA-30.34 from here : https://github.com/ingber/adaptive-simulated-annealing/blob/master/ASA-30.34.zip
% Step 2: Download ASAMIN from here:  http://ssakata.sdf.org/cgi-bin/export_file.cgi?dir=SOFTWAREARC&file=asamin_1.39.tar.gz
% Step 3: Unzip the whole contents of ASA into ASAMIN folder. All the C and
% Header files of ASA AND ASAMIN must be in the same folder.
% Step 4: Run this command below in the MATLAB prompt
% mex asamin.c asa.c -DUSER_ACCEPTANCE_TEST -DUSER_ASA_OUT -DDBL_MIN=2.2250738585072014e-308
% some errors regarding Acceptance_Fit will be displayed.
% Step 5 : Open asa.c in matlab editor and bulk replace (CTRL+h) Acceptance_Fit by
% Acceptance_Test and save it there
% Step 6 : rerun again the following command:
% mex asamin.c asa.c -DUSER_ACCEPTANCE_TEST -DUSER_ASA_OUT -DDBL_MIN=2.2250738585072014e-308