#samtools: 1.9
samtools view -Shb -@ 8 -o sample/sample.unsort.bam  sample/sample.sam 
samtools sort -@ 4 -o sample/sample.bam sample/sample.unsort.bam 
samtools index -@ 2 sample/sample.bam>sample/sample.bam.bai