class Human
{
    PVector position;
    PVector velocity;

    Human(float x, float y)
    {
        position = new PVector(x, y);

        velocity = new PVector();
        velocity.x = random(6) - 3;
        velocity.y = random(6) - 3;
        fill(0,0,175);

    }

    void update()
    {
        if (position.x<=-5)
        {
            position.x += (width+ 10);
        }
        else if (position.x > (width+5))
        {
            position.x -= (width + 10);
        }

        if (position.y<=-5)
        {
            position.y += (height + 10);
        }
        else if (position.y > (height+5))
        {
            position.y -= (height + 10);
        }

        position.x += velocity.x;
        position.y += velocity.y;

    }

    void draw()
    {
        ellipse(position.x, position.y, 10, 10);
    }
}