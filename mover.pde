

class Mover { //don't need ()

  //instance variables
  float x, y;
  float R, G, B;
  float size;

  //constructor // kinda let setup for particular object
  Mover() {
    x = width/2; //innitializes the variables
    y = height/2;
    R = random(0, 255);
    B = random(0, 255);
    G = random(0, 255);
    
    size = random(0, 20);

    // fill(random(0, 255), random(0, 255), random(0, 255));
  }

  //behavior functions
  void show() { //just to show on the screen like the object and fill color
    stroke(0);
    strokeWeight(1);

    fill(R, G, B); // random colors but keeping their colors
    //fill(random(0, 255), random(0, 255), random(0, 255));
   //circle(x, y, size); //retains their size
   circle(x, y, random(0, 20));
  }

  void act() { //actions
    x += random(-5, 5);
    y += random(-5, 5); //jitters by moving to the left and right/ up down randomely
  }
}
