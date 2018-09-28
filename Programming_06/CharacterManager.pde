class CharacterManager
{
    Human[] humans;
    int numberOfSurvivors;

    CharacterManager(int numberOfCharacters)
    {
        humans = new Human[numberOfCharacters];

        for(int i = 0; i < humans.length; i++)
        {
            humans[i] = new Human(random(width), random(height));
        }
        numberOfSurvivors = numberOfCharacters;
        humans[0] = new Zombie(random(width), random(height));
        numberOfSurvivors--;
    }

    void update()
    {
        for(int i = 0; i < humans.length; i++)
        {
            humans[i].update();
            for(int j = i+1; j < humans.length; j++)
            {
                if (((humans[i]instanceof Zombie)&&(!(humans[j]instanceof Zombie)))||((humans[j]instanceof Zombie)&&(!(humans[i]instanceof Zombie))))
                {
                    if (checkCollision(humans[j].position.x, humans[j].position.y, humans[i].position.x, humans[i].position.y))
                    {
                        if ((humans[i]instanceof Zombie)&&(!(humans[j]instanceof Zombie)))
                        {
                            humans[j] = new Zombie(humans[j].position.x, humans[j].position.y);
                        }
                        if ((humans[j]instanceof Zombie)&&(!(humans[i]instanceof Zombie)))
                        {
                            humans[i] = new Zombie(humans[i].position.x, humans[i].position.y);
                        }
                        //makeItBite(humans[i], humans[j]);
                    }
                }
                
            }
        }
    }

    int numberOfSurvivors()
    {
        numberOfSurvivors=0;
        for(int i = 0; i < humans.length; i++)
            if (humans[i]instanceof Zombie)
            {

            }
            else
            {
                numberOfSurvivors++;
            }
        return(numberOfSurvivors);
    }

    void draw()
    {
        for(int i = 0; i < humans.length; i++)
        {
            if (humans[i] instanceof Zombie)
            {
                fill(0,175,0);
            }
            else
            {
                fill(0,0,175);    
            }
            humans[i].draw();
        }
    }
}