import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Programming_05 extends PApplet {

PVector position, velocity, tempVelocity, acceleration; //My vectors for handling the movement of the ball

float tpf; // Time per frame
float time;
int ballSize = 30;

public void setup()
{
	
	position = new PVector(width/4,height/4);
	velocity = new PVector(8,20);
	tempVelocity = new PVector(0,0);
	acceleration = new PVector(10,75);
	frameRate(60);
}

public void draw()
{
	float currentTime =millis();
	println(currentTime);
	tpf = (currentTime - time) * 0.001f;
	background(255, 255, 255, 255);

	drawBall();
	time = currentTime;
}

public void drawBall()
{
	velocity.x+=(acceleration.x*0.75f)*tpf;
	velocity.y+=acceleration.y*tpf;


	if (position.x > width + ballSize/2)
	{
		position.x = -ballSize/2;
	
	}

	float deltaY=(velocity.y*tpf);

	if ((position.y+deltaY<=ballSize/2)||(position.y+deltaY>=height-ballSize/2))
	{
		//position.y = height -5;
		velocity.y=-velocity.y;
		velocity.y*=0.9f;
		velocity.x*=0.5f;

	}

	//velocity.normalize();
	tempVelocity.set(0,0);
	tempVelocity = velocity.copy();
	tempVelocity.mult(tpf);
	position.add(tempVelocity);
	ellipse(position.x, position.y, ballSize, ballSize);

}


  public void settings() { 	size(640,480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Programming_05" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
