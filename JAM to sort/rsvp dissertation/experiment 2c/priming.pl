 ###TYPE   PRIME TARGET JUDGMENT 
#~ HL01	sprain	ankle	hurt
#~ HL02	roar	lion	scream
#~ HL03	bulletin	board	news
#~ HL04	bassinet	baby	crib
#~ HL05	tusk	elephant	tooth

open(FIN,"2c.txt");
while(<FIN>) {
next if /#/;
chomp; tr/ \t/ /s;
($type, $w1, $w2,$judge) = split();

$word1{$w2}=$w1;
$word2{$w2} = $judge;
#print "$word1{$w2} $w2\n";

}
close(FIN);


$fileopen="alltogether.txt";


sub numerically {
  $a <=> $b;
}


open(FIN,$fileopen) or (print "File $fileopen not found\n");
while (<FIN>){
	next if /^date/;
	next if /\+UR/;
	next if /JAsee/;
	next if /JSsee/;
	next if /PR/;

#~ 060807	08:53	102	LH1106 element	2	9188	component
   ($date, $time, $subj, $code, $w2, $trial, $lat, $response) = split;

if ($w2 eq $response)
{
	$yes{$word1{$w2}}{$w2}++;
	$total{$word1{$w2}}{$w2}++;
}
else 
{
	$total{$word1{$w2}}{$w2}++;
}
  
  }

close (FIN);


foreach $w1 (sort keys %yes)
{
	foreach $w2 (sort keys %{$yes{$w1}})
	{
		$divide{$w1}{$w2} = $yes{$w1}{$w2}/$total{$w1}{$w2};
		print "$w1 $w2 $divide{$w1}{$w2}\n";
	}
}
