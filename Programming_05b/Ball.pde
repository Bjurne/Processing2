class Ball
{
    PVector position;
    PVector velocity;
    PVector acceleration;
    int red,green,blue,alpha;

    Ball(float x, float y)
    {
        position = new PVector(x, y);
        velocity = new PVector(2,5);
        acceleration = new PVector(0.01,0.075);
        red = int(random(0, 255));
        green = int(random(0, 255));
        blue = int(random(0, 255));
        alpha = int(random(55, 255));

    }

        void update()
    {
        velocity.x+=acceleration.x;
        velocity.y+=acceleration.y;


        if (position.x > width + 5)
        {
            position.x = -5;
        
        }

        float deltaY=(velocity.y);

        if (position.y+deltaY>=height-5)
        {
            velocity.y=-velocity.y;
            velocity.y*=0.9;
            velocity.x*=0.5;

        }
        
        position.add(velocity);
    }

    void draw()
    {
        fill(red,green,blue,alpha);
        ellipse(position.x, position.y, 10, 10);
    }
}