<?

$idnumber = $_POST["idnumber"];

$lost = $_POST["lost"];
$old = $_POST["old"];
$article = $_POST["article"];
$bum = $_POST["bum"];
$chauffeur = $_POST["chauffeur"];
$chowder = $_POST["chowder"];
$bashful = $_POST["bashful"];
$racket = $_POST["racket"];
$casual = $_POST["casual"];
$pupil = $_POST["pupil"];
$assist = $_POST["assist"];
$dancer = $_POST["dancer"];
$organize = $_POST["organize"];
$corpse = $_POST["corpse"];
$peaceful = $_POST["peaceful"];
$computer = $_POST["computer"];
$bouquet = $_POST["bouquet"];
$common = $_POST["common"];
$closed = $_POST["closed"];
$cloth = $_POST["cloth"];
$melody = $_POST["melody"];
$car = $_POST["car"];
$dangerous = $_POST["dangerous"];
$before = $_POST["before"];
$beginning = $_POST["beginning"];
$difficult = $_POST["difficult"];
$break = $_POST["break"];
$patience = $_POST["patience"];
$cinema = $_POST["cinema"];
$challenge = $_POST["challenge"];
$body = $_POST["body"];
$blow = $_POST["blow"];
$meow = $_POST["meow"];


$headstring = "Free Association Data " . $idnumber . "\n";
$headstring .= "Practice:\n";
$headstring .= "lost " . $lost . "\n";
$headstring .= "old " . $old  . "\n";
$headstring .= "article " . $article  . "\n";
$headstring .= "Experimental:\n";


$headstring .= "bum	" . $bum . "\n";
$headstring .= "chauffeur " . $chauffeur . "\n";
$headstring .= "chowder	" . $chowder . "\n";
$headstring .= "bashful	" . $bashful . "\n";
$headstring .= "racket " . $racket . "\n";
$headstring .= "casual " . $casual . "\n";
$headstring .= "pupil " . $pupil . "\n";
$headstring .= "assist " . $assist . "\n";
$headstring .= "dancer " . $dancer . "\n";
$headstring .= "organize " . $organize . "\n";
$headstring .= "corpse " . $corpse . "\n";
$headstring .= "peaceful " . $peaceful . "\n";
$headstring .= "computer " . $computer . "\n";
$headstring .= "bouquet	" . $bouquet . "\n";
$headstring .= "common " . $common . "\n";
$headstring .= "closed " . $closed . "\n";
$headstring .= "cloth " . $cloth . "\n";
$headstring .= "melody " . $melody . "\n";
$headstring .= "car	" . $car . "\n";
$headstring .= "dangerous	" . $dangerous . "\n";
$headstring .= "before " . $before . "\n";
$headstring .= "beginning " . $beginning . "\n";
$headstring .= "difficult " . $difficult . "\n";
$headstring .= "break " . $break . "\n";
$headstring .= "patience " . $patience . "\n";
$headstring .= "cinema	" . $cinema . "\n";
$headstring .= "challenge " . $challenge . "\n";
$headstring .= "body " . $body . "\n";
$headstring .= "blow " . $blow . "\n";
$headstring .= "meow " . $meow . "\n";

$allstring = $headstring . $allstring;

$subject = "ASSOCIATION " . $idnumber;
$from = "erin@olemiss.edu";
mail("buchananlab@gmail.com", $subject, $allstring, $from);


?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD></HEAD>

<BODY>
<div style="margin-top:50px; cursor:default;">
<table width="80%" border="4" cellspacing="0" cellpadding="8" align="center" bordercolor="#000000" height="80%">
  <tr>
    <td valign="middle" bgcolor="#CCCCCC" align="center">
	    <div style="font: 12pt verdana; font-weight:bold;">Thank you for participating in our 
	    experiment.  The information collected will be used to understand the relationship 
	    between word pairs.  This collection will be used in further studies to understand how people process word information.<br>
          <br>
          You will receive credit on PSPM within the week.<br>
          </div>
	</td>
  </tr>
</table>
</div>
</BODY>
</HTML>


