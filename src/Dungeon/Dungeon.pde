//CLASSES-ARRAYS\\

import processing.sound.*;
Wizard wiz;
SoundFile death;
Timer spiderTimer, goblinTimer, elfTimer, dragonTimer, puTimer;

ArrayList<WizardLaser> wizardLasers;
ArrayList<Spider> spiders;
ArrayList<SpiderShoot> spiderShoots;
ArrayList<Goblin> goblins;
ArrayList<GoblinSpear> goblinSpears;
ArrayList<Elf> elves;
ArrayList<ElfArrow> elfArrows;
ArrayList<Dragon> dragons;
ArrayList<DragonFire> dragonFires;
ArrayList<PowerUp> pUps;

//GAMEPLAY INTEGERS\\
int score, weaponCount, laserCount;
int gameScreen = 0;
PImage bg0, bg1, bg2, bg3, bg4, bg5;


//SETUP\\

void setup() {
  size(1500, 1000);
  wiz = new Wizard();
  death = new SoundFile(this, "death.wav");
  wizardLasers = new ArrayList();
  spiders = new ArrayList();
  spiderShoots = new ArrayList();
  goblins = new ArrayList();
  goblinSpears = new ArrayList();
  elves = new ArrayList();
  elfArrows = new ArrayList();
  dragons = new ArrayList();
  dragonFires = new ArrayList();
  pUps = new ArrayList();
  spiderTimer = new Timer(1000);
  spiderTimer.start();
  goblinTimer = new Timer(2000);
  goblinTimer.start();
  elfTimer = new Timer(3000);
  elfTimer.start();
  puTimer = new Timer(4000);
  puTimer.start();
  dragonTimer = new Timer(5000);
  dragonTimer.start();
  score = 0;
  weaponCount = 1;
  laserCount = 0;
  bg0 = loadImage("bg0.jpg");
  bg1 = loadImage("bg1.png");
  bg2 = loadImage("bg2.jpg");
  bg3 = loadImage("bg3.png");
  bg4 = loadImage("bg4.jpg");
  bg5 = loadImage("bg5.png");
}


//DRAW\\

void draw() {
  noCursor();
  // current screen \\
  if (gameScreen == 0) {
    startScreen();
  } else if (gameScreen == 1) {
    levelOne();
  } else if (gameScreen == 2) {
    levelTwo();
  } else if (gameScreen == 3) {
    levelThree();
  } else if (gameScreen == 4) {
    levelFour();
  } else if (gameScreen == 5) {
    gameOver();
  } else if (gameScreen == 6) {
    winScreen();
  }
}


//SCREENS\\

// start screen \\
void startScreen() {
  background(bg0);
  textAlign(CENTER);
  fill(52, 73, 94);
  textSize(100);
  text("Dungeon", width/2, height/2);
  textSize(50); 
  text("Click Anywhere to Start", width/2, height-250);
  textSize(25); 
  text("How To Play: Use Your Mouse To Move and Shoot", width/2, height-150);
  if (mousePressed) {
    gameScreen = 1;
  }
}

// level one screen \\
void levelOne() {
  background(bg1);
  powerUpRender();
  spiderRender();
  spiderShootRender();
  wiz.display(mouseX, mouseY);
  infoPanel();
  if (score >= 750) {
    gameScreen = 2;
  } 
  if (wiz.health <= 1) {
    gameScreen = 5;
  }
}

// level two screen \\
void levelTwo() {
  background(bg2);
  powerUpRender();
  wiz.display(mouseX, mouseY);
  goblinRender();
  goblinSpearRender();
  infoPanel();
  if (score >= 1500) {
    gameScreen = 3;
  } 
  if (wiz.health <= 1) {
    gameScreen = 5;
  }
}

// level three screen \\
void levelThree() {
  background(bg3);
  powerUpRender();
  wiz.display(mouseX, mouseY);
  goblinRender();
  goblinSpearRender();
  elfRender();
  elfArrowRender();
  infoPanel();
  if (score >= 2250) {
    gameScreen = 4;
  } 
  if (wiz.health <= 1) {
    gameScreen = 5;
  }
}

// level four screen \\
void levelFour() {
  background(bg4);
  powerUpRender();
  wiz.display(mouseX, mouseY);
  dragonRender();
  dragonFireRender();
  infoPanel();
  if (score >= 3000) {
    gameScreen = 6;
  } 
  if (wiz.health <= 1) {
    gameScreen = 5;
  }
}

// game over screen \\
void gameOver() {
  background(bg5);
  textAlign(CENTER);
  fill(236, 240, 241);
  textSize(100);
  text("GAME OVER!", width/2, height/2-150);
  textSize(50);
  text("Your Score", width/2, height/2-100);
  textSize(250);
  text(score, width/2, height/2+150);
  noLoop();
}

// win screen \\
void winScreen() {
  background(bg5);
  textAlign(CENTER);
  fill(236, 240, 241);
  textSize(100);
  text("YOU WIN!", width/2, height/2-150);
  textSize(50);
  text("Your Score", width/2, height/2-100);
  textSize(250);
  text(score+wiz.health, width/2, height/2+150);
  noLoop();
}


//RENDERING\\

// panel for game stats \\
void infoPanel() {
  fill(128, 128);
  rectMode(CORNER);
  rect(0, height-100, width, height-100);
  fill(255, 128);
  textSize(50);
  textAlign(LEFT);
  text("Health:" + wiz.health, 100, height-35);
  textAlign(RIGHT);
  text("Score:" + score, 1400, height-35);
}

// power up rendering \\
void powerUpRender() {
  if (puTimer.done()) {
    pUps.add(new PowerUp(int(random(width)), -20));
    puTimer.start();
  }

  for (int i = 0; i<pUps.size(); i++) {
    PowerUp pu = pUps.get(i);
    pu.move();
    pu.display();
    // power up and ship intersection \\
    if (wiz.puIntersect(pu)) {
      // apply power up \\
      if (pu.pu == 0) { // adds health \\
        wiz.health+=100;
      } else if (pu.pu == 1) { // adds lasers \\
        weaponCount++;
      } 
      pUps.remove(pu);
    }
  }
}

// spider rendering \\
void spiderRender() {
  if (spiderTimer.done()) {
    spiders.add(new Spider(int(random(width)), -25, 2000));
    spiderTimer.start();
  }
  for (int i = 0; i<spiders.size(); i++) {
    Spider spider = spiders.get(i);
    spider.move();
    spider.display();
    if (spider.done()) {
      spiderShoots.add(new SpiderShoot(spider.x-1, spider.y+900));
      spider.start();
    }
  }
  for (int i = 0; i < wizardLasers.size(); i++) {
    WizardLaser wizardLaser = wizardLasers.get(i);
    wizardLaser.display();
    wizardLaser.shoot();
    for (int j = 0; j<spiders.size(); j++) {
      Spider spider = spiders.get(j);
      if (spider.laserIntersection(wizardLaser)) {
        wizardLasers.remove(wizardLaser);
        spider.health -= wizardLaser.damage;
        if (spider.health < 1) {
          death.play();
          spiders.remove(spider);
          score += 50;
        }
      }
    }

    // despawn laser
    if (wizardLaser.reachedRight()) {
      wizardLasers.remove(wizardLaser);
    }
  }
}

// spider shoot rendering \\
void spiderShootRender() {
  for (int i = spiderShoots.size()-1; i>=0; i--) {
    SpiderShoot spiderShoot = (SpiderShoot) spiderShoots.get(i);
    spiderShoot.fire();
    spiderShoot.display();

    // spider shoot and wizard intersect \\
    if (wiz.spiderShootIntersect(spiderShoot)) {
      wiz.health-=spiderShoot.power;
      spiderShoots.remove(spiderShoot);
    }
    if (spiderShoot.reachedLeft()) {
      spiderShoots.remove(spiderShoot);
    }
  }
}

// goblin rendering \\
void goblinRender() {
  if (goblinTimer.done()) {
    goblins.add(new Goblin(int(random(width)), -25, 3000));
    goblinTimer.start();
  }
  for (int i = 0; i<goblins.size(); i++) {
    Goblin goblin = goblins.get(i);
    goblin.move();
    goblin.display();
    if (goblin.done()) {
      goblinSpears.add(new GoblinSpear(goblin.x-1, goblin.y+900));
      goblin.start();
    }
  }
  for (int i = 0; i < wizardLasers.size(); i++) {
    WizardLaser wizardLaser = wizardLasers.get(i);
    wizardLaser.display();
    wizardLaser.shoot();
    for (int j = 0; j<goblins.size(); j++) {
      Goblin goblin = goblins.get(j);
      if (goblin.laserIntersection(wizardLaser)) {
        wizardLasers.remove(wizardLaser);
        goblin.health -= wizardLaser.damage;
        if (goblin.health < 1) {
          death.play();
          goblins.remove(goblin);
          score += 100;
        }
      }
    }

    // despawn laser
    if (wizardLaser.reachedRight()) {
      wizardLasers.remove(wizardLaser);
    }
  }
}

// globin spear rendering \\
void goblinSpearRender() {
  for (int i = goblinSpears.size()-1; i>=0; i--) {
    GoblinSpear goblinSpear = (GoblinSpear) goblinSpears.get(i);
    goblinSpear.fire();
    goblinSpear.display();

    // goblin spear and wizard intersect \\
    if (wiz.goblinSpearIntersect(goblinSpear)) {
      wiz.health-=goblinSpear.power;
      goblinSpears.remove(goblinSpear);
    }
    if (goblinSpear.reachedLeft()) {
      goblinSpears.remove(goblinSpear);
    }
  }
}

// elf rendering \\
void elfRender() {
  if (elfTimer.done()) {
    elves.add(new Elf(int(random(width)), -25, 4000));
    elfTimer.start();
  }
  for (int i = 0; i<elves.size(); i++) {
    Elf elf = elves.get(i);
    elf.move();
    elf.display();
    if (elf.done()) {
      elfArrows.add(new ElfArrow(elf.x-1, elf.y+900));
      elf.start();
    }
  }
  for (int i = 0; i < wizardLasers.size(); i++) {
    WizardLaser wizardLaser = wizardLasers.get(i);
    wizardLaser.display();
    wizardLaser.shoot();
    for (int j = 0; j<elves.size(); j++) {
      Elf elf = elves.get(j);
      if (elf.laserIntersection(wizardLaser)) {
        wizardLasers.remove(wizardLaser);
        elf.health -= wizardLaser.damage;
        if (elf.health < 1) {
          death.play();
          elves.remove(elf);
          score += 150;
        }
      }
    }

    // despawn laser
    if (wizardLaser.reachedRight()) {
      wizardLasers.remove(wizardLaser);
    }
  }
}

// elf arrow rendering \\
void elfArrowRender() {
  for (int i = elfArrows.size()-1; i>=0; i--) {
    ElfArrow elfArrow = (ElfArrow) elfArrows.get(i);
    elfArrow.fire();
    elfArrow.display();

    // elf arrow and wizard intersect \\
    if (wiz.elfArrowIntersect(elfArrow)) {
      wiz.health-=elfArrow.power;
      elfArrows.remove(elfArrow);
    }
    if (elfArrow.reachedLeft()) {
      elfArrows.remove(elfArrow);
    }
  }
}

// dragon rendering \\
void dragonRender() {
  if (dragonTimer.done()) {
    dragons.add(new Dragon(int(random(width)), -25, 5000));
    dragonTimer.start();
  }
  for (int i = 0; i<dragons.size(); i++) {
    Dragon dragon = dragons.get(i);
    dragon.move();
    dragon.display();
    if (dragon.done()) {
      dragonFires.add(new DragonFire(dragon.x-1, dragon.y+900));
      dragon.start();
    }
  }
  for (int i = 0; i < wizardLasers.size(); i++) {
    WizardLaser wizardLaser = wizardLasers.get(i);
    wizardLaser.display();
    wizardLaser.shoot();
    for (int j = 0; j<dragons.size(); j++) {
      Dragon dragon = dragons.get(j);
      if (dragon.laserIntersection(wizardLaser)) {
        wizardLasers.remove(wizardLaser);
        dragon.health -= wizardLaser.damage;
        if (dragon.health < 1) {
          death.play();
          dragons.remove(dragon);
          score += 200;
        }
      }
    }

    // despawn laser
    if (wizardLaser.reachedRight()) {
      wizardLasers.remove(wizardLaser);
    }
  }
}

// dragon fire rendering \\
void dragonFireRender() {
  for (int i = dragonFires.size()-1; i>=0; i--) {
    DragonFire dragonFire = (DragonFire) dragonFires.get(i);
    dragonFire.fire();
    dragonFire.display();

    // dragon fire and wizard intersect \\
    if (wiz.dragonFireIntersect(dragonFire)) {
      wiz.health-=dragonFire.power;
      dragonFires.remove(dragonFire);
    }
    if (dragonFire.reachedLeft()) {
      dragonFires.remove(dragonFire);
    }
  }
}

void mousePressed() {
  if (weaponCount == 1) {
    wizardLasers.add(new WizardLaser(wiz.x, wiz.y));
    laserCount++;
  } else if (weaponCount == 2) {
    wizardLasers.add(new WizardLaser(wiz.x, wiz.y));
    wizardLasers.add(new WizardLaser(wiz.x-40, wiz.y-35));
  }
}
