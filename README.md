# Adapters for trimming

Source code for [trimmomatic](http://www.usadellab.org/cms/?page=trimmomatic) and [bbmap](https://sourceforge.net/projects/bbmap/) each contain fasta files with adapter files used for trimming. The [combine_adapters.R](combine_adapters.R) file in this directory will recursively search for any files ending in `.fa`. It will then combine them all, the look for unique sequences. If a single sequence has multiple entries within or between files, its sequence ID will be concatenated in a final combined fasta file. The final combined fasta file is written out with the number of unique sequences embedded in its filename.

For instance, the sequence `AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC` is represented in one file as `>PE2_rc` and in another file as `>TruSeq3_IndexedAdapter`. In the combined output file, it is represented a single time as `>PE2_rc | >TruSeq3_IndexedAdapter`. 

The final combined fasta file for all adapters included here is: **[adapters_combined_152_unique.fasta](adapters_combined_152_unique.fasta)**.

Please see [CONTRIBUTING.md](CONTRIBUTING.md) if you wish to add to this repo.
