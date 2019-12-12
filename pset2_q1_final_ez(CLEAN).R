#!/usr/bin/Rscript
suppressPackageStartupMessages(library(Biostrings))
suppressPackageStartupMessages(library(stringr))
setwd("~/Desktop")
p53_clean.fas <- readAAStringSet("p53_clean.fas", format="fasta", use.names = TRUE)
seq_id <- names(p53_clean.fas)
sequence <- paste(p53_clean.fas)
df <- data.frame(seq_id,sequence)
match <- df[which(df$seq_id == "seq_id"), ]
