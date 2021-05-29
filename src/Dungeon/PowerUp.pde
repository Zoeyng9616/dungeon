class PowerUp {
  //member variables
  int x, y, speed, radius, pu;
  color c;
  PImage healthpowerup, laserpowerup;

  //contstructor
  PowerUp(int x, int y) {
    this.x = x;
    this.y = y;
    speed = int(random(1, 5));
    radius = 25;
    pu = int(random(2));
    healthpowerup = loadImage("healthpowerup.PNG");
    laserpowerup = loadImage("laserpowerup.PNG");
  }

  //member methods
  void move() {
    y+=speed;
  }

  void display() {
    switch(pu) {
    case 0: // life \\
      image(healthpowerup, x, y);
      break;
    case 1: // laser \\
      image(laserpowerup, x, y);
      break;
    }
  }
}
