opendir my $dir, "/Users/ausername/Dropbox/debiasing judgments/experiment spring 2012" or die "Cannot open directory: $!";
my @files = readdir $dir;
closedir $dir;

#~ for ($i = 0; $i<@files; $i++)
#~ {
	#~ print $files[$i], "\n";
#~ }


for ($i=2; $i<@files; $i++)
{

open(FIN,"$files[$i]");
while(<FIN>) {
next if /#/;
chomp; tr/ \t/ /s;
next if /^date/;
next if /writewords/;

#~ date	time	subject	trialcode	trialnum	latency	response
#~ 020212	13:34	200	old	1	14085	wrinkles
#~ 020212	13:34	200	lost	2	4664	found
#~ 020212	13:34	200	magazine	3	11734	celebrity

($date, $time, $subject,$trialcode,$trialnumber,$latency, $response) = split();

$responses{$trialcode}{$files[$i]} = $response;

print $subject, " ", $trialcode, " ", $response, "\n";
}
}

foreach $trial (sort keys %responses)
{
	print $trial, " ";
	
	foreach $person (sort keys %{$responses{$trial}})
	{
		print $person, " ", $responses{$trial}{$person}, " ";
	}
	print "\n";
}
