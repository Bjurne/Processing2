float boldness = (20);

void setup()
{
  size(768, 432);
}

void draw()
{
  background(255, 112, 24);
  stroke(24, 155, 112);
  strokeWeight(boldness);
  noFill();
  arc(50, 120, 180, 140, -1.57, HALF_PI, PIE);
  arc(50, 285, 220, 190, -1.57, HALF_PI, PIE);
  line(170, 190, 260, 200);
  line(255, 300, 260, 200);
  arc(180, 300, 150, 200, 0.00, HALF_PI, OPEN);
  arc(180, 350, 40, 100, 1.57, PI, OPEN);
  arc(340, 200, 105, 270, 0.00, PI, OPEN);
  line(425, 330, 425, 200);
  arc(470, 312, 90, 180, 3.14, 5.4, OPEN);
  line(525, 330, 525, 200);
  arc(570, 312, 90, 180, 3.14, 7.3, OPEN);
  arc(690, 260, 90, 130, 0.68, 5.9, OPEN);
  line(650, 270, 730, 235);
  
  if (mousePressed == true)
  {
    boldness = boldness + 1;
  }
  else if (boldness < 20)
  {
    //Do nothing
  }
  else
  {
    boldness = boldness - 1;
  }
}
