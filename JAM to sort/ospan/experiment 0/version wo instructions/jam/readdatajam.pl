print "Please enter subject # and just number: ";
$subject = <STDIN>;
chomp $subject;
$filenew = "jamsubjects.txt";
$totallo=0;
$totalmed=0;
$totalhi=0;

sub readjam{

$fileopen="blank$subject.txt";

open(FIN,$fileopen) or die("File $fileopen not found\n");

#~ TRANSFER P2     blank 4/21/2006 1:30:44 PM 03 00           chirp            bird    78  100 
#~ TRANSFER P2     blank 4/21/2006 1:30:56 PM 03 01             oak            tree    80   60 
#~ TRANSFER P2     blank 4/21/2006 1:31:04 PM 03 02           freak           weird    18   90 
#~ TRANSFER P2     blank 4/21/2006 1:31:11 PM 03 03            evil             bad    14   82 
#~ 0		1	2	3		4     5    6     7		8		9	10  11

while(<FIN>){
   next if /^#/;
  chomp;
 tr/ \t / /s; #remove white space from line

@line = split;

push @trial1, $line[6]; 
push @trial2, $line[7];
push @realjam, $line[10];
push @ansjam, $line[11];

}
}

readjam();

for ($i=0; $i<@realjam; $i++)
{
	if ($realjam[$i] < 19)
	{
		$jamsplit[$i] = 1;
	}
	elsif($realjam[$i] >18 && $realjam[$i] < 60)
	{
		$jamsplit[$i] = 2;
	}
	elsif ($realjam[$i] > 59)
	{
		$jamsplit[$i] = 3;
	}
}


for ($i=0; $i<@realjam; $i++)
{

	if ($jamsplit[$i]==1)
	{
		$totallo = $ansjam[$i]+$totallo;
		$nlo++;
		#print "$totallo $ansjam[$i]";
	}

	if ($jamsplit[$i]==2)
	{
		$totalmed = $ansjam[$i]+$totalmed;
		$nmed++;
		#print "$totalmed $ansjam[$i]";
	}

	if ($jamsplit[$i]==3)
	{
		$totalhi = $ansjam[$i]+$totalhi;
		$nhi++;
		#print "$totalhi $ansjam[$i]";
	}

}

$avglo = $totallo/18;
$avgmed = $totalmed/18;
$avghi = $totalhi/18;

open(FOUT,">>$filenew");  # file creation
print FOUT "$subject $avglo $avgmed $avghi $nlo $nmed $nhi\n";
close FOUT;

