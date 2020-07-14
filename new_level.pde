void lev_new() {
  
  Rotater x = new Rotater(random(width), random(height), random(-.2, .2), random(100), random(100));
  rotaters = (Rotater[]) append(rotaters, x);
  if (lev_count % 2 != 0 && lev_count != 0) {
    lev_count++;
    x1 = int(random(width));
    y1 = int(random(height));
    c_2 = color(0,255,0);
    rect(x2,y2,50,50);
   c_1 = color(255,0,255);
  rect(x1, y1,  50, 50);
  
  
  }else if (lev_count % 2 == 0) {
    lev_count++;
    x2 = int(random(500));
    y2 = int(random(500));
    c_2 = color(255,0,255);
    rect(x2,y2,50,50);
   c_1 = color(0,255,0);
  rect(x1, y1,  50, 50);
    
  }
   
}