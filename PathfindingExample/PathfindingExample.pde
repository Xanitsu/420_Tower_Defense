//OBJECTS
Level level;
Pathfinder pathfinder;
Player player;
//OBJECTS

void setup(){
 TileHelper.app = this; 
 size(640,640);
 
 level = new Level();
 pathfinder = new Pathfinder();
 player = new Player();
}

void draw(){
 //UPDATE LOGIC
 player.update();
 //END UPDATE LOGIC
 
 //DRAW LOGIC
 background(127);
 level.draw();
 player.draw();
 //END DRAW LOGIC
}


void mousePressed(){
  Point p = TileHelper.pixelToGrid(new PVector(mouseX, mouseY));
  
  player.setTargetPosition(p);
}