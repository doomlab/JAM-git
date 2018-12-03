 <?

if($endGameField)
{
$allstring = "******************OVERALL DATA FOR $id******************\n";
$allstring .= "Test Date: " . date("m/d/Y") . "\n";
$allstring .= "Test Time: " . date("h:i:s") . "\n";
$allstring .= "IP Address: " . $_SERVER['REMOTE_ADDR'] . "\n";
$allstring .= "Final math percentage: " . $mathPercentage . "\n";
$allstring .= "Total problems shown: " . $totalLetters . "\n";
$allstring .= "Total letters correct: " . $lettersCorrect . "\n";


$rawString = explode("^",$endGameField);
$label = "";
$cnt = 1;
$masterCnt = 1;
	for($i=1; $i<count($rawString); $i++) //Scip first line because it is blank
	{		
		if($cnt == 13)
		{
		$cnt = 1;
		$masterCnt ++;
		}

		if($cnt == 1)
		{
		$allstring .= "\n******************SET $masterCnt DATA FOR $id******************\n";
		$allstring .= "Maximum Math Time: " . $mathTime . "\n";
		}

		switch($cnt)
		{
		case 1:$label = "Equations: "; break;
		case 2:$label = "Shown Answers: "; break;
		case 3:$label = "Correct Answers: "; break;
		case 4:$label = "Student Answers: "; break;
		case 5:$label = "Student Was Correct: "; break;
		case 6:$label = "Letters Shown: "; break;
		case 7:$label = "Students Letters: "; break;
		case 8:$label = "Time on Problem screen: "; break;
		case 9:$label = "Time on Answer Screen: "; break;
		case 10:$label = "Times on Recall screen: "; break;
		case 11:$label = "Session Letters Correct: "; break;
		case 12:$label = "Session Math Percentage: "; break;
		default: break;
		}
	$allstring .= $label . $rawString[$i] . "\n";
	$cnt ++;
	}

$to = "aggieerin@gmail.com";
$subject = "$id";
$message = "$allstring";
$headers = "From: aggieerin@gmail.com";
mail($to, $subject, $message, $headers);

}

?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> OSPAN </TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
</HEAD>

<BODY>
<div style="margin-top:50px; cursor:default;">
<table width="80%" border="4" cellspacing="0" cellpadding="8" align="center" bordercolor="#000000" height="80%">
  <tr>
    <td valign="middle" bgcolor="#CCCCCC" align="center">
	<div style="font: 22pt verdana; font-weight:bold;">The game is over.<br><br>
          Thank you for participating.<br>
          <br>
          <br>
          <a href="javascript:window.close()">Close this window</a>.</div>
	</td>
  </tr>
</table>
</div>
</BODY>
</HTML>
