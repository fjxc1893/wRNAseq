#bwa: 0.7.15
#CIRI2: v2.0.6

bwa mem -t 12 -T 19  genome.fa  cleandata/sample.R1.fq.gz  cleandata/sample.R2.fq.gz1>  sample.sam 2>  sample.aln.log
perl CIRI_v2.0.6/CIRI2.pl -I sample.sam  -O sample.CIRI.gtf -F genome.fa -T 12 -G sample.CIRI.log -M ChrMT -S 100000