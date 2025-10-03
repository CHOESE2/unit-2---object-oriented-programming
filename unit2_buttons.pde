

//base color
color highlight = #e2eafc;
color normal = #bcd4e6;

color pinkH = #fae0e4;
color pinkN = #f9bec7;


//stroke color
color highSTR = #FFFFFF;
color normSTR = ##133356;


boolean mouseReleased;
boolean wasPressed;
boolean clicked;

color c = #FFFFFF;
color idk = #f9bec7;

Rat remy, remyBrother;
buttons chee, tree, cheese;
int cheeCount = 2;

void setup() {
  size(800, 600);

  //x = 200;
  //y = 200;
  //w = 100;
  //h = 100;
  // chee = new buttons[cheeCount];
  //int i = 0;
  // while(i < cheeCount){
  //chee[0] = new buttons("chee", random(100, 400), random(200, 400), 100, 100, normal, highlight);
  //chee[1] = new buttons("chee", random(100, 400), random(200, 400), 100, 100, normal, highlight);
  //  i++;
  //}

  chee = new buttons("binted", 600, 200, 100, 100, #bcd4e6, highlight, #133356);
  tree = new buttons("bogos", 200, 200, 100, 100, #f9bec7, #fae0e4, #800f2f);

  //cheese = new buttons("rat", 200, 400, 100, 100, normal, highlight);
  //tree = new buttons();
  //startButton = new buttons("Start", 100);


  //gifs
  remy = new Rat("frame_", "_delay-0.01s.gif", 4, 300, 300 , 200, 200); //8 is the speed
  remyBrother = new Rat("frame_", "_delay-0.15s.gif", 6, 200, 100, 50, 50);
}


void draw() {

  click();

  background(c);
  chee.show();
  //chee.act();

  tree.show();
  //tree.act();

  if (chee.clicked) {
    c = #bcd4e6;
  }
  if (tree.clicked) {
    c = #f9bec7;
  }






  remy.show();
  remyBrother.show();


  // background(255);
  //int i = 0;
  //while(i < cheeCount){



  //cheese.show();
  //chee[1].show();
  //i++;
  //}


  //startButton.show();
  //  i++;
  // chee.act();
  //  }
}
