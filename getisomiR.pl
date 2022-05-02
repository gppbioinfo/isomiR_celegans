open(GP, "$ARGV[0]") || die;
while($line=<GP>)
{
chomp($line);

@a = split("\t", $line);
@b = split(" ", $a[5]);
$b[0]=~s/>//g;

#if($a[1] ne $a[6])  # for isomiR

if($a[1] eq $a[6]) # for miRNA
{
#next;
#print "$line\n";
	if($a[15] == 1) 
	{
		print "$b[0]\tmiRNA\t$a[1]\t$ARGV[1]\t$a[3]\n";
	}
	
}
elsif($a[1] ne $a[6])
{
#print "$line\n";
    if($a[4] >=1 && $a[15] ==0 && $a[16] ==1 && $a[17]==0 && $a[18]==0 && $a[19] == 0) # 5 isomiR check
	{
		print "$b[0]\t5p\t$a[1]\t$ARGV[1]\t$a[3]\n";
	}	
    elsif($a[4] >=1 && $a[15] ==0 && $a[16] ==0 && $a[17]==0 && $a[18]==0 && $a[19] == 1) # 3 isomiR check
	{
		print "$b[0]\t3p\t$a[1]\t$ARGV[1]\t$a[3]\n";
	}
	elsif($a[4] >=1 && $a[15] ==0 && $a[16] ==1 && $a[17]==0 && $a[18]==0 && $a[19] == 1) # both isomiR check
	{
		print "$b[0]\tboth\t$a[1]\t$ARGV[1]\t$a[3]\n";
	}

}


}


=head
	if($a[3] >=1 && $a[15] ==1 && $a[20] ==0)
	{
		print "$b[0]\t5p\t$a[1]\t$a[3]\n";
	}
	elsif($a[3] >=1 && $a[16] ==0 && $a[19] ==1)
	{
		print "$b[0]\t3p\t$a[1]\t$a[3]\n";
	}

	elsif($a[3] >=1 && $a[16] ==1 && $a[19] ==1)
	{
		print "$b[0]\tboth\t$a[1]\t$a[3]\n";
	}
=cut
