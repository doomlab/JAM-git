###stuff to do:
###look up what the gunk should be

sub scramble {
  local @randtemp;
  local @list = @_;
  push(@randtemp, splice(@list, rand(@list),1)) while @list;
  return @randtemp;
}

@trials = qw/
real1
real2
real3
real4
real5
real6
real7
real8
real9
real10
real11
real12
real13
real14
real15
real16
real17
real18
real19
real20
real21
real22
real23
real24
real25
real26
real27
real28
real29
real30
real31
real32
real33
real34
real35
real36
real37
real38
real39
real40
real41
real42
real43
real44
real45
real46
real47
real48
real49
real50
real51
real52
real53
real54
real55
real56
real57
real58
real59
real60
real61
real62
real63
real64
real65
real66
real67
real68
real69
real70
real71
real72
real73
real74
real75
real76
real77
real78
real79
real80
real81
real82
real83
real84
real85
real86
real87
real88
real89
real90
real91
real92
real93
real94
real95
real96
/;

@number = qw/
7
7
7
6
6
6
6
5
5
5
5
4
4
4
4
3
3
3
3
3
/;

for ($b=200;$b<226;$b++)
{
	

open (FOUT, ">RUN ME controlload".$b.".exp");

print FOUT <<ERIN;
<include>
/ file = "C:\\Documents and Settings\\Pumm207B\\Desktop\\load experiment\\control load\\instructions.exp"
/ file = "C:\\Documents and Settings\\Pumm207B\\Desktop\\load experiment\\control load\\trials.exp"
/ file = "C:\\Documents and Settings\\Pumm207B\\Desktop\\load experiment\\control load\\text.exp"
</include>

<data>
/ columns = [date time subject trialcode trialnum latency response]
/ format = tab
</data>

<defaults>
/ font = ("Verdana", -13, 400, 0, 34)
/ screencolor = (220,220,220)
/ txcolor=(0,0,0)
/ pretrialpause = 500
/ posttrialpause = 500
/ endlock = true
</defaults>

<instruct>
/ font = ("Verdana", -13, 400, 0, 34)
/ lastlabel = "Press enter to continue ..."
/ nextkey = (28)
/ nextlabel ="Press enter for next page"
/ prevkey = (14)
/ prevlabel = "Press Backspace for Previous page"
/ wait = 1000
/ windowsize = (640,400)
</instruct>

<block freeassoc>
/ preinstructions = (first, second)
/ trials = [1-3 = random(fa1, fa2, fa3)]
/ postinstructions = (wait)
</block>

<block pracrating1>
/ preinstructions = (third)
/ trials = [1-4 = random(prac1, prac2, prac3, prac4)]
/ postinstructions = (loadinstruct)
</block>

<block pracrating2>
/ trials = [1-4 = random(prac5, prac6, prac7, prac8); 5 = writewords]
/ postinstructions = (fourth)
</block>

<block realrating>
/ trials = [1 = sequence(
ERIN

###do random stuff here
@number2 = scramble(@number);
@trials2 = scramble(@trials);

@temptrial = @trials2;

for ($i=0; $i<@number2; $i++)
{
	$writewords = $number2[$i];
	
	for ($p=0; $p<$writewords;$p++)
	{
		$trialname = shift(@temptrial);
		print FOUT $trialname, ", ";
	}
	print FOUT "writewords, \n";
}	


print FOUT <<CHEESE;
)]
/ postinstructions = (fifth)
</block>

<block followup>
/ trials = [1-2 = random(followup1, followup2)]
/ postinstructions = (sixth)
</block>

<expt>
/ blocks = [1= freeassoc; 2= pracrating1;3=pracrating2; 4=realrating; 5=followup;]
</expt>
CHEESE

}



