boolean checkCollision(float x1, float y1, float x2, float y2)
{
    int tooClose = 10;

    if (dist(x1, y1, x2, y2) < tooClose)
        {
            return true;
        }
        else
        {
            return false;
        }
}

// void makeItBite(humans[i], humans[j])
// {
// 	if ((humans[i]instanceof Zombie)&&(!(humans[j]instanceof Zombie)))
// 	{
// 	    humans[j] = new Zombie(humans[j].position.x, humans[j].position.y);
// 	}
// 	if ((humans[j]instanceof Zombie)&&(!(humans[i]instanceof Zombie)))
// 	{
// 	    humans[i] = new Zombie(humans[i].position.x, humans[i].position.y);
// 	}
// }