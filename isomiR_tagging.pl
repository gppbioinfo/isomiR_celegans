#Load a perl package for uniq array utils
use List::MoreUtils qw(uniq);

#########################################################################
# This program is written to obtained direction of isomiRs sequences from the isomiR-SEA output
# Run: perl isomiR_tagging.pl input_file > output_file [isomiR-SEA produce output with name as 'out_result_mature_22_tag_unique' and few other files
# Ex command: perl isomiR_taggin.pl out_result_mature_22_tag_unique > out_result_mature_22_tag_unique_tagging
#########################################################################

#Open file line by line from the isomiR-SEA_package output with name of Sample_name_tag_uniq

open(GP, $ARGV[0]) || die;
while($line=<GP>)
{
chomp($line); #check for in empty lines
@a=split("\t", $line); # split lines with tab to separated columns

#Here we are going to do some test on the size of tag and mature miRNAs

print "miRBASE_ID\tmiRNA_sequence\tTag_sequence_reads\tRead_count\tstrand_direction\tDifference_nt\n";

if($a[15] == 0 && $a[8] > 0 && $a[9] == 0 && $a[16] > 0 && $a[19] == 0) #checked length difference, begin_ungapped_mirna, mir_tag_diff, iso_5p and iso_3p
{
	if($a[14] > 0) 
	{
 		#print "$a[5]\t$a[6]\t$a[1]\t$a[3]\tiso_5p_truncated\t$a[14]\n";
	}
	else
	{
		#print "$a[5]\t$a[6]\t$a[1]\t$a[3]\tiso_5p_extended\t".abs($a[14])."\n";
	}
}

if($a[15] == 0 && $a[8] == 0  && $a[9] > 0 && $a[16] > 0 && $a[19] == 0) #checked length difference, begin_ungapped_mirna, mir_tag_diff, iso_5p and iso_3p
{
	if($a[14] > 0) 
	{
 		print "$a[5]\t$a[6]\t$a[1]\t$a[3]\tiso_5p_truncated\t$a[14]\n";
	}
	else
	{
		print "$a[5]\t$a[6]\t$a[1]\t$a[3]\tiso_5p_extended\t".abs($a[14])."\n";
	}
}

#Check for iso_3p

if($a[15] == 0 && $a[8] > 0 && $a[9] == 0 && $a[16] == 0 && $a[19] > 0) #checked length difference, begin_ungapped_mirna, mir_tag_diff, iso_5p and iso_3p
{
	if($a[14] > 0) 
	{
 		print "$a[5]\t$a[6]\t$a[1]\t$a[3]\tiso_3p_truncated\t$a[14]\n";
	}
	else
	{
		print "$a[5]\t$a[6]\t$a[1]\t$a[3]\tiso_3p_extended\t".abs($a[14])."\n";
	}
}

if($a[15] == 0 && $a[8] == 0  && $a[9] > 0 && $a[16] == 0 && $a[19] > 0) #checked length difference, begin_ungapped_mirna, mir_tag_diff, iso_5p and iso_3p
{
	if($a[14] > 0) 
	{
 		print "$a[5]\t$a[6]\t$a[1]\t$a[3]\tiso_3p_truncated\t$a[14]\n";
	}
	else
	{
		print "$a[5]\t$a[6]\t$a[1]\t$a[3]\tiso_3p_extended\t".abs($a[14])."\n";
	}
}

#Check for both (5p_iso,3p_iso)

if($a[15] == 0 && $a[8] > 0 && $a[9] == 0 && $a[16] > 0 && $a[19] > 0) #checked length difference, begin_ungapped_mirna, mir_tag_diff, iso_5p and iso_3p
{
	if($a[14] > 0) 
	{
 		print "$a[5]\t$a[6]\t$a[1]\t$a[3]\tboth_truncated\t$a[14]\n";
	}
	else
	{
		print "$a[5]\t$a[6]\t$a[1]\t$a[3]\tboth_3p_extended\t".abs($a[14])."\n";
	}
}

if($a[15] == 0 && $a[8] == 0  && $a[9] > 0 && $a[16] > 0 && $a[19] > 0) #checked length difference, begin_ungapped_mirna, mir_tag_diff, iso_5p and iso_3p
{
	if($a[14] > 0) 
	{
 		print "$a[5]\t$a[6]\t$a[1]\t$a[3]\tbothiso_3p_truncated\t$a[14]\n";
	}
	else
	{
		print "$a[5]\t$a[6]\t$a[1]\t$a[3]\tboth_3p_extended\t".abs($a[14])."\n";
	}
}


}