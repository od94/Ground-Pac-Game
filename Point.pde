class Point{
   boolean isWall;
   boolean isExit;
   boolean isFood;
   int pX,pY;
   
   Point(int px, int py, boolean wall){
     this.pX=px;
     this.pY=py;
     this.isWall=wall;
   }
  
   void display(){
     if(isWall){
       fill(255,0,0);
       rect(pX*scale,pY*scale,scale,scale);
     }
     else if(isFood){
       fill(0,255,0);
       rect(pX*scale,pY*scale,scale,scale);
     }
     else if(isExit){
       fill(170,0,255);
       rect(pX*scale,pY*scale,scale,scale);
     }
   }
}
