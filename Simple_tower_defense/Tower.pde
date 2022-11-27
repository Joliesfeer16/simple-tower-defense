class Tower {

  final int PLACING =0; //we are in the proccess of picking a location, so tower follows mouse
  final int PLACED= 1; //we have locked in  position, shouldnt move anymore

  //instance
  float x, y;
  int cooldown;//like timer that counts up to treshold, smaller treshold= faster shoot
  int treshold;
  int towerMode;
  int towerType;
  
  //constructor
  Tower(int type) {
    x= mouseX;
    y= mouseY;
    cooldown = 0;
    towerMode = PLACING;//when we make a tower, its position must  be placed
    towerType = type;
    if (towerType == GUN) treshold = 30;
    if (towerType == AOE) treshold = 30;
  }


  //behavior function
  void show() {
    if (towerType == GUN) showGunTower();
    if (towerType == AOE) showAOETower();
  }

  void showGunTower() {
    stroke(black);
    strokeWeight(4);
    fill(green);
    square(x, y, 100);
  }

  void showAOETower() {
    stroke(black);
    strokeWeight(4);
    fill(red);
    circle(x, y, 100);
  }

  void act() {
    cooldown= cooldown+1;
    if (cooldown >= treshold) {
      cooldown=0;
      if (towerType == GUN) {
        bullets.add(new Bullet(x, y, 0, -10));//up (NOTE: it will go to the tower's x and y, since it is in bullet class)
        bullets.add(new Bullet(x, y, 0, 10)); //down
        bullets.add(new Bullet(x, y, -10, 0)); //left
        bullets.add(new Bullet(x, y, 10, 0)); //right
      }
      if (towerType == AOE) {
        bullets.add( new AoeRing(x, y)); //under same arraylist
      }
    }
  }
}
