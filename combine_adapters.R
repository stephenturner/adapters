library(tidyverse)

# Function to take paths to fasta files and read them all into a single character vector
fasta_combine <- function(paths) {
  paths %>% 
    map(read_lines) %>% 
    unlist()
}

# Function to take a fasta file as a character vector and turn into a data frame
fasta_to_df <- function(fasta) {
  tibble(name=fasta[seq(1, length(fasta), 2)],
         seq=fasta[seq(2, length(fasta), 2)])
}

# Function to look through the fasta, get unique sequences, and combine the sequence IDs
fasta_unique_sequences <- function(fasta_df) {
  fasta_df %>% 
    group_by(seq) %>% 
    summarize(name=name %>% unique %>% paste(collapse=" | ")) %>% 
    select(name, seq)
}

# Function to take a fasta df and create a flat character vector
fasta_df_to_flat <- function(fasta_df) {
  fasta <- deframe(fasta_df)
  out <- NULL
  for (i in seq_along(fasta)) {
    out <- c(out, names(fasta)[i])
    out <- c(out, unname(fasta[i]))
  }
  return(out)
}

adapters <- list.files(pattern="*.fa", recursive=TRUE) %>% 
  fasta_combine() %>%
  fasta_to_df() %>% 
  fasta_unique_sequences() %>% 
  fasta_df_to_flat()

write_lines(adapters, path=paste0("adapters_combined_", length(adapters)/2, "_unique.fasta"))
