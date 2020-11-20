# all now archived in /n/holylfs/LABS/informatics/swuitchik/genome_assemblies

nohup ./run_supernova.sh asaScu asaScu_fastqs/ &> nohup_asaScu.out&

module load supernova/2.1.1-fasrc01
supernova mkoutput --style=pseudohap2 --asmdir=/scratch/swuitchik/asaScu_assembly/asaScu/outs/assembly --outprefix=asaScu > mkout_asaScu.out
