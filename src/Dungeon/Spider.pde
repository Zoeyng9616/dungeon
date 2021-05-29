class Spider {
  //member variables
  int r, radius, health, x, y, speed;
  boolean right;
  int savedTime; 
  int totalTime;
  PImage spider;

  //contructor
  Spider(int x, int y, int t) {
    r = height;
    radius = 25;
    this.x = x;
    this.y = y;
    health = 50;
    speed = 1;
    this.totalTime = t;
    spider = loadImage("spider.png");
  }
  //member methods
  void display() {
    image(spider, x-1, y+900);
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
