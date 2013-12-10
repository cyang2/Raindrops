class raindrops
{
  PVector loc, vel, acc;
  PImage drop;
  float tintx;

  raindrops()
  {
    drop = loadImage("drop.png");
    imageMode(CENTER);
    loc = new PVector(random(width), -drop.height);
    vel = new PVector(0, 2);
    acc = new PVector(0, .1);
  }

  void show()
  {
    image(drop, loc.x, loc.y, 10, 15);
  }

  void fall()
  {
    loc.add(vel);
    if (loc.y >= 0) {
      vel.add(acc);
    }
  }
}

