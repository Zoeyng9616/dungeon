class Wizard {
  //member variables
  int r, x, y, health, lives, radius;
  PImage wizard;

  //contructor
  Wizard() {
    r = 25;
    x = 0;
    y = 0;
    health = 1000;
    lives = 3;
    radius = 25;
    wizard = loadImage("wizard.png");
  }

  //member methods
  void display(int x, int y) {
    this.x = x;
    this.y = y;
    imageMode(CENTER);
    image(wizard, x, y);
  }

  boolean spiderShootIntersect(SpiderShoot spiderShoot) {
    float distance = dist(x, y, spiderShoot.x, spiderShoot.y);
    if (distance < radius + spiderShoot.r) {
      return true;
    } else {
      return false;
    }
  }

  boolean goblinSpearIntersect(GoblinSpear goblinSpear) {
    // Calculate distance
    float distance = dist(x, y, goblinSpear.x, goblinSpear.y); 

    // Compare distance to radius
    if (distance < r + goblinSpear.r) { 
      return true;
    } else {
      return false;
    }
  }

  boolean elfArrowIntersect(ElfArrow elfArrow) {
    // Calculate distance
    float distance = dist(x, y, elfArrow.x, elfArrow.y); 

    // Compare distance to radius
    if (distance < r + elfArrow.r) { 
      return true;
    } else {
      return false;
    }
  }

  boolean dragonFireIntersect(DragonFire dragonFire) {
    // Calculate distance
    float distance = dist(x, y, dragonFire.x, dragonFire.y); 

    // Compare distance to radius
    if (distance < r + dragonFire.r) { 
      return true;
    } else {
      return false;
    }
  }

  boolean puIntersect(PowerUp pu) {
    // Calculate distance
    float distance = dist(x, y, pu.x, pu.y);
    if (distance < r + pu.radius) { 
      return true;
    } else {
      return false;
    }
  }

  boolean spiderIntersect(Spider spider) {
    // Calculate distance
    float distance = dist(x, y, spider.x, spider.y); 

    // Compare distance to radius
    if (distance < r + spider.r) { 
      return true;
    } else {
      return false;
    }
  }

  boolean goblinIntersect(Goblin goblin) {
    // Calculate distance
    float distance = dist(x, y, goblin.x, goblin.y); 

    // Compare distance to radius
    if (distance < r + goblin.r) { 
      return true;
    } else {
      return false;
    }
  }

  boolean elfIntersect(Elf elf) {
    // Calculate distance
    float distance = dist(x, y, elf.x, elf.y); 

    // Compare distance to radius
    if (distance < r + elf.r) { 
      return true;
    } else {
      return false;
    }
  }

  boolean dragonIntersect(Dragon dragon) {
    // Calculate distance
    float distance = dist(x, y, dragon.x, dragon.y); 

    // Compare distance to radius
    if (distance < r + dragon.r) { 
      return true;
    } else {
      return false;
    }
  }
}
