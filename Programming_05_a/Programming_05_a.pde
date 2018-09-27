PVector position, velocity, tempVelocity, acceleration; //My vectors for handling the movement of the ball

float tpf; // Time per frame
float time;
int ballSize = 30;

void setup()
{
	size(640,480);
	position = new PVector(width/4,height/4);
	velocity = new PVector(8,20);
	tempVelocity = new PVector(0,0);
	acceleration = new PVector(10,75);
	frameRate(60);
}

void draw()
{
	float currentTime =millis(); //Sets the value of currentTime to the number of milliseconds since we started the program
	tpf = (currentTime - time) * 0.001f; //Sets the value of the "timePerFrame" float to a thousandth of currentTime - time 
	background(255, 255, 255, 255);

	drawBall();
	time = currentTime;
}

void drawBall()
{
	velocity.x+=(acceleration.x*0.75)*tpf;
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
		velocity.y*=0.9;
		velocity.x*=0.5;

	}

	//velocity.normalize();
	tempVelocity.set(0,0);
	tempVelocity = velocity.copy();
	tempVelocity.mult(tpf);
	position.add(tempVelocity);
	ellipse(position.x, position.y, ballSize, ballSize);

}
