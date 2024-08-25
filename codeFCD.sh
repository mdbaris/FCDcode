cd patients/left
for i in `ls`
do
cd $i/str
run_first_all -i $i"_"T1w -o ../../left-$i
cd ../..
done
cd patients/left
for i in `ls`
do
cd $i/str
run_first_all -i $i"_"T1w -o ../../right-$i
cd ../..
done
cd healthy
for i in `ls`
do
cd $i/str
run_first_all -i $i"_"T1w -o ../../healthy-$i
cd ../..
done

for i in L_Thal L_Caud L_Puta L_Pall BrStem L_Hipp L_Amyg L_Accu R_Thal R_Caud R_Puta R_Pall R_Hipp R_Amyg R_Accu
do
concat_bvars $i-HL-bvars.bvars h*-$i.bvars l*-$i.bvars
concat_bvars $i-HR-bvars.bvars h*-$i.bvars r*-$i.bvars
first_utils --vertexAnalysis --usebvars -i $i-HL-bvars.bvars -o $i-HL -d design-HL.mat --useReconNative --useRigidAlign --useReconMNI
randomise -i $i-HL -o $i-HL-results -m $i-HL"_"mask -d design-HL.mat -t design-HL.con -n 5000 --T2
first_utils --vertexAnalysis --usebvars -i $i-HR-bvars.bvars -o $i-HR -d design-HR.mat --useReconNative --useRigidAlign --useReconMNI
randomise -i $i-HR -o $i-HR-results -m $i-HR"_"mask -d design-HR.mat -t design-HR.con -n 5000 --T2
       