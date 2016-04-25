//OBJECTS
Level level;
Pathfinder pathfinder;
Player enemy;

float deltaTime = 0;
float timePrev = 0;
float timer = 0;
float time;

ArrayList<Tower> towers = new ArrayList <Tower>();
ArrayList<Player> enemies = new ArrayList<Player>();

//OBJECTS

void setup() {
  TileHelper.app = this; 
  size(640, 640);

  level = new Level();
  pathfinder = new Pathfinder();
  enemy = new Player();
  //towers = new ArrayList <Tower>(); 
  /* for (int i = 0; i < 2; i++) {
   enemies.add(new Player());
   }*/
}

void draw() {

  //UPDATE LOGIC
  enemy.update();
  //END UPDATE LOGIC

  time = millis()/1000;

  if (enemies.size() < 5) {

    // for (int i = 0; i <= 5; i++) {

    if (timer >= 100) {
      timer = 0;
      enemies.add(new Player());
    }// if end
    //}// for loop end
  }// if end

  timer += time;

  for (int i=0; i<towers.size(); i++) {
    //fill(255);
    //ellipse(gridP.x,gridP.y,28,28);
    towers.get(i).draw();
  }

print(towers.size());
  //spawnWave(5);
  
  Point p = TileHelper.pixelToGrid(new PVector(mouseX, mouseY));//making a new point p and using that to get the grid position of the mouses pixels space equivalent
  Tile tile = level.getTile(p.x, p.y);
  if (tile != null){ //if the tile is not null you can hover over the tile 
  tile.hover = true;
    // draw a little ellipse in the tile's center
   PVector c =  tile.getCenter(); // gets the center of the mouse 
   fill(0);
   ellipse(c.x, c.y, 8, 8);
  }

  //print(enemies.size());
  //print(timer);

  //DRAW LOGIC
  background(127);
  level.draw();

  

  //enemy.draw();
  for (int i = 0; i < enemies.size(); i++) {
    enemies.get(i).draw();
    enemies.get(i).update();

    //print(enemies.get(i).isDead);
    if (enemies.get(i).isDead) enemies.remove(i);
  }

for (int i=0; i<towers.size(); i++) {
    towers.get(i).update();
  }
  //END DRAW LOGIC
}

void spawnWave(int amountToSpawn) {

  if (amountToSpawn <=0) return;
  else enemies.add(new Player());

  int spawnTimer = 0;
  spawnTimer += time;

  if (spawnTimer > 1000) {
    spawnWave(amountToSpawn--);
    spawnTimer = 0;
  }
}


void mousePressed() {
  Point p = TileHelper.pixelToGrid(new PVector(mouseX, mouseY));

  enemy.setTargetPosition(p);

  Tower t = new Tower(p);

  //add tower to array/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  towers.add(new Tower(p));
}

/*void Time(){
 float timeCurr = millis();
 deltaTime = (timeCurr - timePrev) / 1000;
 timePrev = timeCurr;
 }*/