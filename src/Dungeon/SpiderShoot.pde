class SpiderShoot {
  int r, x, y, speed, power; 
  color c;
  PImage web;

  SpiderShoot(int x, int y) {
    r = 4; 
    power = int(random(10, 100));
    this.x = x; 
    this.y = y; 
    speed = int(random(5, 22));    
    c = #ff0000;
    web = loadImage("web.png");
  }

  void fire() {
    x -= speed;
  }

  boolean reachedLeft() {
    if (x > width) { 
      return true;
    } else {
      return false;
    }
  }

  void display() {
    image(web, x, y);
  }
}
