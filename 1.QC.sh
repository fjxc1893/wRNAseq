#fastp: 0.20.1
#SortMeRNA: v2.1

sortmerna --ref combind_rfam_silva_rRNA.fa, combind_rfam_silva_rRNA --reads sample.fq --num_alignments 1 --paired_out --fastx -a 8 --aligned sample.rRNA_align  --other sample.rRNA_un_align --log -v 

fastp -a auto --adapter_sequence_r2 auto --detect_adapter_for_pe -w 4 -i raw_data_after_rRNA_remove/sample.R1.fq.gz -I raw_data_after_rRNA_remove/sample.R2.fq.gz--cut_front --cut_tail --n_base_limit 5 --cut_window_size 4 --cut_mean_quality 20 --length_required 75 --qualified_quality_phred 15 -o clean_data/sample.R1.fq.gz -O clean_data/sample.R2.fq.gz --json Fastp/sample.rawdata.fastp.json --html Fastp/sample.rawdata.fastp.html 
fastp -w 15 -i clean_data/sample.R1.fq.gz -I clean_data/sample.R2.fq.gz --disable_adapter_trimming --disable_trim_poly_g --disable_quality_filtering --disable_length_filtering --json Fastp/sample.rawdata.fastp.json --html Fastp/sample.rawdata.fastp.html 