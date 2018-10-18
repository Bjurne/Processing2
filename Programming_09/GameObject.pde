public class GameObject
{
	int x;
	int y;
	int size;
	int neighbourCount;

	boolean alive = false;
	boolean aliveNextGeneration = false;

	float redValue,greenValue,blueValue=255;
	float redValueOfNeighbours,greenValueOfNeighbours,blueValueOfNeighbours;


	public GameObject (int x, int y, int size)
	{
		this.x = x;
		this.y = y;
		this.size = size;

		originalCellColor();
	}


	void originalCellColor()
	{
		if ((x > width * 0.8) && (y > (height - displayAreaSize) * 0.8))
		{
			redValue = 255;
			greenValue = 0;
			blueValue = 0;
		}
		else if ((x < width * 0.2) && (y > (height - displayAreaSize) * 0.8))
		{
			redValue = 0;
			greenValue = 255;
			blueValue = 0;
		}
		else if ((x < width * 0.2) && (y < height * 0.2))
		{
			redValue = 0;
			greenValue = 0;
			blueValue = 255;
		}
		else if ((x > width * 0.8) && (y < height * 0.2))
		{
			redValue = 255;
			greenValue = 255;
			blueValue = 0;
		}
		else
		{
			redValue = 255;
			greenValue = 255;
			blueValue = 255;
		}
	}


	void calculateNextGeneration(int x, int y)
	{
		neighbourCount = countNeighbours(x, y);
		colorOfNeighbours(x, y);
		shareColors();
		setNextGenerationState();
	}


	int countNeighbours(int x, int y)
	{
		neighbourCount = 0;

		for (int deltaY = -1; deltaY < 2; deltaY++)
		{
			for (int deltaX = -1; deltaX < 2; deltaX++)
			{
				if ((deltaX == 0) && (deltaY == 0)) 
				{
					continue;
				}

				try
				{
					if (cells[x + deltaX][y + deltaY].alive)
					{
						neighbourCount++;
					}
				}
				catch (ArrayIndexOutOfBoundsException e)
				{
					
				}
			}	
		}

		return neighbourCount;
	}


	void colorOfNeighbours(int x, int y)
	{
		redValueOfNeighbours = 0;
		greenValueOfNeighbours = 0;
		blueValueOfNeighbours = 0;

		for (int deltaY = -1; deltaY < 2; deltaY++)
		{
			for (int deltaX = -1; deltaX < 2; deltaX++)
			{
				try
				{
					if (cells[x + deltaX][y + deltaY].alive)
					{
						redValueOfNeighbours += cells[x + deltaX][y + deltaY].redValue;
						greenValueOfNeighbours += cells[x + deltaX][y + deltaY].greenValue;
						blueValueOfNeighbours += cells[x + deltaX][y + deltaY].blueValue;
					}
				}
				catch (ArrayIndexOutOfBoundsException e)
				{
					
				}
			}	
		}
	}


	void shareColors()
	{
		redValue = redValueOfNeighbours / neighbourCount;
		greenValue = greenValueOfNeighbours / neighbourCount;
		blueValue = blueValueOfNeighbours / neighbourCount;

		
		if ((redValue > greenValue) && (redValue > blueValue))
		{
			greenValue -= 10;
			blueValue -= 10;
		}
		if ((greenValue > blueValue) && (greenValue > redValue))
		{
			blueValue -= 10;
			redValue -= 10;
		}
		if ((blueValue > redValue) && (blueValue > greenValue))
		{
			redValue -= 10;
			greenValue -= 10;
		}
		if ((redValue > blueValue) && (greenValue > blueValue))
		{
			blueValue -= 10;
		}
	}


	void setNextGenerationState()
	{
		if (!alive)
		{
			if (neighbourCount == 3)
			{
				aliveNextGeneration = true;
			}
			else
			{
				aliveNextGeneration = false;
			}
		}

		else if ((neighbourCount < 2) || (neighbourCount > 3))
		{
			aliveNextGeneration = false;
		}

		else
		{
			aliveNextGeneration = true;

		}
	}


	void draw()
	{
		if (alive)
		{
			fill(redValue, greenValue, blueValue);
			rect(x, y, size, size);
		}
	}


	void updateCellState()
	{
		alive = aliveNextGeneration;
	}


	void colorOfCell()
	{
		if (alive)
		{
			if ((redValue > greenValue) && (redValue > blueValue))
			{
				numberOfRedCells++;
			}
			if ((greenValue > blueValue) && (greenValue > redValue))
			{
				numberOfGreenCells++;
			}
			if ((blueValue > redValue) && (blueValue > greenValue))
			{
				numberOfBlueCells++;
			}
			if ((redValue > blueValue) && (greenValue > blueValue))
			{
				numberOfYellowCells++;
			}
		}
	}
}
