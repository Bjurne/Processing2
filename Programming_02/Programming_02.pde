int strokeColor =0;

void setup()
{
  size(640, 480);
  strokeWeight(0.5);
  background(255);
}

void draw()
{
  int yPos = 30;
  float xPos = width - 30;
  
  for (int i = 0; i < height - 30; i = i + 10)
  {
    if (strokeColor % 3 ==0)
    { stroke(0);
    }
    else
    {
    stroke(128); 
    }
    line (30, yPos, xPos, 30);
    xPos = xPos - 13.18;
    yPos = yPos + 10;
    strokeColor++;
  }
}
