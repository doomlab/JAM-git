#~ 103007	12:38	202	JAseeHL17	16	500	0	
#~ 103007	12:38	202	HL17 quart	17	2771	cow	
#~ 103007	12:38	202	JAHL17	18	3754	8	

@judge=qw/JA JS/;

@relation = qw/UR LH HL/;

@time = qw/01 03 06/;

for ($i=0;$i<@judge;$i++)
{
for ($k=0;$k<@relation;$k++)
{
$total{$judge[$i]}{$relation[$k]}=0;
}
}



sub numerically {
  $a <=> $b;
}

$fileopen = "752.2a.dat";


open(FIN,$fileopen) or (print "File $fileopen not found\n");
while (<FIN>){
	next if /^date/;
	next if /\+UR/;
	next if /PR/;

#~ //~ 060807	08:53	102		JAseeLH09		1		500		0	

 if (/JAsee/ or /JSsee/)
 {
	   ($date, $time, $subj, $code, $trial, $lat, $response) = split;
		$judge = substr($code,0,2);
		$relation = substr($code,5,2);
		$number = substr($code,7);
		$judgenumber{$relation}{$number} = $judge;
		print "$relation $number $judgenumber{$relation}{$number} yay\n";
  }
}
close (FOUT);

open(FIN,$fileopen) or (print "File $fileopen not found\n");
while (<FIN>){
	next if /^date/;
	next if /\+UR/;
	next if /PR/;
	
  chomp;
  tr/ \t/ /s;
  
 #~ //~ 060807	08:53	102		JAseeHL47		4		500		0	
#~ //~ 060807	08:53	102		HL4706 sand		5		9955		sand	
#~ //~ 060807	08:53	102		JAHL47		6		5421		3	
 #~ if (/JAsee/ or /JSsee/)
 #~ {
	   #~ ($date, $time, $subj, $code, $trial, $lat, $response) = split;
		#~ $judge = substr($code,0,2);
		#~ $relation = substr($code,5,2);
		#~ $number = substr($code,6);
		#~ $judgenumber{$number} = $judge;
		#~ #print "$judgenumber{$number} yay\n";
  #~ }
  
  if (/JA\w\w\w\w/ or /JS\w\w\w\w/)
  {
#~ //~ date		time	subject	trialcode		trialnum	latency	response	
#~ //~ 060807	08:53	102		JAUR97		9		2398		5
  ($date, $time, $subj, $code, $trial, $lat, $response) = split;
  $judge = substr($code,0,2);
  $relation = substr($code,2,2);
  $number = substr($code,4);
  #print $judge, " ", $relation, " ", $number, " ", $response, "\n";

  $judge{$judge}{$relation} = $response;
  
  }

  else 
  {  
#~ //~ date		time	subject	trialcode		trialnum	latency	response	
#~ //~ 060807	08:53	102		UR9701 haven		8		3778		havic	
  ($date,$time,$subj,$code,$w1,$num,$lat,$response)=split;
$yuck = length($code); 
#print $yuck;
#~ print $code;
  if ($yuck == 7)
  {
	  #print "hi";
  $relation = substr($code,0,2);
  $number = substr($code,2,3);
    }
  else {  
  $relation = substr($code,0,2);
  $number = substr($code,2,2);
  }
  
  
  #~ print $relation, " ", $number, " ", $time, " ", $judgenumber{$number}, "\n";
    $totalfortype{$judgenumber{$relation}{$number}}{$relation}++;
   
  	if ($w1 eq $response)
  	{
  		print "$w1 $response $relation $number\n";
		$total{$judgenumber{$relation}{$number}}{$relation}++;
  	}
    
  }
  }
  

close (FIN);

open(FOUT, ">>pro$fileopen");

foreach $judge (sort keys %total)
{
foreach $relation (sort keys %{$total{$judge}})
{
		$total{$judge}{$relation} = $total{$judge}{$relation}/$totalfortype{$judge}{$relation};
		printf FOUT ("%s %s %6.3f\n", $judge,$relation,$total{$judge}{$relation}), "$fileopen \n"; 
}
}

close (FOUT);
