//Emily Xiao
//Oct 6th

import java.util.ArrayList;

//COLOR PALLETTE
color white = #FFFFFF;
color b = #edf2fb;
color darkBlue = #abc4ff;

//MODE FRAMEWORK
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int DEFEAT= 3;
int mode = INTRO;

//CONTROLS
boolean upkey, downkey, leftkey, rightkey;
boolean spacekey;

//OBJECTS - must instantiate 
PVector loc; //combines both x and y
PVector vel; //veloctiy 
PVector gravity; 
float d;

//GAME ASSETS / OBJECTS
Spaceship remy;

//List of Bullets
ArrayList <GameObject> objects; //our spaceships, bullets etc



void setup(){
  size(800, 600);
  mode = INTRO;
  textAlign(CENTER);
  rectMode(CENTER);
  objects = new ArrayList();
  remy = new Spaceship();
  objects.add(remy); // first object in the game engine
  
  loc = new PVector (width/2, height/2);
  d = 100;
  vel = new PVector (5, 0); //speed is constant, but the direction is different 
  vel.rotate(random(0, 2*PI)); //this direction is different from the speed
  gravity = new PVector(0, 1);
}



void draw(){
  if (mode == INTRO) intro ();
  else if (mode == GAME) game();
  else if (mode == PAUSE) pause();
  else if (mode == DEFEAT) defeat();
  
  
  
  
}
