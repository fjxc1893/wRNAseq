#find_circ: v1.2 
#Bowtie2: 2.3.4.3
#samtools: 0.1.19

bowtie2 -p 12 --very-sensitive --score-min=C,-15,0  --mm -x genome.fa  -1 sample.R1.fq.gz  -2 sample.R2.fq.gz| samtools view -hbuS - | samtools sort && samtools view -hf 4 sample.bam| samtools view -Sb - >unmapped && unmapped2anchors.py unmapped| gzip >q.fa && bowtie2 -p 12 --reorder --mm --score-min=C,-15,0 -q -x genome -U q.fa 2>bt2_secondpass | find_circ.py -G genome.fa >sample.find_circ_bed