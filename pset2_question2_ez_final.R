## Align two amino acid sequences with the BLOSUM62 matrix
#aa1 <- AAString("HXBLVYMGCHFDCXVBEHIKQZ")
#aa2 <- AAString("QRNYMYCFQCISGNEYKQN")
#pairwiseAlignment(aa1, aa2, substitutionMatrix = "BLOSUM62", gapOpening = 3, gapExtension = 1)

require("Biostrings")
require("seqinr")
#require("Rcpp")
library("seqinr")
library("Biostrings")
ex_align <- read.fasta(file="ex_align.fas", seqtype= "AA", as.string = FALSE)
cleaned <- system("sed -i 's/\\*//g' ex_align.fas", intern = TRUE)

#ex_align_cleaned <- gsub("*","", ex_align, perl = FALSE, fixed = FALSE)

## See how the gap penalty influences the alignment
pairwiseAlignment(aa1, aa2, substitutionMatrix = "BLOSUM62", gapOpening = 0, gapExtension = 0) #set to zero to make indel penalty 0

## See how the substitution matrix influences the alignment
#pairwiseAlignment(aa1, aa2, substitutionMatrix = "BLOSUM50", gapOpening = 3, gapExtension = 1)

if (interactive()) {
  ## Compare our BLOSUM62 with BLOSUM62 from ftp://ftp.ncbi.nih.gov/blast/matrices/
  data(BLOSUM62)
  BLOSUM62["Q", "Z"]
  file <- "ftp://ftp.ncbi.nih.gov/blast/matrices/BLOSUM62"
  b62 <- as.matrix(read.table(file, check.names=FALSE))
  b62["A", "Y"] #keys here
}