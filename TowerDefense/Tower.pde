class Tower {

   ArrayList T;//tower
  
  // GRID-SPACE COORDINATES:
  Point gridP = new Point(); // current position
  Point gridT = new Point(); // target position (pathfinding goal)

  // PIXEL-SPACE COORDINATES:
  PVector pixlP = new PVector(); // current pixel position

 
  ArrayList bullets;//bullets
  PVector location = new PVector();
  float r = 40;
  float aX = r;
  float aY = r;
  int radius = 100;
  int Tfr = 0;//tower fire rate
  int inReach = 160;
  //PImage towers;
  float towerX, towerY;


  float angle;

//  void setTargetPosition(Point gridT) {
//    this.gridT = gridT.get();


Tower(Point Start){
      teleportTo(Start);
      T = new ArrayList(); 
      bullets = new ArrayList();
    }
void teleportTo(Point gridP) {
    Tile tile = level.getTile(gridP.x, gridP.y);
    if (tile != null) {
      this.gridP = gridP.get();
      this.gridT = gridP.get();
      this.pixlP = tile.getCenter();
    }
}
    
 ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 void shoot() {

    if(enemies.size()>0) {//if enemies in the array is greater then 0
      if(dist(((Player)enemies.get(0)).gridP.x, ((Player)enemies.get(0)).gridP.y,location.x,location.y) < inReach) {//if the distance of the enmenies is in reach
        Tfr++;//fire
        if(Tfr == 30){//if fire rate is = 10 cooldown(the larger the number the the longer it will take to fire again)
          bullets.add(new Bullet(gridP));  //add a bullet
          Tfr = 0;//reset fire rate
        }
      }

      for(int k=0; k<bullets.size(); k++) {//k is the bullets index

        //image(towerbase,location.x,location.y);
        ((Bullet)bullets.get(k)).run(gridP);//going through the bullets array it gets the run information
        pushMatrix();
        ellipse(pixlP.x, pixlP.y, 10, 10);
        translate(location.x,location.y+1);
        ellipse(pixlP.x, pixlP.y, 0, 0);

        popMatrix();

        if(dist(((Player)enemies.get(0)).gridP.x, ((Player)enemies.get(0)).gridP.y, ((Bullet)bullets.get(k)).loc.x, ((Bullet)bullets.get(k)).loc.y) < 10) {//if the bullet hits the enemy 
          bullets.remove(k);//remove the bullet from the array
          ((Player)enemies.get(0)).hurt();//hurt player function triggers damaging the enemy
        }
        else if(((Bullet)bullets.get(k)).loc.x > width || ((Bullet)bullets.get(k)).loc.x < 0 || ((Bullet)bullets.get(k)).loc.y > height || ((Bullet)bullets.get(k)).loc.y < 0) {//else "miss"
          bullets.remove(k);//remove bullet
        }
      }
    }
  }
 
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
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