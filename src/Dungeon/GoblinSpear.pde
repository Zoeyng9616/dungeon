class GoblinSpear {
  int r, x, y, speed, power; 
  color c;
  PImage spear;

  GoblinSpear(int x, int y) {
    r = 4; 
    power = int(random(10, 100));
    this.x = x; 
    this.y = y; 
    speed = int(random(5, 22));    
    c = #ff0000;
    spear = loadImage("spear.png");
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
    image(spear, x, y);
  }
}
