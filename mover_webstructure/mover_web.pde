
class Mover { //don't need ()



  //instance variables
  PVector loc; //x and y in one place
  PVector vel;
  float d;
  
  boolean alive;


  //constructor // kinda let setup for particular object
  Mover() {
   d = 100;
   loc = new PVector (random(0, width), random(0, height));
   vel = new PVector (3, 0);
  // vel.setMag(random(1,5));
   vel.rotate(radians( random(0, 360) ));
   alive = true;
  }
  
   Mover(float x, float y) {
   d = 100;
   loc = new PVector (x, y);
   vel = new PVector (3, 0);
   // vel.setMag(random(1,5));
   vel.rotate(radians( random(0, 360) ));
   alive = true;
  }
  
  

  ////behavior functions

  void act() { //actions
  move();
  edge();
  checkForDeletion();
  }
  
  void checkForDeletion() {
    if (dist(loc.x, loc.y, mouseX, mouseY) < d/2 && mousePressed) {
      alive = false;
    }
    
  }
  
  void move(){
  loc.add(vel); //add veloctiy to location 
}

void edge(){
  if (loc.x < 0 || loc.x > width) vel.x = - vel.x;
  if (loc.y < 0 || loc.y > height) vel.y = -vel.y;
}


void showBody(){
  
stroke(255, random(0, 133));
  fill(255, random(0, 133));
  circle(loc.x, loc.y, 80);
}


void connections(){  
  int i = 0;
  

while( i < cow.size()){
   Mover other = cow.get(i);
   
  float dist = dist(loc.x, loc.y, other.loc.x, other.loc.y);
  if(dist <= 200 ){
    float a = map(dist, 0, 200, 255, 0);
    stroke(255, a);
    strokeWeight(2);
    line(loc.x, loc.y, other.loc.x, other.loc.y);
  }
  i++;
}
}






}
  


  
  
  
  
  
  
  
  
  
  
  
