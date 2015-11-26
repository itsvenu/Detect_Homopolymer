#!/usr/bin/perl -w

use strict;
use warnings;
no warnings ('uninitialized', 'substr');
use Bio::DB::Fasta;

my $RefFIle = $ARGV[0];
my $chromosome_id = $ARGV[1];
my $vcf_site = $ARGV[2];
my $homopolymer_length = $ARGV[3];

# Usage instructions

unless($#ARGV==3){
	print "USAGE: perl $0  <RefFile.fa>  <Chr_ID>  <VCF_Site>  <Homopolymer_Length>\n";
	exit;
}


my $site = $vcf_site-1;

#Create the database of Reference fasta

my $seq_db = Bio::DB::Fasta->new($RefFIle);
my @ids = $seq_db->get_all_primary_ids;

# access each sequence by seq. id.

my $seq = $seq_db->get_Seq_by_id($chromosome_id);
my $sequence = $seq->seq;
my $doubt_homo = substr($sequence, $site-3, 7);
my $doubt_base = substr($sequence, $site, 1);
my $doubt_base_homopoly = "$doubt_base" x "$homopolymer_length";
if ($doubt_homo =~ /$doubt_base_homopoly/){
	print "$chromosome_id\t$vcf_site\t$doubt_base\t$doubt_homo\tHomo\n";
}else{
	print "$chromosome_id\t$vcf_site\t$doubt_base\t$doubt_homo\tNon_Homo\n";
}
