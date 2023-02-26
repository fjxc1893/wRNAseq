#htseq-count: 0.11.2
htseq-count -i gene_id -f bam -s reverse -r name sample/sample.bam genome/gene.gtf > sample.counts.txt 