void remainingHumans(int i)
{
	String survivors = str(i);
	fill(125,125,155,155);
	rect(5, height-70, 90, 30, 3, 12, 3, 12);
	fill(12);
	textSize(8);
	textAlign(LEFT);
	text("Humans remaining:", 15, height-65, 60, 30);
	textSize(16);
	textAlign(RIGHT);
	fill(243,i*9,i*9);
	text(survivors, 10, height-65, 80, 30);
}