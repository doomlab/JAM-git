 ###TYPE   PRIME TARGET JUDGMENT 
#~ HL01	sprain	ankle	hurt
#~ HL02	roar	lion	scream
#~ HL03	bulletin	board	news
#~ HL04	bassinet	baby	crib
#~ HL05	tusk	elephant	tooth

open(FIN,"finalpairs2.txt");
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


#~ 090607	12:11	812	JSUR52	3	20006	4	
#~ 090607	12:11	812	UR52 knight	4	17503	anchor	


####open file and read it
open(FIN,$fileopen) or (print "File $fileopen not found\n");
while (<FIN>){
	next if /^date/;
	#next if /\+UR/;
	next if /JAsee/;
	next if /JSsee/;
	#next if /UR/;
	next if /PR/;
  chomp;
  tr/ \t/ /s;
  
#~ 090607	10:55	806	UR13 almanac	5	8710	lizard	

 if (not /JA/) 
  {  
  if (not /JS/)
  {
  ($date,$wow,$subj,$code,$w2,$num,$lat,$response)=split;
 # print "$date,$wow,$subj,$code,$w2,$num,$lat,$response\n";
$yuck = length($code);   

if ($yuck == 5)
  {
#~ print "hi";
  $relation = substr($code,0,2);
  $number = substr($code,2,3);
  }
  else {  
  $relation = substr($code,0,2);
  $number = substr($code,2,2);
  }  
  
$store{$relation}{$number} = $w2;
  
   #~ if (defined $word1{$w2} )
   #~ {print $relation, " ", $word1{$w2}, " ", $store{$relation}{$number}, " \n";
	#~ }
   
   #~ else {print $w2, "\n";}
   
  }
}
}

close (FIN);

open(FIN,$fileopen) or (print "File $fileopen not found\n");
while (<FIN>){
	next if /^date/;
	#next if /\+UR/;
	next if /JAsee/;
	next if /JSsee/;
	#next if /UR/;
	next if /PR/;
  chomp;
  tr/ \t/ /s;

if (/JA/ or /JS/)
  {
	  
#~ 060807	08:53	102	JALH11	3	33810	3	
  ($date, $wow, $subj, $code, $trial, $lat, $response) = split;

  $judge = substr($code,0,2);
  $relation = substr($code,2,2);
  $number = substr($code,4);

  # print $word1{$store{$relation}{$number}}, " ", $store{$relation}{$number}, "\n";
   #if (not defined $word1{$store{$relation}{$number}})
  #{print $relation, " ", $number, "\n";}
   
  $judge{$judge}{$relation} = $response;
  $judgement{$judge}{$relation}{$word1{$store{$relation}{$number}}}{$word2{$store{$relation}{$number}}} = $judgement{$judge}{$relation}{$word1{$store{$relation}{$number}}}{$word2{$store{$relation}{$number}}} + $judge{$judge}{$relation};
  $totaljudge{$judge}{$relation}{$word1{$store{$relation}{$number}}}{$word2{$store{$relation}{$number}}}++;
 
#print $judge, " ", $relation, " ", $number, " ", $response, "\n";
#print $judge{$judge}{$relation}, " ", $judgement{$judge}{$relation}{$word1{$store{$relation}{$number}}}{$store{$relation}{$number}},"\n";
  }


}

close (FIN);


open(FIN,"usfjcn_sensed.csv");
while(<FIN>) {
next if /#/;
 chomp; tr/ \t/ /s;
($word,$pair,$fsg,$bsg,$qfr,$tfr,$jcn,$jcnsense) = split(",");

$fsg{$word}{$pair} = $fsg;
$jcn{$word}{$pair} = $jcnsense;
$bsg{$word}{$pair} = $bsg;

}
close(FIN);

open (FOUT, ">judgmentscores.txt");

#$judgement{$judge}{$relation}{$w1}{$w2}

foreach $judge (sort keys %judgement)
{
	foreach $relation (sort keys %{$judgement{$judge}})
	{	
		foreach $w1 (sort keys %{$judgement{$judge}{$relation}})
		{
			foreach $w2 (sort keys %{$judgement{$judge}{$relation}{$w1}})
			{
				$pro{$judge}{$relation}{$w1}{$w2} = $judgement{$judge}{$relation}{$w1}{$w2} / $totaljudge{$judge}{$relation}{$w1}{$w2};
				print FOUT $judge, " ", $relation, " ", $w1, " ", $w2, " ";
				print FOUT $pro{$judge}{$relation}{$w1}{$w2}, " ",;
				
				if (defined $fsg{$w1}{$w2})
				{print FOUT $fsg{$w1}{$w2}, " ",$bsg{$w1}{$w2}, " ", $jcn{$w1}{$w2}, "\n";}
				else
				{print FOUT $fsg{$w2}{$w1}, " ",$bsg{$w2}{$w1}, " ", $jcn{$w2}{$w1}, "\n";}
			}
		}
	}
}


close (FOUT);

###printing judgment type word type word 1 word 2 subject score fsg bsg jcn



