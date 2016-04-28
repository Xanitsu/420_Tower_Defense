class Tower {

   ArrayList T;//tower
  
  // GRID-SPACE COORDINATES:
  Point gridP = new Point(); // current position
  Point gridT = new Point(); // target position (pathfinding goal)

  // PIXEL-SPACE COORDINATES:
  PVector pixlP = new PVector(); // current pixel position

 
  

//  void setTargetPosition(Point gridT) {
//    this.gridT = gridT.get();


Tower(Point Start){
      teleportTo(Start);
      T = new ArrayList(); 
    }
void teleportTo(Point gridP) {
    Tile tile = level.getTile(gridP.x, gridP.y);
    if (tile != null) {
      this.gridP = gridP.get();
      this.gridT = gridP.get();
      this.pixlP = tile.getCenter();
    }
}
    
 
 
  void update() {
    Tile tile =  level.getTile (X, Y);
      tile.isOn = true;

  }

  void draw() {
    noStroke();
    fill(255);
    ellipse(pixlP.x, pixlP.y, 30, 30);
  }
}