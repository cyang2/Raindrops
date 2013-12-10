raindrops[] drop = new raindrops[500];
catchers catcher;
timers timer;
boolean full = false;
int dropNum;
int d;
int score;
boolean play = false;

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
}

void draw()
{
  if (play == false)
  {
    background(255);
    fill(0, 255, 0);
    textSize(40);
    text("Raindrops", 250, 100);
    textSize(20);
    text("Press Space to Begin!", 250, 200);
  }
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
        if (drop[i].loc.y == height)
        {
          score--;
        }
      }
    }
    //catcher
    catcher.show();
    //displaying the score
    fill(0, 255, 0);
    text(score, 50, 50);
    //setup screen
  }
}

void keyPressed() {
  if (key == ' ')
  {
    play = true;
  }
}
