float x,s;
void setup(){
  size(666,666,P2D);
  background(0);
}

void draw(){
  translate(width/2,height/2);
  s+=18;
  x+=3;
  noFill();
  beginShape(LINES); 
    stroke(0,0,255);
    vertex(cos(radians(s))*999,sin(radians(s))*999);
    stroke(255);
    vertex(cos(radians(x))*333,sin(radians(x))*333);
  endShape(); 
}
