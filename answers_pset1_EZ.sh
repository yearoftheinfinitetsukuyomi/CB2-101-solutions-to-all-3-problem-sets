#!/usr/bin/bash 

#download

wget ftp://ftp.ebi.ac.uk/pub/databases/Pfam/current_release/proteomes//9606.tsv.gz

gunzip 9606.tsv.gz

#ANSWER TO QUESTION 1

cat 9606.tsv | cut -d$'\t' -f6 | wc -l



#QUESTION 2: On NCBI FTP site all the bacterial genomes are present in the directory ftp://ftp.ncbi.nlm.nih.gov/genomes/ archive/old_refseq/Bacteria/. There are hundreds of genomes in that directory. Using a single wget com- mand download proteomes corresponding to all the Yersinia_pestis strains. The proteomes should be down- loaded in such a way that each ".faa" files are inside separate directory. 

wget -m  ftp://ftp.ncbi.nlm.nih.gov/genomes/ archive/old_refseq/Bacteria Yersinia_pestis*:

#QUESTION 3: Starting from last directory write a single bash command line to count the total number of proteins in all the Yersinia pestis strains together. You may chain as many commands as you wish.

#Problem 4
E. coli MG1655 is the standard referece strain of E. coli. The protein FASTA file for this strain can be downloaded from ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_refseq/Bacteria/Escherichia_coli_K_ 12_substr__MG1655_uid57779/NC_000913.faa. (a) Using just bash commands can you find out what is the average length of protein in this strain? You may use as many commands as you may wish. (b) In the second part of the problem, write your commmands in a bash script such a way that given any fasta file as the option to the script, it can print out the average length of protein in the file.


#a.)

export aacount=`cat NC_000913.faa| grep -v \> | tr -d “\n” | wc -c` | echo $aacount

b.)

#!/usr/bin/bash
for file in NC*
do
  export aacount=`cat "$file" "${file}"| grep -v \> | tr -d “\n” | wc -c`
echo $aacount
done 
