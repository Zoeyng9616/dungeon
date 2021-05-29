class DragonFire {
  int r, x, y, speed, power; 
  color c;

  DragonFire(int x, int y) {
    r = 4; 
    power = int(random(10, 100));
    this.x = x; 
    this.y = y; 
    speed = int(random(5, 22));    
    c = #ff0000;
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
    fill(c);
    noStroke();
    rect(x+70, y, 20, 5, 2);
  }
}
