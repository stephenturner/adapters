# How to contribute

If you want to add new adapter files to this repository, put them in the [adapter_fasta_files](adapter_fasta_files) directory and name the files with the extension `.fa`, _not_ `.fasta`. The R code will look for files ending in `.fa`, and will write the output to `.fasta`. Place multiple files into their own directory, or single files into the `custom` subdirectory.