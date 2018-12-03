for ($i=89; $i<131; $i++)
{
	$fileopen= "p". $i .".txt";
open(FIN,$fileopen) or (print "File $fileopen not found\n");
while (<FIN>){
	next if /^Trial/;
	chomp;
	tr/ \t/ /s;

($target, $number) = split;

###simple check how many

	print "p", $i, " ", $target, " ", $number, "\n";

	$targets{$target}{$i} = $number;
}
}

###list



open (FOUT, ">>altogether.txt");
foreach $target (sort keys %targets)
{
	print FOUT $target, " ";
	foreach $file (sort keys %{$targets{$target}})
	{
		print FOUT $targets{$target}{$file}, " ";
	}
	print FOUT "\n";
}

