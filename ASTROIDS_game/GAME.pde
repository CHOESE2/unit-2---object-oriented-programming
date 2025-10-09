

void game() {
  background(#000814);


  //circle(loc.x, loc.y, d);
  //loc.add(vel); //change in location = accelleration
  //vel.add(gravity); //change in accelleration = gravity



  //if (loc.y < 100 || loc.y > height-100) vel.y = 300;
  //if (loc.x < 100 || loc.x > width-100) vel.x = 300;

  int i = 0;
  while (i < objects.size()) {
    GameObject currentObject = objects.get(i);
    currentObject.show();
    currentObject.act();
    i++;
  } //whatever the object, it will act and show
}


void gameClicks() {
  vel.setMag(vel.mag() + 1);
  println(vel.heading());
}
