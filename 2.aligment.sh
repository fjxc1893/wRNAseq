#hisat2: 2.1.0
hisat2 -x genome/genome -1 cleandata/sample.R1.fq.gz -2 cleandata/sample.R2.fq.gz -p 8 --rna-strandness RF --fr  -S hisat2/sample.sam