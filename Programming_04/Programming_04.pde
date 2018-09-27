PVector circle; //Vector for the small circles possition
PVector mouse; //Vector for the mouses possition
//Ended up not really using this vector, but kept it since I'm wondering why the code didn't compute
PVector dif; //Vector for the difference between the circle and the mouse

PVector position; //Vector for the position of the bigger circle
PVector direction; //Vector for the direction of the bigger circle

void setup () 
{
  size(640, 480);

  circle = new PVector(width/2, height/2); //The small circle spawn in the middle of the screen
  mouse = new PVector (mouseX, mouseY); //The mouse vector is set to the position of the actual mouse pointer
  dif = new PVector();
  
  position = new PVector(75,75); //The bigger circle spawn in the top left corner of the screen
  direction = new PVector(4,4); //The bigger circle start moving towards the bottom right corner, at a slightly lower speed than the small circle
}

void draw ()
{
  background(33,108,133);
  
  circleToMouse();
  bouncingCircle();
}

void circleToMouse()
{
  dif.x = circle.x - mouseX; //Sets the values of the dif vector, wich is the distance
  dif.y = circle.y - mouseY;
  //dif.set(circle.sub(mouse)); //Unfortunately I couldn't get this to execute properly, would like to know why

  if (dif.mag() > 5) //The circle will only start moving if the mouse pointer has been moved at least 5 pixels, instead of spasmodically languish for input
  {
    dif.normalize(); //I think this sets the vectors values to between 0 and 1, wich means smaller more manageable floats
    dif.mult(5); //Sets the movement speed of the smaller circle. Noticed that a large number would render som interesting results
    circle.set(circle.sub(dif)); // Makes the circle move to a position between where it currently is and where the mouse pointer is
  }
  
  fill(255, 90, 15);
  stroke(255, 90, 15);
  ellipse(circle.x, circle.y, 100, 100); //Sets the color, margin and size of the small circle, and continually draws it in the proper position
}

void bouncingCircle()
{
  fill(15, 255, 90);
  stroke(15, 255, 90);
  ellipse(position.x, position.y, 150, 150); //Sets the color, margin and size of the bigger circle, and continually draws it in the proper position
  
  position.set(position.add(direction)); //Adds the values of the direction vector to the position vector of the bouncing circle
  if (position.x>width-75 || position.x<75) direction.x=direction.x/-1; //If the circle touches either side of the screen the direction is reversed
  if (position.y>height-75 || position.y<75) direction.y=direction.y/-1; //If the circle touches the top or the bottom of the screen the direction is reversed
}
