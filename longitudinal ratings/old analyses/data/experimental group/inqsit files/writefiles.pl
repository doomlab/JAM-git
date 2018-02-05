opendir my $dir, "//vmware-host/Shared Folders/Erin On My Mac/Documents/RESEARCH/1 MSU/2 writing/longitudinal ratings/data/experimental group/inqsit files/people" or die "Cannot open directory: $!";
my @files = readdir $dir;
closedir $dir;

#~ for ($i=2; $i<@files; $i++)
#~ {
	#~ print $files[$i], "\n";
#~ }


for ($i=2; $i<@files; $i++)
{

open(FIN,"//vmware-host/Shared Folders/Erin On My Mac/Documents/RESEARCH/1 MSU/2 writing/longitudinal ratings/data/experimental group/inqsit files/people/".$files[$i]) or (print "File $files[$i] not found/n");

while (<FIN>){
	
next if /#/;
  chomp; 
  tr/ \t/ /s;
  tr/,/ /;
  tr/./ /;
  tr/[A-Z]/[a-z]/;
($word, @line) = split;

if (not defined $total{$word})
{
	$total{$word} = 0;
}

$total{$word} = $total{$word} + 1;

#print "$i $files[$i] $word \n";

for ($p=0;$p<@line;$p++)
{
	if (not defined $count{$word}{$line[$p]})
	{
		$count{$word}{$line[$p]} = 0;
	}
	
	#print $line[$i], "\n";
	$count{$word}{$line[$p]} = $count{$word}{$line[$p]} + 1;
	
}
}

}
close(FIN);

foreach $word (sort keys %count)
{
	foreach $second (sort keys %{$count{$word}})
	{
		print $word, " ", $second, " ", $count{$word}{$second}, " ", $total{$word}, " \n";
	}
}



