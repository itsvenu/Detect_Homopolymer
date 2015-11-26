### Detect_Homopolymer

**[Homopolymer Errors](https://www.broadinstitute.org/crd/wiki/index.php/Sequencing_error)**

Script determines whether the variant present in VCF file is in Homopolymer region 
on the reference genome. Script requires `hg19` as a reference genome (FASTA format) and 
Chromosome id and variant site present in the `VCF file(VCF version4.1)` and the length of the Homopolymer.

####Requirements
Bioperl 1.6

####Usage
`perl find_Homopolymer.pl <RefFile.fa>  <Chr_ID>  <VCF_Site>  <Homopolymer_Length>`

Result will be shown on screen as a stdout format, user can direct the result into a file 
by providing `> Homopolymer_result.txt` at the end of all input arguments

####Sample result
```
chr1    861368  C       GCCCGGG Non_Homo
chr1    871334  G       GTGGCGT Non_Homo
chr1    881627  G       TCAGGGG Homo
chr1    883625  A       AGGAGAG Non_Homo
chr1    887560  A       GACAAGT Non_Homo
chr1    978603  C       GCCCCTG Homo
chr1    980460  G       GGGGGTA Homo
chr1    981087  A       ATCACGT Non_Homo
```
