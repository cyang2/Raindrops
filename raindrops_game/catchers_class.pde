class catchers
{
  PVector loc;
  PImage mug;

  catchers()
  {
    //counter the picture's offset
    loc = new PVector(mouseX + 35, height - 75);
    mug = loadImage("mug.jpg");
  }

  void show()
  {
    //reset the location so that the catcher keeps moving and redrawing
    loc.set(mouseX + 35, height - 75);
    //mug picture as the catcher
    image(mug, loc.x, loc.y);
    //water level
    fill(56, 127, 205);
    rect(mouseX + 2, loc.y - score*5, 46, 30 + score*5);
  }
}

