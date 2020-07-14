class Rotater {
  float x,y;
  float spin;
  float speed;
  float w;
  float w2;
  
  Rotater(float tempx, float tempy, float tempSpeed, float tempW, float tempw2) {
    x = tempx;
    y = tempy;
    spin = 0;
    speed = tempSpeed;
    w = tempW;
    w2 = tempw2;
  }
  void spin() {
    spin += speed;
  }
  void display() {
    rectMode(CENTER);
    
    fill(0);
    pushMatrix();
    translate(x,y);
    rotate(spin);
    rect(0,0,w,w2);
    popMatrix();
    fill(1);
  }
}
// I was trying to add another class of moving objects, but I decided to focus just on the rotating ones.
class Scalers {
  float x,y;
  float spin;
  float speed;
  float w;
  
  Scalers(float tempx, float tempy, float tempSpeed, float tempW) {
    x = tempx;
    y = tempy;
    spin = 0;
    speed = tempSpeed;
    w = tempW;
  }
  void spin() {
    spin += speed;
  }
  void display() {
    rectMode(CENTER);
    
    fill(0);
    pushMatrix();
    translate(x,y);
    scale(spin);
    rect(0,0,w,w);
    popMatrix();
    fill(1);
  }
}