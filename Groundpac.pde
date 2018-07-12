 Point[] Maze;
 int x,y; 
 int scale =25;
 Actor player;
 ArrayList<Actor> ghosts = new ArrayList<Actor>(); 
 int Counter;
 void setup(){
  
   size(1000,800);
  frameRate(7);
  
  x=width/scale;
  y=height/scale;
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
   for(int i=0;i<ghosts.size();i++)
  {
    Actor tmp=ghosts.get(i);
    tmp.move();
    tmp.display();
  }
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
 ghosts.add(new Ghost(player.History));
 Counter=0;
 player = new Player();
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
 
 void gameOver(){
   textSize(50);
   fill(255);
   text("You are a Loser",width/2 -100,height/2);
   noLoop();
 }
