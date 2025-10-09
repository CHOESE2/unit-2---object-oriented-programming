class Spaceship extends GameObject {

  //instance variables
  //because variables are extended from gameObjects
  PVector dir; //direction


  //amount of lives

  //contructor name is always the same as the class
  Spaceship() {
    super(width/2, height/2, 0, 0);
    dir = new PVector(1, 0);
  }

  //behaviour functions
  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    
    rotate(dir.heading());
    drawShip();

    popMatrix();
  }

  void drawShip() {
    
  //SPACESHIP
  
  stroke(b);
  strokeWeight(1);
  fill(darkBlue);
  
   //SHOOTERS
  rect(25, -2, 60, 3);
  rect(22,  2, 40, 3);
  
  //BASE
  fill(#dfe7fd);
  triangle(-5, -25, -5, 25, 20, 0 ); //triangle base
  triangle(-5, -25, -25, -25, -5, -10 ); //top arm
  triangle(-5, 25, -25, 25, -5, 10 ); //bottom arm
  line(-12, -25, -12, 25);
  
    fill(darkBlue);
  //BODY 

  fill(#a3c4f3);
  rect(20, 0, 20, 12);
   fill(darkBlue);
  rect(4, 0, 10, 30);
  line(0, -10, 10, 10); //DECOR
  line(14, -10, 25, 0); //top line head
  line(14,  10, 25, 0); //bottom line head
  circle(15, 0, 5); //circle probably the middle.
  
  //DETAILS
  rect(-12, 5, 12, 3); //back engine 
  rect(32, -30, 7, 7); //little square friend 
    
  }


  void act() {
    shoot();
    move();
    check(); //check for collisions
  }


  void move() {
    loc.add(vel);
    if (upkey) vel.add(dir);
    if (downkey) vel.add(dir);

    if (vel.mag() > 12) vel.setMag(12);
    vel.setMag( vel.mag() * 0.95 );



    if (leftkey) dir.rotate(-radians(3));
    if (rightkey) dir.rotate(radians(3));


    //boundary
    if (loc.y <= -22 && loc.y < 600) loc.y = 610;
    if (loc.x <= -22 && loc.x < 800) loc.x = 810;

    if (loc.y >= 620 && loc.y > -20) loc.y = -22;
    if (loc.x >= 820 && loc.x > -20) loc.x = -22;
  }




  void shoot() {
    if (spacekey) objects.add(new Bullet() ); //add new bullet in objects 
  }

  void check() {
  }
}
