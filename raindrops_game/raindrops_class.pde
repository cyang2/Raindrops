class raindrops
{
  PVector loc, vel, acc;
  PImage drop;

  raindrops()
  {
    drop = loadImage("drop.png");
    imageMode(CENTER);
    //makes the raindrops start at a random x value just above the screen
    loc = new PVector(random(width), -drop.height);
    //increase difficulty as level increases
    vel = new PVector(0, 2 + level);
    acc = new PVector(0, .1);
  }

  void show()
  {
    image(drop, loc.x, loc.y, 10, 15);
  }

  void fall()
  {
    loc.add(vel);
    //makes sure the raindrops don't accelerate until they are past the top of the screen
    if (loc.y >= 0)
    {
      vel.add(acc);
    }
  }
}

