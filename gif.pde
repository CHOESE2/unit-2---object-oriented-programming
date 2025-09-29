 class gif {
   int i;
   int ratCount;
   int ratx, raty, ratw, rath;
   PImage[] rat;
   
   
   gif(){ //setup constructor
   ratCount = 4;
     i = 0;
     rat = new PImage[ratCount]; 
     
     while(i < ratCount){
       rat[i] = loadImage("frame_"+i+"_delay-0.01s");
       i ++;
     }
     
     
 
   }
   
   void show(){
     image(rat[i], 0, 0, width, height);
     println(frameCount);
   if(frameCount % 2 ==0) i++;
     if(i == ratCount) i = 0;
     
     
    
     
     
     
     
   }
   
   void act(){
     
   }
   
   
   
   
 }
