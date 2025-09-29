
//change stroke color
class buttons {

  //variables
  float x, y, w, h;
  boolean colorOn = false;
  boolean lineOn = false;
  String text;

  color highlight = #e2eafc;
  color normal = #bcd4e6;

  color pinkH = #fae0e4;
  color pinkN = #f9bec7;

  color c = #FFFFFF;

  //stroke color
  color highSTR = #FFFFFF;
  color normSTR = #133356;


  //stroke color pink
  color pinkSTR = #800f2f;
  color stroke;

 boolean wasPressed;
  boolean clicked;


  //mouse stuff clicked or not clicked




  buttons(String t, float _x, float _y, int _w, int _h, color norm, color high, color _stroke) { //setup
    // take an input
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    text = t;
    stroke = _stroke;

    normal = norm;
    highlight = high;
  }


  void show() {


    textAlign(CENTER, CENTER);
    rectMode(CENTER);

    if (!colorOn) {
      //fill(R, G, B);
      //stroke(Z, X, L);
      fill(normal);
      strokeWeight(3);
      stroke(stroke);
      rect(x, y, w, h);
    } else {
      //fill(A, K, C);
      //stroke(Q, W, E);
      //fill(#e2eafc);
      fill(highlight);
      strokeWeight(3);
      stroke(255);
      rect(x, y, w, h);
      //rect(x, y, w , h);
    }



    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      fill(255);

      colorOn = true;
    } else {
      fill(0);
      colorOn = false;
    }

    textSize(w/4);
    text(text, x, y);
    println(mouseReleased && mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2);

    if (mouseReleased && mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      clicked = true;
    } else {
      clicked = false;
    }





    //if(mousePressed && highlight == #fae0e4){
    // background(0);
    //}
  }



  void act() {
    //nothing here currently
  }
}
