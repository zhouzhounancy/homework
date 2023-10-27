import gifAnimation.*;
GifMaker gif;
float centerX, centerY, offsetX, offsetY, inc, r, rd;
int segNumber;

void setup() 
{
    size(1920, 1080);
    background(0);
    noFill();
    colorMode(HSB);
    centerX = 0; centerY = height / 2;
    offsetX = offsetY = 0; 
    inc = 2; 
    segNumber = 500;
    r = 0; rd = 350;
    gif=new GifMaker(this,"noise.gif");
    gif.setRepeat(0);
    gif.setDelay(40);
}

void draw() 
{
    stroke((frameCount * 0.05) % 255, 144, 255, 64);
    beginShape();
    for(int i = 0; i < segNumber; i++) {
        float angel = TWO_PI * i / segNumber;
        PVector p = new PVector(cos(angel), sin(angel));
        float radius = r + rd * noise(offsetX + p.x * inc, offsetY + p.y * inc);
        p.mult(radius);
        vertex(p.x + centerX, p.y + centerY);
    }
    endShape(CLOSE);
    float offset = 0.003;
    offsetX += offset; offsetY += offset;
    centerX += 1;
    if(centerX > width) {
        centerX = 0;
        background(0);
     if(frameCount % 1==0){
       gif.addFrame();
     }
    }
}



void mousePressed(){
  gif.finish();
}
