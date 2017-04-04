// Ira Winder, jiw@mit.edu, 2017
// This is a quick sketch that demonstrates how to use Processing's 
// "filter(INVERT)" method to create an inverted background canvas while 
// maintaining foreground colors.

boolean invert;

// Background to invert
PImage img;

// Forground to NOT invert
PVector[] dotLoc;
int dotNum = 50;

void setup() {
  invert = false;
  
  // Load Background
  img = loadImage("noisemap.png");
  
  // Load Forground dot locations
  dotLoc = new PVector[dotNum];
  for (int i=0; i<dotNum; i++) {
    dotLoc[i] = new PVector();
    dotLoc[i].x = random(0, img.width);
    dotLoc[i].y = random(0, img.height);
  }
  
  size(img.width, img.height);
}

void draw() {
  
  // Draw Background
  image(img, 0, 0);
  fill(0);
  textSize(40);
  textAlign(CENTER);
  text("Press 'i' to Invert Background", 0.5*width, 0.5*height);
  // Finish Background
  
  // Inverts canvas image drawn up to now
  if (invert) filter(INVERT);
  // Anything drawn after this point is not inverted
  
  // Draw Forground (50 Random RED circles)
  fill(#FF0000);
  noStroke();
  for (int i=0; i<dotNum; i++) {
    ellipse (dotLoc[i].x, dotLoc[i].y, 10, 10);
  }
  // Finish Forground
}

void keyPressed() {
  switch(key) {
    case 'i': // invert
      invert = !invert;
      println("Invert: " + invert);
      break;
  }
}
