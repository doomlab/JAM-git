#~ ******************OVERALL DATA******************
#~Test Date: 09/05/2006
#~ Test Time: 11:51:02
#~ IP Address: 127.0.0.1
#~ Final math percentage: 100%
#~ Total problems shown: 75
#~ Total letters correct: 70
#~ Average time given: 10.6757
#~ Average Recall Screen Time: 2.076
#~ Student ID: P01

print "Enter the subject number of the first person you want to score.\n";
$a=<STDIN>;
chomp $a;

print "\nEnter the subject number of the last person you want to score.\n";
$b=<STDIN>;
chomp $b;

for ($i=$a; $i<($b+1); $i++)
{
#~ print "Please enter the subject number where the data is stored:\n";
#~ $fileopen = <STDIN>;
$fileopen = $i;
chomp $fileopen;

if ($fileopen <10)
{
	$fileopen = "0".$fileopen;
}

$fileopen = "P".$fileopen."-OSPAN.txt";

print $fileopen;

####open file and read it
open(FIN,$fileopen) or (print "File $fileopen not found\n");
open (FOUT, ">>ospanscores.txt");
while (<FIN>){
  #~ next if /Time/;
  #~ next if /Address/;
  #~ next if /problems/;
  chomp;
tr/ \t/ /s;
  @line = split;
  #~ print @line;
  
  for ($j=0;$j<@line; $j++)
  {
	#~ print $line[$i];  
	
  if ($line[$j] eq "Date:")
  {print FOUT "\n$line[$j+1] ";}
  
  if ($line[$j] eq "percentage:")
  {print FOUT "$line[$j+1] ";}
  
  if($line[$j] eq "correct:")
  {print FOUT "$line[$j+1] ";}
  
    if($line[$j] eq "ID:")
  {print FOUT "$line[$j+1] ";}
}
}
close (FIN);
close (FOUT);


}

  