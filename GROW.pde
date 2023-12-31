import java.util.Iterator;
PImage img;
ArrayList cells;
ArrayList newcells;
float food[][];


String filename = "2345.jpg";
int strokesPerFrame = 25;
boolean inverted = true;
int ratio = 1;

void setup()
{
 img = loadImage(filename);
 //println(img.height);
 size(650, 975);
 food = new float[width/ratio][height / ratio];
 img.loadPixels();
 for (int x = 0; x < width / ratio; ++x)
  for (int y = 0; y < height / ratio; ++y) {
   color pix = img.pixels[(x + y * width) * ratio];
   int r = pix & 0xFF, g = (pix >> 8) & 0xFF, b = (pix >> 16) & 0xFF;
   food[x][y] = (r * 0.2126 + g * 0.7152 + b * 0.0722) / 255.0; // luma
   if (inverted) food[x][y] = 1 - food[x][y];
 }
if (inverted) { 
 background(255);
} else { 
 background(0);
}
 cells = new ArrayList();
 newcells = new ArrayList();
 Cell c = new Cell(); 
 c.xpos = width / 2;
 c.ypos = height / 2;
 cells.add(c);
 frameRate(30);
 }
 
 void draw()
 {
 newcells.clear();
 loadPixels();
 Iterator<Cell> itr = cells.iterator();
 while (itr.hasNext()) {
  Cell c = itr.next();
  c.draw();
  c.update();
  }
  updatePixels();
   cells.addAll(newcells);
 }
 
 float feed(int x, int y, float thresh) {
  float r = 0.0;
  if (x >= 0 && x < width && y >= 0 && y < height) {
   x /= ratio;
   y /= ratio;
   if (food[x][y] > thresh) {
   r = thresh;
   food[x][y] -= thresh;
  } else {
   r = food[x][y];
   food[x][y] = 0.0;
  }
 }
   return r;
}
 class Cell {
  float xpos, ypos;
  float dir;
  float state;
  Cell() {
   xpos = random(width);
   ypos = random(height);
   dir = random(2*PI);
   state = 0;
 }
  Cell(Cell c) {
   xpos = c.xpos;
   ypos = c.ypos;
   dir = c.dir;
   state = c.state;
  }
  void draw() {
   if (state > 0.001 && xpos >= 0 && xpos < width && ypos >= 0 && ypos < height) {
    if (inverted) {
      pixels[ int(xpos) + int(ypos) * width ] = color(0, 0, 0);
     } else {
      pixels[ int(xpos) + int(ypos) * width ] = color(255, 255, 255);
     } 
     
     pixels[ int(xpos) + int(ypos) * width ] = img.pixels[ int(xpos) + int(ypos) * width ];
    }
  }
  
  void update()
  {
  state += feed(int(xpos), int(ypos), 0.3) - 0.295;
  xpos += cos(dir);
  ypos += sin(dir);
  dir += random(-PI/4, PI/4);
  
  if (xpos < 0 || xpos > width || ypos < 0 || ypos > height) {
    xpos = random(0, width);
    ypos = random(0, height);
    return;
   } 
   
   if (state > 0.15 && cells.size() < 200) {
    divide();
   } else
   if (state < 0) {
    xpos += random(-32, +32);
    ypos += random(-32, +32);
    state = 0.001;
    }
   }
   void divide() {
    state /= 2;
    Cell c = new Cell(this);
    float dd = random(PI/4);
    dir += dd;
    c.dir -= dd;
    newcells.add(c);
   }
  }     
