void play() {
  background (0);

  //draw nodes loop
  line(150, 200, 350, 200);
  line(350, 200, 350, 400);

  int j=0;
  while (j<8) {
    nodes[j].show();
    j++;
  }

  //wave button
  text("Next Wave: " + nextwave, 890, 70);
  rectMode(CENTER);
  wave.show();

  //TYPE 1 mob code for single object array
  mobby.show();
  mobby.act();

  //TYPE 2 while loop for arraylist
  int i=0; //since you cant give arraylist a given number
  while (i < mobs.size()) { //will tell how many mobs are left
    Mob myMob = mobs.get(i); //make a variable, will get a mob
    myMob.act();
    myMob.show();
    if (myMob.hp <= 0) { //will remove mob if it is hit by bullet, when hhit
      mobs.remove(i);
    } else {
      i++;
    }
  }

  //draw towers (act + show)
  int f=0;
  while (f< towers.size()) {
    Tower myTower = towers.get(f);
    myTower.show();
    if (mobs.size()>0) {
      myTower.act();
    }
    f++;
  }

  //bullet draw (act + show)
  int h=0;
  while (h< bullets.size()) {
    Bullet myBullet = bullets.get(h);
    myBullet.show();
    myBullet.act();
    if (myBullet.hp <= 0) {
      bullets.remove(h);
    } else {
      h++;
    }
  }

  //show a mob everytime you click the button
  if (wave.clicked && mobs.size()==0 ) {
    int i=0;
    int x= 0;
    while (i< nextwave) {
      mobs.add (new Mob(x, 400, 1, 0));
      mobs.add (new ChonkyMob(x, 400, 1, 0));
      x= x-50;
      i++;
    }
  }

  void build() {
    //add tower, gun type
    if (gun.clicked) {
      towers.add (new Tower(GUN)); //it will follow the mouse so x and y doesnt matter
      towers.add (new Tower(AOE));
    }
  }
