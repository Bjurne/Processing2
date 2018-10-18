GameObject cells[][];
int cellSize = 5;
int fillPercentage = 15;
int backgroundAlphaValue = 200;
int numberOfColumns, numberOfRows;


void setup()
{
	size(512, 512);
	gameSetup();
}


void draw()
{
	updateBackground();
	updateCellData();
	drawCells();
	loadNextGeneration();
}


void updateBackground()
{
	fill(60, 60, 60, backgroundAlphaValue);
	rect(0, 0, width, height);
	fill(255);
}


void updateCellData()
{
	for (int y = 0; y < numberOfRows; ++y)
	{
		for (int x = 0; x < numberOfColumns; ++x)
		{
			cells[x][y].calculateNextGeneration(x, y);
		}
	}
}


void drawCells()
{
	for (int y = 0; y < numberOfRows; ++y)
	{
		for (int x = 0; x < numberOfColumns; ++x)
		{
			cells[x][y].draw();
		}
	}
}


void loadNextGeneration()
{
	for (int y = 0; y < numberOfRows; ++y)
	{
		for (int x = 0; x < numberOfColumns; ++x)
		{
			cells[x][y].updateCellState();
		}
	}
}
