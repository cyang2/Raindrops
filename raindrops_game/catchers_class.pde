class catchers
{
  PVector loc;
  PImage mug;

  catchers()
  {
    loc = new PVector(mouseX + 35, height - 75);
    mug = loadImage("mug.jpg");
  }

  void show()
  {
    fill(255);
    loc.set(mouseX + 35, height - 75);
    image(mug, loc.x, loc.y);
    fill(56, 127, 205);
    //water level
    rect(mouseX + 2, loc.y - score*5, 46, 30 + score*5);
  }
}

