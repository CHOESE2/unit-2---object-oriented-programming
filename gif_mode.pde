class Rat {
  int i;
  int ratCount;
  float ratx, raty, ratw, rath;
  PImage[] rat;

  int Speed;


  String before, after;

  Rat (String _before, String _after, int ratCount, int _rx, int _ry, int _rw, int _rh ) {         //setup constructor
    ratx = _rx;
    raty = _ry;
    ratw = _rw;
    rath = _rh;

    // Speed = _speed;
    before = _before;
    after = _after;


    //reference
    // ("frame_", "_delay-0.01s", 4, 8, int x, int y , width, height );



    int i = 0;
    this.ratCount = ratCount;
    rat = new PImage[ratCount];

    while (i < ratCount) {
      rat[i] = loadImage(before + i + after);
      i++;
    }
  }

  void show() {

    if (i >= ratCount) i = 0;
    image(rat[i], ratx, raty, ratw, rath);
    if (frameCount % 5 ==0) i++;
  }

  void act() {
  }
}
