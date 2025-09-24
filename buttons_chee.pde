
//change stroke color 
class buttons {

  buttons() { //setup
    x = 200;
    y = 200;
    w = 100;
    h = 100;
  }

  void show() {
    textAlign(CENTER, CENTER);
    rectMode(CENTER);

    if (!colorOn) {
      fill(#b5e48c);
      strokeWeight(1);
      stroke(#184e77);
      rect(x, y, w, h);
    } else {
      fill(#34a0a4);
      strokeWeight(1);
      stroke(#f72585);
       rect(x, y, w, h);
       
    }


    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      fill(255);
     
      colorOn = true;
    } else {
      fill(0);
      colorOn = false;
    }
    
    textSize(w/4);
    text("chee", x, y);

  
  


    //if(mouseReleased && mouseX > x-w/2 && mouseX < x+w/2 && mouseY
  }



  void act() {
    //nothing here currently
  }
}
