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

User can automate the script on all the variant sites in a `VCF file` with a `while` loop in `bash`.
A file that contains `chromosome id` and `variant site` should be prepared from `VCF file` with a `bash one liner`

`$ grep -v '^#' input.vcf | cut -f 1,2 > chr_site.txt`

This file could be used as an input for the `find_HomoPolymer.pl` script
```
$ while read -r chr site
>do
>perl find_HomoPolymer.pl /path/hg19.fa "$chr" "$site" 4 >> Homopolymer_result.txt
> done < chr_site.txt
