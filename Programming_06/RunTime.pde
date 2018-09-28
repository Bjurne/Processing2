void runTime()
{
	String runTime = str(round(millis()/100.0) / 10.0);
	fill(125,125,155,155);
	rect(5, height-35, 120, 30, 3, 12, 3, 12);
	fill(12);
	textSize(8);
	textAlign(LEFT);
	text("Elapsed time since outbreak:", 15, height-30, 60, 30);
	textSize(16);
	textAlign(RIGHT);
	fill(243);
	text(runTime, 10, height-30, 110, 30);
}