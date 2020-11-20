# all now archived in /n/holylfs/LABS/informatics/swuitchik/genome_assemblies

# BUSCO v3.0.2
module load centos6 BUSCO/3.0.2-fasrc01 python/3.6.0-fasrc01
tar -xzf aves_odb9.tar.gz
cp /n/sw/fasrcsw/apps/Core/BUSCO/3.0.2-fasrc01/bin/../config/config.ini .
# need to edit config file with paths to specific dependencies
whereis makeblastdb
whereis tblastn
whereis hmmsearch
whereis augustus #this path has to be pasted four times in the appropriate places in the config - once with /bin at the end for the main path, and three times with /scripts instead of /bin at the end of the path for each script
whereis etraining
whereis Rscript # only needed if you're going to use the plot function

# copy these paths individually into the config file - be sure to not include the command
# eg/ for makeblastdb, the path is /n/sw/fasrcsw/apps/Core/ncbi-blast/2.2.31+-fasrc01/bin/makeblastdb but you only copy /n/sw/fasrcsw/apps/Core/ncbi-blast/2.2.31+-fasrc01/bin/ into the config file

cd /n/sw/fasrcsw/apps/Core/augustus/3.0.3-fasrc02/
cp -r config/ /scratch/swuitchik/blackbird_assembly/BUSCO
cd /scratch/swuitchik/blackbird_assembly/BUSCO

export BUSCO_CONFIG_FILE=/scratch/swuitchik/blackbird_assembly/BUSCO/config.ini
export AUGUSTUS_CONFIG_FILE=/scratch/swuitchik/blackbird_assembly/BUSCO/config

nohup ./run_BUSCO.py -i agePho.1.fasta -o agePho_busco -l aves_odb9 -m geno -f &> nohup_agePho_busco.out&

# BUSCO v3.1.0
module load BUSCO/3.1.0-fasrc01 python/3.6.0-fasrc01
cp BUSCO/aves_odb9 .
cp BUSCO/config.ini .
whereis makeblastdb
whereis tblastn
whereis hmmsearch
whereis augustus #this path has to be pasted four times in the appropriate places in the config - once with /bin at the end for the main path, and three times with /scripts instead of /bin at the end of the path for each script
whereis etraining

cd /n/sw/helmod/apps/centos7/Core/augustus/3.3-fasrc02/
cp -r config /scratch/swuitchik/blackbird_assembly/BUSCOv310
cd /scratch/swuitchik/blackbird_assembly/BUSCOv310

export BUSCO_CONFIG_FILE=/scratch/swuitchik/blackbird_assembly/BUSCOv310/config.ini
export AUGUSTUS_CONFIG_FILE=/scratch/swuitchik/blackbird_assembly/BUSCOv310/config

nohup ./run_BUSCO.py -i agePho.1.fasta -o agePho_busco -l aves_odb9 -m geno -f &> nohup_agePho_busco.out&

