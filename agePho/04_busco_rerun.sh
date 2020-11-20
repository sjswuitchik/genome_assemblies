# all now archived in /n/holylfs/LABS/informatics/swuitchik/genome_assemblies

module load python/3.6.3-fasrc01 BUSCO/3.1.0-fasrc01
cp agePho.1_c5_m50-10000_s98_r0.05_e30000_z500.scaffolds.fa /scratch/swuitchik/blackbird_assembly/busco
mv agePho.1_c5_m50-10000_s98_r0.05_e30000_z500.scaffolds.fa agePho.1_c5_m50-10000_s98_r0.05_e30000_z500.scaffolds.fasta
cd /n/sw/helmod/apps/centos7/Core/augustus/3.3-fasrc02/
cp -r config /scratch/swuitchik/blackbird_assembly/busco
cd /scratch/swuitchik/blackbird_assembly/busco
cp /n/sw/helmod/apps/centos7/Core/BUSCO/3.1.0-fasrc01/config/config.ini.default .
mv config.ini.default config.ini

whereis makeblastdb
whereis tblastn
whereis hmmsearch
whereis augustus #this path has to be pasted four times in the appropriate places in the config - once with /bin at the end for the main path, and three times with /scripts instead of /bin at the end of the path for each script


export BUSCO_CONFIG_FILE=/scratch/swuitchik/blackbird_assembly/busco/config.ini
export AUGUSTUS_CONFIG_PATH=/scratch/swuitchik/blackbird_assembly/busco/config

cp /n/sw/helmod/apps/centos7/Core/BUSCO/3.1.0-fasrc01/bin/run_BUSCO.py .

nohup ./run_BUSCO.py -i agePho.1_c5_m50-10000_s98_r0.05_e30000_z500.scaffolds.fasta -o agePho_links_busco -l aves_odb9 -m geno -f &> nohup_agePho_links_busco.out&


