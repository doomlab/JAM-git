#########subs and stuff
sub numerically {
  $a <=> $b;
}

#~ 090607	10:07	802	JAPR04	27	4810	3	
#~ 090607	10:07	802	PR04 diaper	28	2853	dice	
#~ 090607	10:07	802	JAUR53	1	4933	6	
#~ 090607	10:07	802	UR53 hell	2	2723	hello	
#~ 090607	10:07	802	JAUR13	3	5194	2	
#~ 090607	10:07	802	UR13 almanac	4	2528	food	
#~ 090607	10:07	802	JAHL07	5	4242	3	
#~ 090607	10:07	802	HL07 king	6	2493	ski	
#~ 090607	10:07	802	JALH05	7	3828	6	
#~ 090607	10:07	802	LH05 chain	8	2181	chair	


####need to read judgment in.
####need to check words / do i care about trial code number?  only for judgment scoring.

$fileopen = "852.1b.dat";


open(FIN,$fileopen) or (print "File $fileopen not found\n");
while (<FIN>){
	next if /^date/;
	next if /\+UR/;
	next if /PR/;###skips practice trials

  if (/JA/ or /JS/)
  {
#~ 090607	10:07	802	JAUR53	1	4933	6	
#~ 090607	10:07	802	UR53 hell	2	2723	hello	

  ($date, $time, $subj, $code, $trial, $lat, $response) = split;
  $judge = substr($code,0,2);
  $relation = substr($code,2,2);
  $number = substr($code,4);
  #print $judge, " ", $relation, " ", $number, " ", $response, "\n";

  $judge{$judge}{$relation} = $response;
  
  }
  
  else 
  {  
#~ 090607	10:07	802	UR53 hell	2	2723	hello	

  ($date,$time,$subj,$code,$w1,$num,$lat,$response)=split;
$yuck = length($code); 
#print $yuck;
#~ print $code;
  if ($yuck == 5)
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
    $totalfortype{$judge}{$relation}++;
   
  	if ($w1 eq $response)
  	{
  		print "$w1 $response $relation $number\n";
		$total{$judge}{$relation}++;
  	}
    
  }
  }

close (FOUT);

open(FOUT, ">>pro$fileopen");

foreach $judge (sort keys %total)
{
foreach $relation (sort keys %{$total{$judge}})
{
		$total{$judge}{$relation} = $total{$judge}{$relation}/$totalfortype{$judge}{$relation};
		printf FOUT ("%s %s %6.3f\n", $judge,$relation,$total{$judge}{$relation}), "\n"; 
}
}

print FOUT $fileopen;
close (FOUT);
