int frame = 0;
//float multiplier = 0.002;
int numberOfPoints = 100;
float xPos = 0;
float yPos = 0;
float angle = 0;
float amplitude = TWO_PI / 50;

void setup()
{
  size(640, 480);
  strokeWeight(5);
  frameRate(30);
}

void draw()
{
  background(255);
  stroke(223,37,37);

  for (int i = 0; i <= numberOfPoints; i = i + 1)
  {
    xPos = width / numberOfPoints * i;
    yPos = sin(i * 0.2 + angle)*50;
    point(xPos + i, yPos + 100);
  }

  stroke(100,100,244);

  for (int i = 0; i <= numberOfPoints; i = i + 1)
  {
    xPos = width / numberOfPoints * i;
    yPos = cos(i * 0.2 + angle + TWO_PI/5)*50;
    point(xPos + i, yPos + 100);
  }
  
  angle = angle + amplitude;

  //frame++;
}
