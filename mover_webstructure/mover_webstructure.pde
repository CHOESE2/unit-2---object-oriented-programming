ArrayList <Mover> cow;
int cowCount = 10;

int x, y;

void setup() {
  size(800, 600);
  cow = new ArrayList();
  
  //
  int i = 0;
  while(i < cowCount){
    cow.add(new Mover() );
    i++;
  }
}


  
//int i = 0;
//while(i < cow.size()){
//  cow.add(new Mover());
//  i++;
//}
//}



void draw() {
  background(0, 0, 255);

int i = 0;
while (i < cow.size()){
  //cow[i].show(); //each one of my movers will have show and act 
  Mover c = cow.get(i);
  
  c.act(); // for every page, like 0, it will have the same i value as cow[i].act / show so these will apply to the page. 
  c.showBody();
  c.connections();
  
  if(c.alive == false){
    cow.remove(i);
  } else {
  i++;
  }
  
}
}


void mouseReleased() {
//  cow.add(new Mover(mouseX, mouseY) );
}
