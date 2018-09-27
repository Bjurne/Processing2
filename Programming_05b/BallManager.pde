class BallManager
{
    Ball[] balls;

    BallManager(int numberOfBalls)
    {
        balls = new Ball[numberOfBalls];

        for(int i = 0; i < balls.length; i++)
        {
            balls[i] = new Ball(random(width), random(height/10,height/2));
        }
    }

    void update()
    {
        for(int i = 0; i < balls.length; i++)
        {
            balls[i].update();
        }
    }



    void draw()
    {
        for(int i = 0; i < balls.length; i++)
        {
            balls[i].draw();
        }
    }
}