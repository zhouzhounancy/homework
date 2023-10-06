size(800,800);
background(255);

float a=random(0,800);
float b=random(0,800);
float c=random(a,800);

fill(255,255,0);
strokeWeight(5);
rect(0,0,a,b);
    
fill(0,0,255);
strokeWeight(8);
rect(c,0,800-c,b);
    
fill(255,0,0);
strokeWeight(8);
rect(0,b,800,800-b);
saveFrame("1.png");
  
