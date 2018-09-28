Human human;
Zombie zombie;
CharacterManager characterManager;
int numberOfCharacters = 100;
int numberOfSurvivors = numberOfCharacters;

void setup()
{
   size(620, 440);
   //human = new Human(random(width), random(height));
   characterManager = new CharacterManager(numberOfCharacters);
   //zombie = new Zombie(random(width), random(height));
}

void draw()
{
	background(255);
	characterManager.update();
	characterManager.draw();
	runTime();
	remainingHumans(characterManager.numberOfSurvivors());
	//characterManager.numberOfSurvivors();
	//println(characterManager.numberOfSurvivors());
	if (characterManager.numberOfSurvivors() <= 0)
		{
			gameOver();
		}
	//characterManager.CharacterManager(numberOfCharacters);
	//characterManager.update();
}