class Mob {
  //instance
  float x, y, vx, vy, d;
  int hp; //hit points
  color fillColor;
  float speed;

  //construction
  Mob(float _x, float _y, float _vx, float _vy) {
    x= _x;
    y= _y;
    vx= _vx;
    vy= _vy;
    d=35;
    hp=1;
    speed= 2;
  }

  //behavior function
  void show() {
    circle(x, y, d);
  }

  void act() {
    x= x+vx*speed;
    y= y+vy*speed;

    //node collision
    int i=0;
    while (i < nodes.length) {
      if ( dist(nodes[i].x, nodes[i].y, x, y)< 4) {
        vx= nodes[i].dx;
        vy= nodes[i].dy;
      }
      i++;
    }

    //bullet collision
    while (i<bullets.size()) {
      Bullet myBullet = bullets.get(i);
      if (dist(myBullet.x, myBullet.y, x, y)<d/2 + myBullet.d/2) {
        hp--; //when bullet hits mob, hp goes down by 1
        if (hp==0) {
        }
      }
      i++;
    }
  }
}
