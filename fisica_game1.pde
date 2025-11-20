
import fisica.*;

//palette
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);

//assets
int i = 0;

float fx, fy;
float cx, cy;

PImage peanut;


//boolean gravity
boolean gOFF = false;
boolean pOFF = false; // f bodies
boolean kOFF = false;

boolean collision = false;

//boolean keys
boolean aKey, sKey, dKey, wKey;
boolean leftKey, rightKey, downKey, upKey;



//stuff



FPoly topPlatform;
FBox greenBox;
FBox blueBox;
FBox redBox;
FPoly bottomPlatform;

FPoly bridge1;

FPoly topPlatform2;

//fisica
FWorld world;

void setup() {
  //make window
  size(1000, 600);

  //load resources

//  peanut = loadImage("peanut copy.JPG");
//  peanut.resize(40, 40);

  //object variables
  fx = 25;
  fy = 25;

  cx = 25;
  cy = 25;

  //set.GrabBubble()


  //initialise world
  makeWorld();

  //add terrain to world
  makeTopPlatform();
  makeBottomPlatform();
  makeTopPlatform2();
  makeBridge1();
}

//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
}

//===========================================================================================
void makeBridge1(){
 bridge1 = new FPoly();
 
 
 //plot the vertices of this platform
  bridge1.vertex(100, 300);
  bridge1.vertex(100, 320);
  bridge1.vertex(230, 320);
  bridge1.vertex(230, 300);

  
  
    // define properties
  bridge1.setPosition(160, 60);
  bridge1.setStatic(true);
  bridge1.setStroke(255);
  bridge1.setFillColor(255);
  bridge1.setFriction(0.1);

  //put it in the world
  world.add(bridge1);
}




void makeTopPlatform() {
  topPlatform = new FPoly();

  // plot the vertices of this platform
  // order matters
 

  topPlatform.vertex(100, 60);
  topPlatform.vertex(70, 60);
  topPlatform.vertex(70, 200);
  topPlatform.vertex(200, 200);


  //topPlatform.vertex(200, 60);
  //topPlatform.vertex(200, 60);
  //topPlatform.vertex(170, 60);
  //topPlatform.vertex(170, 170);
  //topPlatform.vertex(100, 170);







  // define properties
  topPlatform.setPosition(-70, 380);
  topPlatform.setStatic(true);
  topPlatform.setStroke(255);
  topPlatform.setFillColor(255);
  topPlatform.setFriction(0.1);

  //put it in the world
  world.add(topPlatform);
}

void makeTopPlatform2() {
  topPlatform2 = new FPoly();




  //topPlatform2.vertex(100, 60);
  //topPlatform2.vertex(70, 60);
  //topPlatform2.vertex(70, 200);
  //topPlatform2.vertex(200, 200);

  topPlatform2.vertex(60, 100);
  topPlatform2.vertex(60, 70);
  topPlatform2.vertex(200, 70);
  topPlatform2.vertex(200, 200);


  //bucket

  //topPlatform.vertex(200, 60);
  //topPlatform.vertex(200, 60);
  //topPlatform.vertex(170, 60);
  //topPlatform.vertex(170, 170);
  //topPlatform.vertex(100, 170);







  // define properties
  topPlatform2.setPosition(800, -80);
  topPlatform2.setStatic(true);
  topPlatform2.setStroke(255);
  topPlatform2.setFillColor(255);
  topPlatform2.setFriction(0.1);

  //put it in the world
  world.add(topPlatform2);
}

//===========================================================================================

void makeBottomPlatform() {
  bottomPlatform = new FPoly();

  //plot the vertices of this platform
  bottomPlatform.vertex(100, 300);
  bottomPlatform.vertex(10000, 300);
  bottomPlatform.vertex(10000, 400);
  bottomPlatform.vertex(100, 400);






  //// define properties
  bottomPlatform.setPosition(-150, 280);
  bottomPlatform.setStatic(true);
  bottomPlatform.setFillColor(red);
  bottomPlatform.setFriction(0);

  //put it in the world
  world.add(bottomPlatform);
}




//===========================================================================================

void draw() {
  println("x: " + mouseX + " y: " + mouseY);
  background(0);

  //gravity / f bodies
  fill(255);
  tact(80, 20, 50, 10);
  rect(80, 20, 50, 10);

  fill(255);
  tactile(20, 20, 50, 10);
  rect(20, 20, 50, 10);

  // -----------------------
  
if(dKey){
    fx += 4;
  }


  if (i < 1 && !kOFF) {  //Every 20 frames ...
    makeBox();
    makeBoxx();
    i++;
  }

  if (topPlatform2.isTouchingBody(greenBox)) {
    background(255);
    world.remove(greenBox);
  }
  
  if(topPlatform.isTouchingBody(blueBox)){
   background(255);
   world.remove(blueBox);
  }
  
  
  










  world.step();  //get box2D to calculate all the forces and new positions
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw
}


//===========================================================================================
void tactile (int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    strokeWeight(3);
    stroke(255);
    gOFF = true;
  } else {
    stroke(#34a0a4);
    gOFF = false;
  }
}


void tact(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    strokeWeight(3);
    stroke(255);
    pOFF = true;
  } else {
    stroke(0);
    pOFF = false;
  }
}

boolean mousePressed = false;
boolean mp = false;
void mousePressed() {
  if (gOFF && !mousePressed) {
    world.setGravity(0, 0);
    mousePressed = true;
  } else if (gOFF && mousePressed) {
    world.setGravity(0, 900);
    mousePressed = false;
  }

  if (pOFF && !mousePressed) {
    kOFF = true;
    i = 0;
    mousePressed = true;
  } else if (pOFF && mousePressed) {
    mousePressed = false;
    //i = 0;
    kOFF = false;
  }
}




//===========================================================================================

void makeBox() {
  greenBox = new FBox(25, 25);
  greenBox.setPosition(fx, 100);

  //set visuals

  //peanuts size

  //box.attachImage(peanut);


  greenBox.setStroke(0);
  greenBox.setStrokeWeight(2);
  greenBox.setFillColor(green );

  //set physical properties
  greenBox.setDensity(0.2);
  greenBox.setFriction(1);
  greenBox.setRestitution(0.25);
  world.add(greenBox);
}



//===========================================================================================

void makeBoxx() {
  blueBox = new FBox(25, 25);
  blueBox.setPosition(cx, cy);

  //set visuals

  //peanuts size

  //box.attachImage(peanut);


  blueBox.setStroke(0);
  blueBox.setStrokeWeight(2);
  blueBox.setFillColor(blue);

  //set physical properties
  blueBox.setDensity(0.2);
  blueBox.setFriction(1);
  blueBox.setRestitution(0.25);
  world.add(blueBox);
}






//===========================================================================================
