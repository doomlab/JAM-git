
#Word	Length	Freq_HAL	Log_Freq_HAL	POS	I_Mean_RT	I_NMG_Mean_RT
####english lexicon database
open(FIN,"elp.csv");
while(<FIN>) {
next if /#/;
next if /null/;
next if /POS/;
chomp; tr/ \t/ /s;
($word,$length,$hal, $loghal,$type,$ldt,$naming) = split(",");

$ldt{$word} = $ldt;
$name{$word} = $naming;
$hal{$word} = $hal;
$loghal{$word} = $loghal;
$allofthem{$word}=1;
$typeword{$word} = $type;
}
close(FIN);
###########end english lexicon

###nelson database
open(FIN,"nelson.csv");
while(<FIN>) {
next if /#/;
next if /NULL/;
next if /Cues/;
chomp; tr/ \t/ /s;
($word,$target, $fsg, $bsg, $cueset, $cuecompete, $kandf) = split(",");

$kandf{$word} = $kandf;
$cueset{$word} = $cueset;
$cuecompete{$word} = $cuecompete;

}
close(FIN);


open(FIN,"word list.txt");
while(<FIN>) {

chomp; tr/ \t/ /s;
($word,$type) = split();

$type{$type}{$word} = $word;

}
close(FIN);
###########end english lexicon


foreach $type (sort keys %type)
{
	foreach $word (sort keys %{$type{$type}})
	{
		
	if (not defined $ldt{$type{$type}{$word}})
	{
		print "$type $type{$type}{$word} not defined $kandf{$type{$type}{$word}}\n";
	}
	else
	{
		print $type, " ", $word, " ", $ldt{$type{$type}{$word}}, " ", $name{$type{$type}{$word}}, " ", 
		$hal{$type{$type}{$word}}, " ", $loghal{$type{$type}{$word}}, " ", $kandf{$type{$type}{$word}}, " ", 
		$cueset{$type{$type}{$word}}, " ", $cuecompete{$type{$type}{$word}}, "\n";
	}
}
}
