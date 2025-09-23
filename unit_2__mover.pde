
Mover[] cow;
int cowCount = 10;

int x, y;

void setup() {
  size(800, 600);
  cow = new Mover[cowCount];
int i = 0;
while(i < cowCount){
  cow[i] = new Mover();
  i++;
}


  x = width/2;
  y = height/2;
}


void draw() {
  //background(0, 0, 255);

int i = 0;
while (i < cowCount){
  cow[i].show(); //each one of my movers will have show and act 
  cow[i].act(); // for every page, like 0, it will have the same i value as cow[i].act / show so these will apply to the page. 
  i++;
}
}
