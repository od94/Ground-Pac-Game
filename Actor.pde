 abstract class Actor{
   int aX,aY; 
   ArrayList xHistory = new ArrayList();
   ArrayList yHistory = new ArrayList();
   boolean isFinished;
     Dir dir;
    void move(){};
   void display(){};
 }
 
 
 class Player extends Actor{
   boolean hasFood;
   
  
  Player(){
    aX=0;
    xHistory.add(aX);
    aY=10;
    yHistory.add(aY);
    spawnFood();
    spawnExit();
  }
  
  void move(){
    if(dir == Dir.U) stepY(aY-1); //<>//
    else if(dir == Dir.D) stepY(aY+1);
    else if(dir == Dir.R) stepX(aX+1);
    else if(dir == Dir.L) stepX(aX-1);
    xHistory.add(aX);
    yHistory.add(aY);
    foodCheck();
    exitCheck();
   
}

  void foodCheck(){
       if(Maze[aY*x+aX].isFood){
       this.hasFood = true;
       Maze[aY*x+aX].isFood = false;
       }
  }
  void exitCheck(){
  if(this.hasFood){
    if(Maze[aY*x+aX].isExit){
      this.isFinished=true;
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
   Ghost(ArrayList x, ArrayList y){
     this.xHistory =x;
     this.yHistory =y;
   }
   void move(){
   aX=xHistory.get(Counter);
   };
 }
