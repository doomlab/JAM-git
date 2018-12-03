open(FIN,"usfjcnlsa.csv");
while(<FIN>) {
next if /#/;
 chomp; tr/ \t/ /s;
($word,$pair,$fsg,$bsg,$msg, $qcon, $tcon, $qfr,$tfr,$jcn,$lsa) = split(",");

$fsg{$word}{$pair} = $fsg;
$jcn{$word}{$pair} = $jcn;
$bsg{$word}{$pair} = $bsg;
#$jcnsense{$word}{$pair} = $jcnsense;
}
close(FIN);

open(FIN,"word list.txt");
while(<FIN>) {
next if /#/;
 chomp; tr/ \t/ /s;
($word, $pair) = split();

$two{$word}= $pair

}
close(FIN);

foreach $word (sort keys %two)
{
	print $word, " ", $two{$word}, " ", $fsg{$word}{$two{$word}}, " ", $bsg{$word}{$two{$word}}, " ", $jcn{$word}{$two{$word}}, " ", "\n";
}

