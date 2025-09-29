 class gif {
   int i;
   int ratCount;
   int ratx, raty, ratw, rath;
   PImage[] rat;
   
   
   gif(float _rx, float _ry, int _rw, int _rh ){ //setup constructor
   ratx = _rx;
   raty = _ry;
   ratw = _rw;
   rath = _rh;
   
   
   ratCount = 4;
     i = 0;
     rat = new PImage[ratCount]; 
     
     while(i < ratCount){
       rat[i] = loadImage("frame_"+i+"_delay-0.01s");
       i ++;
     }
     
     
 
   }
   
   void show(){
     image(rat[i], ratx, raty, ratw, rath);
     println(frameCount);
   if(frameCount % 2 ==0) i++;
     if(i == ratCount) i = 0;
     
     
    
     
     
     
     
   }
   
   void act(){
     
   }
   
   
   
   
 }
