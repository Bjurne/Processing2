Ball ball;
BallManager ballManager;
int numberOfBalls = 500;


void setup()
{
	size(640,480);
	frameRate(60);
	ballManager = new BallManager(numberOfBalls);
}

void draw()
{

	background(255);
	ballManager.update();
	ballManager.draw();

}

