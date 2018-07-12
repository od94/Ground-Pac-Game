 abstract class Actor{
   int aX,aY; 
   ArrayList<Point> History = new ArrayList<Point>();
  
   boolean isFinished;
     Dir dir;
    void move(){};
   void display(){};
 }
 
 
 class Player extends Actor{
   boolean hasFood;
   
  
  Player(){
    aX=floor(random(x));
    aY=floor(random(y));
    History.add(Maze[aY*x+aX]);
    
    
    spawnFood();
    spawnExit();
  }
  
  void move(){
    if(dir == Dir.U) stepY(aY-1);
    else if(dir == Dir.D) stepY(aY+1);
    else if(dir == Dir.R) stepX(aX+1);
    else if(dir == Dir.L) stepX(aX-1);
    History.add(Maze[aY*x+aX]);
    
    foodCheck();
    exitCheck();
   
}

  void foodCheck(){
       if(Maze[aY*x+aX].isFood){
       this.hasFood = true;
       Maze[aY*x+aX].isFood = false;
       }
  }
  /*
  void ghostCheck(){
       for(int i=0;i<ghosts.size();i++)
  {
    Actor tmp=ghosts.get(i);
    if(this.aX==tmp.aX && this.aY==tmp.aY)gameOver();
  }
       }
       */
  
  void exitCheck(){
  if(this.hasFood){
    if(Maze[aY*x+aX].isExit){
      this.isFinished=true;
      Maze[aY*x+aX].isExit=false;
      }
    }
  }
  void stepY(int pos){
   if(pos >=0 && pos <y &&!Maze[pos*x+aX].isWall)aY=pos;
  }
  
  void stepX(int pos){
    if (pos >=0 && pos < x && !Maze[pos+aY*x].isWall )aX=pos;
  }
  
  void spawnFood(){
    int index = (floor(random(y))*x)+floor(random(x));
    if(Maze[index].isWall || Maze[index].isExit )this.spawnFood();
    else Maze[index].isFood = true;
  }
  void spawnExit(){
    int index = (floor(random(y))*x)+floor(random(x));
    if(Maze[index].isWall || Maze[index].isFood )this.spawnExit();
    else Maze[index].isExit = true;
  }
  void display(){
  fill(255,255,0);
       ellipse(aX*scale+(scale/2),aY*scale+(scale/2),scale,scale);
  }
 }
 
 class Ghost extends Actor{
   Ghost(ArrayList x){
     this.History =x;
     
   }
   void move(){
     if(Counter<History.size()){
    Point temp=History.get(Counter);
    aX=temp.pX;
    aY=temp.pY;
    killCheck();
     }
   };
   void display(){
     fill(0,0,255);
       ellipse(aX*scale+(scale/2),aY*scale+(scale/2),scale,scale);
   }
   void killCheck(){
     if(aX==player.aX && aY==player.aY)gameOver();
   }
 }
