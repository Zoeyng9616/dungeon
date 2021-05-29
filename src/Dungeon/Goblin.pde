class Goblin {
  //member variables
  int r, radius, health, x, y, speed;
  boolean right;
  int savedTime; 
  int totalTime;
  PImage goblin;

  //contructor
  Goblin(int x, int y, int t) {
    r = height;
    radius = 25;
    this.x = x;
    this.y = y;
    health = 100;
    speed = 5;
    this.totalTime = t;
    goblin = loadImage("goblin.png");
  }
  //member methods
 void display() {
    image(goblin, x-1, y+900);
  }

  void move() {
    x += speed;
    if (x >= width|| x <= 0) {
      speed *= -1;
      y-=50;
    }
  }

  boolean laserIntersection(WizardLaser wizardLaser) {
    float distance = dist(x, y, wizardLaser.x, wizardLaser.y);
    if (distance < r + wizardLaser.r) {
      return true;
    } else {
      return false;
    }
  }

  void start() {
    savedTime = millis();
  }

  boolean done() { 
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}
