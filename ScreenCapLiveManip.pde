import java.awt.Robot;
import java.awt.image.BufferedImage;
import java.awt.Rectangle;

Robot robot;
BufferedImage img1;

int r, g, b;
int moveCount;
int trackColor;
float r1, g1, b1, a1;
float r2, g2, b2;
float incR, incG, incB;
float distRGB;

int mySize = 300;

int maxSlider = 1;
int thresholdDark = 120;
float colorThreshold = 80;

PImage prior;
PImage current;
ArrayList <pixelObject> pixelObjects = new ArrayList<pixelObject>();

void setup() {
  size(300, 300, P2D);

  try {
    robot = new Robot();
  } 
  catch (Exception e) {
    println(e.getMessage());
  }

  r = int(random(255));
  g = int(random(255));
  b = int(random(255));

  incR = 30;
  incG = 30;
  incB = 30;

  trackColor = color(148, 244, 75); //tracking white out.
  //prior = new PImage(400, 400);
}//end of setup()

void draw() {
  if (maxSlider == 1) {
    background(0);
  }

  Rectangle screenCap = new Rectangle(0, 0, mySize, mySize);
  img1 = robot.createScreenCapture(screenCap);
  PImage current = new PImage(img1);
  current.loadPixels();

  for (int x = 0; x < current.width; x++) {
    for (int y = 0; y < current.height; y++) {
      int index = x + y * current.width;
      color currentColor = current.pixels[index];
      r1 = red(currentColor);
      g1 = green(currentColor);
      b1 = blue(currentColor);
      a1 = alpha(currentColor);

      r2 = red(trackColor);
      g2 = green(trackColor);
      b2 = blue(trackColor);

      float d1 = distanceRGB(distRGB);
      float avgRGB = (r1 + g1 + b1)/3;

      boolean isGreen = false;
      if (avgRGB > thresholdDark) {
        if (d1 < colorThreshold * colorThreshold) {
          isGreen = true;
        }
        pixelObject p = new pixelObject(x, y, r1, g1, b1, a1, isGreen);
        pixelObjects.add(p);
      }
    }//end of forLoop y
  }//end of forLoop x

/*
  if (moveCount > 0 && moveCount != 27 && moveCount > 30000 && maxSlider == 1) {
    float random1 = random(40);
    background(random(230, 255)-random1, random(183, 200)-random1, random(110, 130)+random1);
  }*/

  for (pixelObject p : pixelObjects) {
    p.rainbowfy(r, g, b);
    p.show();
  }

  if (r > 200 || r <= 0) {
    incR = incR * -1;
  }
  if (g > 255 || g <= 0) {
    incG = incG * -1;
  }
  if (b > 255 || b <= 0) {
    incB = incB * -1;
  }

  r = int(lerp(r, r + incR, 0.9));
  g = int(lerp(g, g + incG, 0.9));
  b = int(lerp(b, b + incB, 0.9));

  //prior = current;
  //prior.loadPixels();
  pixelObjects.clear();
}//end of draw()

float distanceRGB (float dDist) {
  dDist = ((r2-r1)*(r2-r1)) + ((g2-g1)*(g2-g1)) + ((b2-b1)*(b2-b1));
  distRGB = dDist;
  return distRGB;
}

void mousePressed() {
  loadPixels();
  int loc = mouseX + mouseY * width;
  trackColor = pixels[loc];
  println("r " + red(trackColor) + " g " + green(trackColor) + " b " + blue(trackColor));
  background(0);
}
