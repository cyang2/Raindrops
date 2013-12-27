raindrops[] drop = new raindrops[500];
catchers catcher;
timers timer;
boolean full = false;
int dropNum;
int d;
int score;
boolean play = false;
int level;
boolean pause, restart;
int mode;

void setup()
{
  size(500, 500);
  d = 50;
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
  if (mode == 0)
  {
    //resets score and level
    score = 0;
    level = 0;
    //refreshes and resets the raindrops
    for (int i = 0; i < drop.length; i++)
    {
      drop[i].loc = new PVector(random(width), -drop[i].drop.height);
      drop[i].vel = new PVector(0, 2 + level);
      dropNum = 0;
      full = false;
    }
    background(255);
    fill(0, 255, 0);
    textSize(40);
    text("Raindrops", 250, 100);
    textSize(20);
    text("Press Space to Begin!", 250, 200);
    if (keyPressed && key == ' ')
    {
      mode = 1;
      level = 0;
      score = 0;
    }
  }  
  if (mode == 1)
  {
    background(0);
    //RAINDROPS
    //creating raindrops
    if (timer.count())
    {
      drop[dropNum] = new raindrops();
      dropNum++;
      //resetting after array fills
      if (dropNum >= drop.length)
      {
        dropNum = 0;
        full = true;
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
        drop[i].loc.x = -100;
        score++;
      }
      //decreasing the score
      if (drop[i].loc.y >= height + 20 && drop[i].loc.x >= 0)
      {
        drop[i].loc.y = height + 10;
        drop[i].vel.y = 0;
        drop[i].acc.y = 0;
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
  println(mode);
}


void keyPressed()
{
  //pausing
  if (key == 'p' && mode == 1)
  {
    mode = 2;
  }
  if (key == ' ')
  {
    mode = 1;
  }
  if (key == 'r')
  {
    mode = 0;
  }
}

void gameovercheck()
{
  if (score == -5)
  {
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
    level++;
    score = 0;
  }
}

