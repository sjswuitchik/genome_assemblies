# all now archived in /n/holylfs/LABS/informatics/swuitchik/genome_assemblies
module load supernova/2.1.1-fasrc01
nohup ./run_supernova.sh agePho 01_agePho/ &> nohup_agePho.out&
supernova mkoutput --style=pseudohap2 --asmdir=/scratch/swuitchik/blackbird_assembly/agePho/outs/assembly --outprefix=agePho
