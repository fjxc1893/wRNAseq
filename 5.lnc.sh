#StringTie: v1.3.3
#cpc2: v3.18
#cnci: v3.0
#plek: v1.2
#pfam:v1.6
#bowtie2: 2.2.5
#eXpress：1.5.1

stringtie -p 8 --rf -l sample -o sample.gtf sample.bam

sh get_lncRNA_candidate.sh genoem.fa  merged.gtf output
python CPC2-beta/bin/CPC2.py -i lncRNA_candidate.fa -o cpc
python CNCI/CNCI.py  -f lncRNA_candidate.fa -p 8 -o CNCI -m model
python2 PLEK.1.2/PLEK.py -fasta lncRNA_candidate.fa -thread 8 -out plek
pfam_scan.pl -e_seq 0.001 -fasta lncRNA_candidate.fa -dir pfam_database -cpu 8 -as -outfile pfam_database

bowtie2  -k30  -t  -p 8 -x genome.fa -1  sample.R1.fa.gz -2  sample.R2.fa.gz 2> bowtie2_log| express  --no-update-check lncRNA.fa --rf-stranded  -o lncRNA_express

