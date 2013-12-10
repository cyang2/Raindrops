class catchers {
  PVector loc;

  catchers() {
    loc = new PVector(mouseX, height - 75);
  }

  void show() {
    fill(255);
    loc.set(mouseX, height - 75);
    ellipse(loc.x, loc.y, d, d);
  }
}

