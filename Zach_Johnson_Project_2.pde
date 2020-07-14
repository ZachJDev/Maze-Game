PImage heart; // the mouse's image
Rotater[] rotaters; // this is for the array of Black rectanges
color c_1 = color(0, 255, 0); // this was an easy way for me to work with the colors
color c_2 = color(255, 0, 255);// " "
int lev_count = 0; //counts the level


boolean lev_start = false;

// this is just for the beginning ( I Think). Because
// Im coming back and commenting all of this before I turn it in,
// looking back at all of this, I think there would be a way to combine 
// lev_count, lose, and the function lev_new, at least in a somewhat 
// more organized fashion.

int x1, x2, y1, y2; // for the rectange positions
boolean lose = true; // see above
ScoreList scorelist; // sets up our scorelist!

void setup() 
{
  size(800, 800);
  x1= 0;
  y1 = height -50;
  //frameRate(2); // I was using this for debug purposes; it helped to see exactly when things went wrong.
  noStroke(); // because of the way my dectection works, I turned the stroke off.
  noCursor(); // so the mouse isn't "dragging" the heart around.
  scorelist = new ScoreList(); // initialized score list
  heart = loadImage("heart.gif"); // loads the heart image
}

void draw() {
  background(255);
  image(heart, mouseX, mouseY); // puts the heart image at the mouse

//this code is the level counter at the top of the screen.

  textSize(32); 
  fill(0, 11, 11);
  text(lev_count, width/2, 40);

//the start and end rectangles

  fill(c_1);
  rect(x1, y1, 50, 50);
  fill(c_2);
  rect(x2, y2, 50, 50);

// what happens on lose & at the beginning of the game.

  if (lose) {

    scorelist.displayScores();
    x1 = 0;
    y1 = height-50;
    lev_count = 0;


    if (get(mouseX, mouseY) == color(0, 255, 0)) {
      lev_start = true;
      lose = false;
    }
  } else {
    for (int i =0; i < rotaters.length; i++) {
      rotaters[i].spin();
      rotaters[i].display();
    }
  }
  if (lev_start) {
    lev_count++;

    x2 =int(random(width));
    y2 =int(random(height));

    rotaters = new Rotater[1];

    for (int i = 0; i <rotaters.length; i++) {
      rotaters[i] = new Rotater(random(width), random(height), random(-.1, .1), random(50), random(108));
    }
    lev_start = false;
    //noLoop();
  }

  fill(c_1);
  rect(x1, y1, 50, 50);
  fill(c_2);
  rect(x2, y2, 50, 50);


  if (lev_count != 0) {
    if (get(mouseX, mouseY) == color(255, 0, 255)) {
      lev_new();
    }
  }
  if (get(mouseX, mouseY) == color(0)) {
    scorelist.saveScore(lev_count);
    lose = true;
    lev_count = 0;
  }
}

void keyPressed() {
  if (key == 'r' ||key == 'R') {
    lose = true;
  }
}