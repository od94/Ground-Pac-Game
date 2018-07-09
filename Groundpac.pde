 Point[] Maze;
 int x,y; 
 int scale =10;
 Actor player;
 ArrayList ghosts = new ArrayList(); 
 int Counter;
 void setup(){
  
   size(500,500);
  frameRate(7);
  
  x=500/scale;
  y=500/scale;
  Maze = new Point[x*y];
  
  background(0);
  
  for(int i=0;i<y;i++){
    for(int j=0;j<x;j++){
      boolean wall = random(1)>0.85;
     Maze[(i*x)+j]= new Point (j,i,wall);
    }
  }
  player = new Player();
 
 }
 
 void draw(){
   background(0);
   player.move();
 for(int i=0;i<y;i++){
    for(int j=0;j<x;j++){
     Maze[(i*x)+j].display();
    }
    player.display();
  }
   Counter ++;
 if(player.isFinished) levelUp();

 }
 
 void levelUp(){
 ghosts.add(new Ghost(player.xHistory,player.yHistory));
 Counter=0;
 }
 
 enum Dir{ U,D, L, R}
 
 void keyPressed(){
   if (keyCode == UP) {
      player.dir= Dir.U;
    } else if (keyCode == DOWN) {
      player.dir= Dir.D;
    }   else if (keyCode == RIGHT) {
      player.dir= Dir.R;
    }  else if (keyCode == LEFT) {
      player.dir= Dir.L;
    }    
 }
