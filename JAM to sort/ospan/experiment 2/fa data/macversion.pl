$fileopen = "p53.txt";

for ($i=53; $i<89; $i++)
{
	$fileopen= "p".$i.".txt";
open(FIN,$fileopen) or (print "File $fileopen not found\n");
while (<FIN>){
	next if /^Trial/;
	chomp;
	tr/ \t/ /s;

($target, $number) = split;

###simple check how many

	$targets{$target}{$i} = $number;
}
}

###list

open (FOUT, ">>altogether.txt");
foreach $target (sort keys %targets)
{
	foreach $file (sort keys %{$targets{$target}})
	{
		print FOUT $targets{$target}{$file}, " ";
	}
	print FOUT "\n";
}

