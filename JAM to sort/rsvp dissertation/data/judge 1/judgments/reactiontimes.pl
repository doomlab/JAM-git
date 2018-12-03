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


$fileopen="alltogether.1.txt";
	


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
   
  $lat{$judge}{$relation}{$word1{$store{$relation}{$number}}}{$store{$relation}{$number}}{$subj} = $lat;
 
#print $judge, " ", $relation, " ", $number, " ", $response, "\n";
#print $judge{$judge}{$relation}, " ", $judgement{$judge}{$relation}{},"\n";
  }


}

close (FIN);


open (FOUT, ">>reactiontimes.txt");

#$judgement{$judge}{$relation}{$w1}{$w2}

foreach $judge (sort keys %lat)
{
	foreach $relation (sort keys %{$lat{$judge}})
	{
		foreach $w1 (sort keys %{$lat{$judge}{$relation}})
		{
			print FOUT "$judge $w1 ";
			
			foreach $w2 (sort keys %{$lat{$judge}{$relation}{$w1}})
			{
				print FOUT "$w2 ";
				
				foreach $subj (sort keys %{$lat{$judge}{$relation}{$w1}{$w2}})
				{
					print FOUT $lat{$judge}{$relation}{$w1}{$w2}{$subj}, " ";
				}
			}
			print FOUT "\n";
		}
	}
}


close (FOUT);

###printing judgment type word type word 1 word 2 subject score fsg bsg jcn



