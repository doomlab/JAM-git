#erin buchanan
#note this should only be used when every subject is saved in their own file
## if you want this to score data based on overall 25 minute time period - change checklatency sub
##outputs to ravens scores - running multiple times will NOT rewrite the file
##data being read is in the format below - if you include more variables in the inquist file, you will need to change
## where the data is being read in

#~ date	time	subj	bcode		block	trial	tcode	lat	resp	cor	
#~ 032706	14:53	1	expblock1	1	1	1	15797	5	0	
#~ 032706	14:53	1	expblock1	1	1	2	1030	1	0	
#~ 032706	14:53	1	expblock1	1	1	3	3785	7	0	
#~ 032706	14:53	1	expblock1	1	1	4	958	4	0	
#~ 032706	14:53	1	expblock1	1	1	5	890	3	0	
#~ 032706	14:53	1	expblock1	1	1	6	2065	1	0	
#~ 032706	14:53	1	expblock1	1	1	7	2247	6	0	
#~ 032706	14:53	1	expblock1	1	1	8	1152	1	0	
#~ 032706	14:53	1	expblock1	1	1	9	3925	8	0	
#~ 032706	14:53	1	expblock1	1	1	10	6932	4	0	
#~ 0		1	2	3		4	5	6	7	8	9


#declaring variables for data to be entered
$fileopen = 0;
$filenew = "ravenscores.txt";

$totaltime = 0;
$totalcorrect = 0;

sub checklatencies {

for ($i=0; $i<@trial; $i++)
{
if ($code[$i] == 13 or $code[$i] == 24)  ##resets counter for each block
	{
	$totaltime =0;
	}####take out this section for 25 minute time period

$totaltime = $totaltime + $trial[$i];

if ($totaltime < 300000)###25 = 1500000
	{
	if ($answer[$i] == $check[$i])
		{
		$totalcorrect = $totalcorrect+1;
		}
	}

#~ print $totaltime, " ", $answer[$i], " ", $check[$i], " ", $totalcorrect, "\n";

}
}

@check = qw/
5
1
7
4
3
1
6
1
8
4
5
6
2
1
2
4
6
7
3
8
8
7
6
3
7
2
7
5
6
5
4
8
5
1
3
2/;


#######entering file names 
print "Please enter the filename where the data is stored:\n";
$fileopen = <STDIN>;

####open file and read it
open(FIN,$fileopen) or die("File $fileopen not found\n");

while(<FIN>){
  next if /^date/;
  next if /practice/;
  chomp;
tr/ \t/ /s;
  @line = split;
  
  #####saving lines as lists
  $date = $line[0];####note this should only be used when every subject is saved in their own file
  $time = $line[1];
  $subject = $line[2];
  push @trial, $line[7];
  push @answer, $line[8];
  push @code, $line[6];
};
######

#~ for ($i=0; $i<@trial; $i++)
#~ {
#~ print $trial[$i], " ", $answer[$i], "\n";
#~ }

close(FIN);


######open new file and print output to that file

checklatencies();


open(FOUT,">>$filenew");  # file creation

 print FOUT "Date  Time  Subject  Score\n";
 print FOUT "$date  $time $subject  $totalcorrect\n";

close(FOUT);

print "Your score is saved in $filenew.";
