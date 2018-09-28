class Zombie extends Human
{
	Zombie(float x, float y)
	{
	super(x,y);
	velocity.x = random(3) - 1.5;
	velocity.y = random(3) - 1.5;
	fill(0,175,0);
	}
}