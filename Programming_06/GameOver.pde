//float timeSurvived;
//string endGameText;

void gameOver()
{
	float timeSurvived = round(millis()/100.0) / 10.0;
	String endGameText = " The human race was annihilated in " + (timeSurvived) + " seconds.";
	fill(255,33,33,255);
	textSize(72);
	textAlign(CENTER, CENTER);
	text("Game Over!", 10, 10, width-10, height/3);
	fill(0);
	textSize(48);
	text(endGameText, 10, height/8, width-10, height-10);
    noLoop();

}