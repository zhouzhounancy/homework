PImage img1;
PImage img2;
int[] xpos=new int[50];
int[] ypos=new int[50];
void setup(){
  size(800,800);
  smooth();
  img1=loadImage('1.png');
  img1.resize(120,120);
  img2=loadImage("2.png");
  img2.resize(120,120);
  imageMode(CENTER);
  for(int i=0;i<50;i++){
    xpos[i]=0;
    ypos[i]=0;
  }
}

void draw(){
  background(255);
  for(int i=0;i< xpos.length;i++){
    xpos[i]=xpos[i+1];
    ypos[i]=ypos[i+1];
  }
  xpos[xpos.length-1]=mouseX;
  ypos[ypos.length-1]=mouseY;
  
  for(int i=0;i<xpos.length;i++){
    image(img2,xpos[i],ypos[i]);
  }
  image(img1,mouseX,mouseY);
}
