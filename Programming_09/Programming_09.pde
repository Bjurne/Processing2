GameObject cells[][];
int cellSize = 5;
int fillPercentage = 15;
int displayAreaSize = 30;
int backgroundAlphaValue = 200;
int numberOfColumns, numberOfRows;

int numberOfRedCells, numberOfGreenCells, numberOfBlueCells, numberOfYellowCells;


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
	displayStatistics();
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


void displayStatistics()
{
	numberOfRedCells=0;
	numberOfGreenCells=0;
	numberOfBlueCells=0;
	numberOfYellowCells=0;

	for (int y = 0; y < numberOfRows; ++y)
	{
		for (int x = 0; x < numberOfColumns; ++x)
		{
			cells[x][y].colorOfCell();
		}
	}

	fill(255);
	rect(0, height - displayAreaSize, width, displayAreaSize);
	fill(0);

	text(str(numberOfRedCells), 10, height - displayAreaSize, 70, displayAreaSize);
	text(str(numberOfGreenCells), 90, height - displayAreaSize, 70, displayAreaSize);
	text(str(numberOfBlueCells), 170, height - displayAreaSize, 70, displayAreaSize);
	text(str(numberOfYellowCells), 250, height - displayAreaSize, 70, displayAreaSize);
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
