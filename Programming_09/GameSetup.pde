	
void gameSetup()
{
	strokeWeight(0);
	ellipseMode(LEFT);
	frameRate(4);
	background(60);
	textSize(24);


	numberOfColumns = (int)Math.floor(width / cellSize);
	numberOfRows = (int)Math.floor(height / cellSize);

	cells = new GameObject[numberOfColumns][numberOfRows];


	for (int y = 0; y < numberOfRows; ++y)
	{
		for (int x = 0; x < numberOfColumns; ++x)
		{
			cells[x][y] = new GameObject(x * cellSize, y * cellSize, cellSize);
			if (random(0, 100) < fillPercentage)
			{
				cells[x][y].alive = true;
			}
		}	
	}
}