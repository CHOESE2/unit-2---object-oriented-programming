import fisica.*;

//palette
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);

//assets
PImage redBird;


//cloud assets
float cx, cy;

FPoly topPlatform; 
FPoly bottomPlatform;

//fisica
FWorld world;

void setup() {
  //make window
  size(800, 600);
  
  //load resources
  redBird = loadImage("red-bird.png");

  //initialise world
  makeWorld();

  //add terrain to world
  makeTopPlatform();
  makeBottomPlatform();
  
  //clouds
  cx = 300;
  cy = random(400, 0);
}

//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
}

//===========================================================================================

void makeTopPlatform() {
  topPlatform = new FPoly();

  //plot the vertices of this platform
  //order matters
  
  //bucket
  topPlatform.vertex(100, 60);
  topPlatform.vertex(70, 60);
  topPlatform.vertex(70, 200);
  topPlatform.vertex(200, 200);
  topPlatform.vertex(200, 60);
  topPlatform.vertex(200, 60);
  topPlatform.vertex(170, 60);
  topPlatform.vertex(170, 170);
  topPlatform.vertex(100, 170);

  
  

  
  
 
  
  

  // define properties
  topPlatform.setStatic(true);
  topPlatform.setFillColor(brown);
  topPlatform.setFriction(0.1);

  //put it in the world
  world.add(topPlatform);
  
  
  
}

//===========================================================================================

void makeBottomPlatform() {
  bottomPlatform = new FPoly();

  //plot the vertices of this platform
  bottomPlatform.vertex(900, 360);
  bottomPlatform.vertex(300, 480);
  bottomPlatform.vertex(300, 580);
  bottomPlatform.vertex(900, 460);

  // define properties
  bottomPlatform.setStatic(true);
  bottomPlatform.setFillColor(brown);
  bottomPlatform.setFriction(0);

  //put it in the world
  world.add(bottomPlatform);
}


//===========================================================================================

void draw() {
  println("x: " + mouseX + " y: " + mouseY);
  background(blue);

  if (frameCount % 50 == 0) {  //Every 20 frames ...
    makeCircle();
    makeBlob();
    makeBox();
    makeBird();
    makeCloud(cx, cy);
  }
  world.step();  //get box2D to calculate all the forces and new positions
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw
}


//===========================================================================================
void makeCloud(float x, float y){
pushMatrix();
  translate(x, y);
  stroke(0);
  strokeWeight(2);
  fill(255);
  circle(cx, cy, 100);

  
  
  
  
  popMatrix();
}

//===========================================================================================
void makeCircle() {
  FCircle circle = new FCircle(50);
  circle.setPosition(random(100,width-100), -5);

  //set visuals
  circle.setStroke(0);
  circle.setStrokeWeight(2);
  circle.setFillColor(red);

  //set physical properties
  circle.setDensity(0.2);
  circle.setFriction(1);
  circle.setRestitution(1);

  //add to world
  world.add(circle);
}

//===========================================================================================

void makeBlob() {
  FBlob blob = new FBlob();

  //set visuals
  blob.setAsCircle(random(100,width-100), -5, 50);
  blob.setStroke(0);
  blob.setStrokeWeight(2);
  blob.setFillColor(yellow);

  //set physical properties
  blob.setDensity(0.2);
  blob.setFriction(1);
  blob.setRestitution(0.25);

  //add to the world
  world.add(blob);
}

//===========================================================================================

void makeBox() {
  FBox box = new FBox(25, 100);
  box.setPosition(random(100,width-100), -5);

  //set visuals
  box.setStroke(0);
  box.setStrokeWeight(2);
  box.setFillColor(green);

  //set physical properties
  box.setDensity(0.2);
  box.setFriction(1);
  box.setRestitution(0.25);
  world.add(box);
}

//===========================================================================================

void makeBird() {
  FCircle bird = new FCircle(48);
  bird.setPosition(random(100,width-100), -5);

  //set visuals
  bird.attachImage(redBird);

  //set physical properties
  bird.setDensity(0.8);
  bird.setFriction(1);
  bird.setRestitution(0.5);
  world.add(bird);
}
