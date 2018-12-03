$fileopen = "p52.txt";

open(FIN,$fileopen) or (print "File $fileopen not found\n");
while (<FIN>){
	next if /^Trial/;
	chomp;
	tr/ \t/ /s;

($target, @line) = split;

###simple check how many
for ($i=0; $i<@line; $i++)
{	
	$targets{$target} = $targets{$target} + 1;
}
}

###list
foreach $target (sort keys %targets)
{
	print $targets{$target}, "\n";
}