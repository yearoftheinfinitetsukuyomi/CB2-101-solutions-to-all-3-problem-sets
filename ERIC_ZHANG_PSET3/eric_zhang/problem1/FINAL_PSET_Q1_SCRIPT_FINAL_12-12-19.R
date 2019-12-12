#problem 1
#!/usr/bin/env Rscript
setwd("~/Desktop/ERIC_ZHANG_PSET3/data")

library(BiocGenerics)
library(lazyeval)
library(data.table)

args = commandArgs(trailingOnly=TRUE) #allows for command line argument inputs

#set file 9606.tsv as args[1], remember quote to denote a file

args[1] <- '9606.tsv.gz'

#creating dataframe

#table <- read.table(file = args[1], sep = '\t', header = FALSE) #, as.is = TRUE)
#colnames(table) [1:14] <- c("sequence id","alignment start","alignment end", "envelope start", "envelope end", "hmm acc", "hmm name", "type", "hmm start", "hmm end", "hmm length", "bit score", "E-value", "clan")

df <- as.data.table(table, row.names = NULL, optional = FALSE, make.names = TRUE, stringsAsFactors = default.stringsAsFactors())
  #it appears that a dataframe is a matrix. edit: no it is not as i later found out

id_key <- setkeyv(df, 'sequence id') #note: AAAAAAHHH IT WORKED

#Write a R scrpt that takes 9606.tsv.gz file as a first argument, a protein accession number as a second argument, and a location (integer) as a third argument

# args[1] <- table #1 file ///note: this didn't work and it has something to do with the 'table' argument (read.table()) can't be used with commandArgs

#now that table is created and properly annotated you can set the other arguments

#first need to convert table to data.table
#df <- as.data.frame(table)
  #df$ID <- rownames(table)

  #data.table <- as.data.table(table)

#passing value of column as arg[2] by having user input save to list (probably 20th try)
my.prot_ID <- readline(prompt="Enter protein accession ID: ")
---------------------------------------------------------------------
  
  
  
  
#for (i in df) if my.prot_ID == df[1]
#if my.prot_ID %in% id_key
v1 <- my.prot_ID
v2 <- id_key
for (v1 in id_key) {if match(v1,id_key), print(paste(df[v1,'hmm name'])} #at this point I'm getting burnt out so submitting for now and will work on it more tonight/tomorrow

#create lists here:
#protein_accession_list <- df[1]

#require(data.table)
  #args[2] <- key(table[1]) #protein accession list, need to use some sort of match function with user input later if you can't get setkey() working (error gives x is not data.table but it is)
  #args[2] <- key(df[1]) #aaahhh can't set it as key!Error message reads: Error in args[2] <- key(df[1]) : replacement has length zero
  #args[2] <- df[1] 
#1st attempt: arg[2] <- function(table, 1) {grep(table[,1])}
#2nd attempt: args[2] <-  table[ ,1] #[which(table$seq_id)] # == "seq_id"), ] #2 accession number
  
  
#data[,6] <- as.character(table[,6])
  readline(prompt = "location?")
  
args[3] <- df[] # location (3rd argument, need to get user input)


#if then loop to print if doesn't fall b/w location
readline(prompt = "hmm_name")

#output (domain) need to figure this out
  
align_start <- df[,2]
align_end <- df[,3]
envelope_start <- df[,4]
envelope_end <- df[,5] 


#df <- read.table(file = '9606.tsv.gz', sep = '\t', header = F) #instead use args[1]

#also works, for future reference: 
#require(data.table)
#data<-as.data.frame(fread("9606.tsv.gz", header = F))

