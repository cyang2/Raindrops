raindrops[] drop = new raindrops[500];
catchers catcher;
timers timer;
boolean full = false;
int dropNum;
int d;
int score;
boolean play = false;
int level;

void setup()
{
  size(500, 500);
  d = 50;
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
  if (play)
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
    if (!full)
    {
      //only letting dropNum number of raindrops fall
      for (int i = 0; i < dropNum+1; i++)
      {
        drop[i].show();
        drop[i].fall();
        //catching the raindrops
        if (dist(drop[i].loc.x, drop[i].loc.y, catcher.loc.x, catcher.loc.y) <= d/2)
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
    }
    //when array is full, all 500 raindrops in the array fall
    if (full)
    {
      for (int i = 0; i < drop.length; i++)
      {
        drop[i].show();
        drop[i].fall();
        //catching the raindrops
        if (dist(drop[i].loc.x, drop[i].loc.y, catcher.loc.x, catcher.loc.y) <= d/2)
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
    }
    //catcher
    catcher.show();
    //displaying the score
    fill(0, 255, 0);
    text(score, 50, 50);
  }
  //displaying the level
  text("Level", width/2, 50);
  text(level, width/2, 75);
  //setup screen
  if (play == false)
  {
    //game over screen
    if (score == -5)
    {
      background(255, 0, 0);
      fill(0);
      textSize(100);
      text("GAME\nOVER", width/2, height/2 - 50);
    }
    else {
      background(255);
      fill(0, 255, 0);
      textSize(40);
      text("Raindrops", 250, 100);
      textSize(20);
      text("Press Space to Begin!", 250, 200);
    }
  }
  if (score == 5)
  {
    level++;
    score = 0;
  }
  //losing
  if (score == -5)
  {
    play = false;
  }
}

void keyPressed()
{
  if (key == ' ')
  {
    play = true;
  }
}

