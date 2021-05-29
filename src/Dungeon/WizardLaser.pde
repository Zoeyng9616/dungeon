class WizardLaser {
  //member variables
  int r, x, y, speed, radius, damage;
  color c;

  //contstructor
  WizardLaser(int x, int y) {
    r = 20;
    this.x = x;
    this.y = y;
    speed = int(random(10,20));
    c = #007DFF;
    radius = 20;
    damage = 25;
  }

  //member methods
  void shoot() {
    x+=speed;
  }

  boolean reachedRight() {
    if (x > width) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    fill(c);
    noStroke();
    rectMode(CENTER);
    rect(x+40, y, r, r-15, 2);
  }
}
