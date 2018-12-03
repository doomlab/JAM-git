###stuff to do:
###look up what the gunk should be

sub scramble {
  local @randtemp;
  local @list = @_;
  push(@randtemp, splice(@list, rand(@list),1)) while @list;
  return @randtemp;
}


open (FOUT, ">text.exp");

print FOUT <<ERIN;
<text assoc>
/ erase = true(220,220,220)
/ txbgcolor =(220,220,220)
/ font = ("Verdana", -18, 400, 0, 34)
/ items = ("How many of 100 students do you think would have given the SECOND word?")
/ numitems = 1
/ position = (50,30)
</text>

<text freeassociate>
/ erase = true(220,220,220)
/ txbgcolor =(220,220,220)
/ font = ("Verdana", -18, 400, 0, 34)
/ items = ("Please list the first word that comes to your mind.")
/ numitems = 1
/ position = (50,30)
</text>

<text writewordstext>
/ erase = true(220,220,220)
/ txbgcolor =(220,220,220)
/ font = ("Verdana", -18, 400, 0, 34)
/ items = ("Please write down the FIRST judgment word from each set in order.")
/ numitems = 1
/ position = (50,30)
</text>

ERIN

###pull in words here
#~  label first second

open(FIN,"finalpairs2.txt");
while(<FIN>) {
next if /#/;
  chomp; tr/ \t/ /s;
@line = split;

push @trialcode, $line[0];
push @judge1, $line[1];
push @judge2, $line[2];


}
close(FIN);

for ($i=0; $i<@judge1; $i++)
{

print FOUT <<TEXT;
<text $judge1[$i]>
/ erase = true(220,220,220)
/ font = ("Verdana", -18, 400, 0, 34)
/ items = ("$judge1[$i]         $judge2[$i]")
/ numitems = 1
/ position = (50,50)
/ txbgcolor = (220,220,220)
</text>

TEXT

}

print FOUT <<erin;
<text LOST>
/ erase = true(220,220,220)
/ font = ("Verdana", -18, 400, 0, 34)
/ items = ("LOST")
/ numitems = 1
/ position = (50,40)
/ txbgcolor = (220,220,220)
</text>

<text OLD>
/ erase = true(220,220,220)
/ font = ("Verdana", -18, 400, 0, 34)
/ items = ("OLD")
/ numitems = 1
/ position = (50,40)
/ txbgcolor = (220,220,220)
</text>

<text MAGAZINE>
/ erase = true(220,220,220)
/ font = ("Verdana", -18, 400, 0, 34)
/ items = ("MAGAZINE")
/ numitems = 1
/ position = (50,40)
/ txbgcolor = (220,220,220)
</text>

<text question1>
/ erase = true(220,220,220)
/ font = ("Verdana", -18, 400, 0, 34)
/ items = ("In a free association test, participants such as myself see a list of words. We would be expected to: (a) highlight those words we think are pleasant. (b) put a check mark by each word that we recognize. (c) write down the first word that comes to mind for each word in the list. (d) try to remember each word for a future memory test.")
/ numitems = 1
/ position = (50,30)
/ txbgcolor = (220,220,220)
/ size = (600,100)
</text>

<text question2>
/ erase = true(220,220,220)
/ font = ("Verdana", -18, 400, 0, 34)
/ items = ("If given the pair QUACK-DUCK in the experiment, I was supposed to guess the number of people who would: (a) give DUCK in response to QUACK (b) give QUACK in response to DUCK (c) give FAKE in response to QUACK (d) give HUNT in response to DUCK")
/ numitems = 1
/ position = (50,30)
/ size = (600,100)
/ txbgcolor = (220,220,220)
</text>

erin


close (FOUT);

open (FOUT, ">trials.exp");

for ($k=0; $k<@trialcode; $k++)
{
#~ print $trialcode[$k], "\n";

print FOUT <<TYPE;
<likert $trialcode[$k]>
/ anchors = [1 = "0-9"; 2 = "10-19"; 3 = "20-29"; 4 ="30-39"; 5 = "40-49"; 6="50-59"; 7="60-69"; 8="70-79"; 9="80-89"; 10 = "90-100";]
/ correctmessage = false 
/ errormessage = false 
/ mouse = true
/ numpoints = 10
/ position = (50,60)
/ posttrialpause = 500
/ stimulusframes = [1 =$judge1[$k], assoc;]
/ trialcode = "$trialcode[$k]"
</likert>

TYPE
}

print FOUT <<erin;
<openended fa1>
/ frames = [1=freeassociate, LOST;]
/ buttonlabel =  "CONTROL ENTER"
/ charlimit = 40
/ linelength = 40
/ trialcode = "lost"
</openended>

<openended fa2>
/ frames = [1=freeassociate, OLD;]
/ buttonlabel =  "CONTROL ENTER"
/ charlimit = 40
/ linelength = 40
/ trialcode = "old"
</openended>

<openended fa3>
/ frames = [1=freeassociate, MAGAZINE;]
/ buttonlabel =  "CONTROL ENTER"
/ charlimit = 40
/ linelength = 40
/ trialcode = "magazine"
</openended>

<openended writewords>
/ frames = [1=writewordstext;]
/ buttonlabel =  "CONTROL ENTER"
/ charlimit = 400
/ linelength = 40
/ trialcode = "writewords"
</openended>

<likert followup1>
/ anchors = [1 = "a"; 2 = "b"; 3 =  "c"; 4 = "d";]
/ correctmessage = false 
/ errormessage = false 
/ mouse = true
/ numpoints = 4
/ position = (50,60)
/ posttrialpause = 500
/ stimulusframes = [1 =question1;]
/ trialcode = "followup1"
</likert>

<likert followup2>
/ anchors = [1 = "a"; 2 = "b"; 3 =  "c"; 4 = "d";]
/ correctmessage = false 
/ errormessage = false 
/ mouse = true
/ numpoints = 4
/ position = (50,60)
/ posttrialpause = 500
/ stimulusframes = [1 =question2;]
/ trialcode = "followup2"
</likert>

erin

close (FOUT);


