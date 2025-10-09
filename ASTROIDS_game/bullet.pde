class Bullet extends GameObject{


  Bullet() {
    super(remy.loc.copy(), remy.dir.copy());
    vel.setMag(10);
  }
  
  void show() {
    //could make a bullet function like cheese bits 
    fill(255);
    stroke(0);
    strokeWeight(2);
    circle(loc.x, loc.y, 5);
  }
    
    
    void act() {
      loc.add(vel);
      
    }
}
