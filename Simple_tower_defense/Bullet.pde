class Bullet {
  //instance
  float x, y, vx, vy, d;
 
  //constructor
  Bullet (float _x, float _y, float _vx, float _vy) {
    x= _x;
    y= _y;
    vx= _vx;
    vy= _vy;
    d= 15;
  }

  void act() {
    x= x+vx;
    y= y+vy;
  }

  void show() {
    circle(x,y,d);
  }
}
