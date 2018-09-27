float xCenter = 0;
float yCenter = 0;
float xPos = 0;
float yPos = 0;
float circleRadius = 100;
int numberOfPoints = 32;

void setup()
{
  size(640, 480);
  strokeWeight(5);
  xCenter = width / 2;
  yCenter = height / 2;
  
  drawCircle();
  //drawSpiral();
}


void drawCircle()
{
  background(255);
  for (int i = 0; i < numberOfPoints; i++)
  {
    xPos = xCenter + sin(TWO_PI/numberOfPoints * i)*circleRadius;
    yPos = yCenter + cos(TWO_PI/numberOfPoints * i)*circleRadius;
    point(xPos, yPos);
  }
}

void drawSpiral()
{
  background(255);
  for (int i = 0; i < numberOfPoints; i++)
  {
    xPos = xCenter + sin(TWO_PI/numberOfPoints * i)*circleRadius+(i*2);
    yPos = yCenter + cos(TWO_PI/numberOfPoints * i)*circleRadius-(i*2);
    point(xPos, yPos);
  }
}
