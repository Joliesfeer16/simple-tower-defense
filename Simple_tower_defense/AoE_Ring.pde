class AoeRing extends Bullet {
  
  AoeRing(float _x, float _y) {
    super(_x, _y, 0, 0);//has same as bullet
    d= 200; //different then regular bullet
  }

  void show() {
    circle(x, y, d);
  }
  
  //will have same act as Bullet, but diff show
}
