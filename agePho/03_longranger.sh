# all now archived in /n/holylfs/LABS/informatics/swuitchik/genome_assemblies

module load longranger/2.2.2-fasrc01
cp -r /scratch/swuitchik/assembly/01_agePho/ .
nohup longranger basic --id=agePho --fastqs=/scratch/swuitchik/blackbird_assembly/longranger/01_agePho/ --localmem=256 --localcores=16 &> nohup_agePho.out&

# ARCS 
module load boost/1.63.0-fasrc01 gcc/4.9.3-fasrc01 bwa/0.7.15-fasrc02 samtools/1.5-fasrc02 bcftools/1.5-fasrc02 htslib/1.5-fasrc02 Anaconda3/5.0.1-fasrc02
git clone https://github.com/bcgsc/arcs.git arcs_src
cd arcs_src/
git clone https://github.com/sparsehash/sparsehash.git
export CPPFLAGS=-I$(readlink -f sparsehash/src)
cd sparsehash/ && ./configure && make -j 3 && cd ../
./autogen.sh && ./configure --prefix=${HOME}/bin/arcs && make -j 3  && make install && cd && rm -rf ~/bin/arcs_src
cp agePho.1.fasta /scratch/swuitchik/blackbird_assembly/arcs_src/
cp barcoded.fastq.gz /scratch/swuitchik/blackbird_assembly/arcs_src/
cd /scratch/swuitchik/blackbird_assembly/arcs_src/
conda create -n my_root --clone="/n/helmod/apps/centos7/Core/Anaconda3/5.0.1-fasrc02/x"
source activate my_root
conda install -c bioconda arcs 
conda install -c bioconda links
conda install -c anaconda swig
nohup Examples/arcs-make arcs draft=agePho.1 reads=barcoded &> nohup_agePho_arcs.out&
/n/home03/swuitchik/.conda/envs/my_root/bin/LINKS -f agePho.1.renamed.fa -s empty.fof -b agePho.1_c5_m50-10000_s98_r0.05_e30000_z500 -d 4000 -t 2
# 35984 scaffolds - use less *.scaffolds & get last line
/n/home03/swuitchik/.conda/envs/my_root/bin/LINKS -f agePho.1.renamed.fa -s empty.fof -b agePho.1_c5_m50-10000_s98_r0.05_e30000_z500 -d 500 -t 60
# same
/n/home03/swuitchik/.conda/envs/my_root/bin/LINKS -f agePho.1.renamed.fa -s empty.fof -b agePho.1_c5_m50-10000_s98_r0.05_e30000_z500 -d 500 -t 2
# same
source deactivate
