//Tower Defense Game
//YOUR NAME GOES HERE
//Programming 12

// ================ GLOBAL VARIABLES =================

final int INTRO    = 0;
final int PLAY     = 1;
final int BUILD    = 2;
final int GAMEOVER = 3;
int mode;

//Buttons
Button start;

//node array
Node[] nodes;
int n= 8;

//mob (declare mobs)
Mob mobby; //TYPE 1 single object array

ArrayList<Mob> mobs; //TYPE 2 arraylist

ArrayList <Tower> towers;
ArrayList <Bullet> bullets;

Gif IntroAnimation;

// ===================== SETUP =========================

void setup() {
  textAlign(CENTER, CENTER);
  size(1000, 800);
  initializeVariables();
  makeButtons();
}

void initializeVariables() {
  //nodes ARRAY
  nodes = new Node[n];
  nodes[0]= new Node(150, width/2, 0, -s, pink );
  nodes[1]= new Node(150, 200, s, 0, pink);
  nodes[2]= new Node(350, 200, 0, s, pink);
  nodes[3]= new Node(350, 400, s, 0, pink);
  nodes[4]= new Node(650, 400, 0, -s, pink);
  nodes[5]= new Node(650, 100, -s, 0, pink);
  nodes[6]= new Node( 500, 100, 0, s, pink);
  nodes[7]= new Node(500, 650, s, 0, pink);

  //instantiate mobs
  //TYPE 1 Mob for single object array
  mobby = new Mob(0, 400, 1, 0);

  //Arraylist
  //TYPE 2 Mob for arraylist
  mobs = new ArrayList <Mob>(); //does not have a given size
}

void makeButtons() {
  //start button
  start = new Button("START", width/2, 3*height/4, 200, 100, white, black);
}

// ===================== DRAW ===========================

void draw() {
  click();
  if (mode == INTRO) {
    intro();
  } else if (mode == PLAY) {
    play();
  } else if (mode == BUILD) {
    build();
  } else if (mode == GAMEOVER) {
    gameOver();
  }
}
