//comments are directed towards the code underneath them

raindrops[] drop = new raindrops[500];
catchers catcher;
timers timer;
int dropNum;
int score;
int level;
int mode;

void setup()
{
  size(500, 500);
  score = 0;
  level = 0;
  mode = 0;
  //declaring the raindrops
  for (int i = 0; i < drop.length; i++)
  {
    drop[i] = new raindrops();
  }
  catcher = new catchers();
  timer = new timers();
  textSize(30);
  textAlign(CENTER);
  noCursor();
}

void draw()
{
  //START SCREEN MODE
  if (mode == 0)
  {
    //resets score and level
    score = 0;
    level = 0;
    //refreshes and resets the raindrops
    for (int i = 0; i < drop.length; i++)
    {
      // I would have said drop[i] = new raindrops(), but this actually makes the program run faster
      drop[i].loc = new PVector(random(width), -drop[i].drop.height);
      drop[i].vel = new PVector(0, 2 + level);
      dropNum = 0;
    }
    background(255);
    fill(0, 255, 0);
    textSize(40);
    text("Raindrops", 250, 100);
    textSize(20);
    text("Press Space to Begin!", 250, 200);
    //starts playing the game
    if (keyPressed && key == ' ')
    {
      //switches to the play mode
      mode = 1;
      //resets the score and level
      level = 0;
      score = 0;
    }
  }
  //PLAY MODE
  if (mode == 1)
  {
    background(0);
    //Raindrops
    //creating raindrops based on time
    //runs every 500 ms
    if (timer.count())
    {
      //creates a new raindrop in order
      drop[dropNum] = new raindrops();
      //increases the number of raindrops allowed to fall
      dropNum++;
      //resetting after array fills/runs out
      if (dropNum >= drop.length)
      {
        dropNum = 0;
      }
    }
    //only letting dropNum number of raindrops fall
    for (int i = 0; i < dropNum+1; i++)
    {
      drop[i].show();
      drop[i].fall();
      //catching the raindrops
      if (drop[i].loc.x >= mouseX && drop[i].loc.x <= mouseX + 72 && drop[i].loc.y >= catcher.loc.y && drop[i].loc.y <= catcher.loc.y + 70)
      {
        //moving the caught raindrops off the screen to the left
        drop[i].loc.x = -100;
        //increasing the score when the raindrops are caught
        score++;
      }
      //decreasing the score when raindrops fall to the bottom
      if (drop[i].loc.y >= height + 20 && drop[i].loc.x >= 0)
      {
        //making the raindrops stop moving and ensuring that they only decrease the score by one point 
        drop[i].loc.y = height + 10;
        drop[i].vel.y = 0;
        drop[i].acc.y = 0;
        //decreasing the score
        score--;
      }
    }
    catcher.show();
    //displaying the score
    textSize(20);
    fill(0, 255, 0);
    text("Score", 50, 50);
    text(score, 50, 75);
    //displaying the level
    text("Level", width/2, 50);
    text(level, width/2, 75);
    //displaying the pause instructions
    textSize(15);
    text("P to Pause", width - 70, 45);
    text("Space to Unpause", width - 70, 65);
    text("R to Restart", width - 70, 85);
  }
  gameovercheck();
  levelupcheck();
}


void keyPressed()
{
  //pausing
  if (key == 'p' && mode == 1)
  {
    //PAUSE MODE
    mode = 2;
  }
  //unpausing
  if (key == ' ')
  {
    //PLAY MODES
    mode = 1;
  }
  //restarting
  if (key == 'r')
  {
    //START SCREEN MODE
    mode = 0;
  }
}

void gameovercheck()
{
  if (score == -5)
  {
    //GAME OVER MODE
    mode = 3;
    background(255, 0, 0);
    fill(0);
    textSize(100);
    text("GAME\nOVER", width/2, height/2 - 150);
    textSize(50);
    text("Level", width/2 - 20, height/2 + 75);
    text(level, width/2 + 80, height/2 + 75);
    textSize(40);
    text("Press 'R' to Restart", width/2, height/2 + 175);
  }
}



void levelupcheck()
{
  if (score == 5)
  {
    //increases the level and resets the score
    level++;
    score = 0;
  }
}

