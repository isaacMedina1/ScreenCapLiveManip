import java.awt.Robot;
import java.awt.image.BufferedImage;
import java.awt.Rectangle;

Robot robot;
BufferedImage img1;

float r1, g1, b1, a1;
int mySizeX = 408;
int mySizeY = 702;
boolean isGreen = false;
PImage current;
ArrayList <pixelObject> pixelObjects = new ArrayList<pixelObject>();

void setup() {
  size(mySizeX, mySizeY, P2D);

  try {
    robot = new Robot();
  } 
  catch (Exception e) {
    println(e.getMessage());
  }
}//end of setup()

void draw() {
  background(0);
  Rectangle screenCap = new Rectangle(30, 30, mySizeX, mySizeY);
  img1 = robot.createScreenCapture(screenCap);
  PImage current = new PImage(img1);
  current.loadPixels();

  for (int x = 0; x < current.width; x = x+20) {
    for (int y = 0; y < current.height; y = y+20) {
      int index = x + y * current.width;
      color currentColor = current.pixels[index];
      r1 = red(currentColor);
      g1 = green(currentColor);
      b1 = blue(currentColor);
      a1 = alpha(currentColor);

      pixelObject p = new pixelObject(x, y, r1, g1, b1, a1, isGreen);
      pixelObjects.add(p);
    }
  }

  for (pixelObject p : pixelObjects) {
    p.show();
  }

  pixelObjects.clear();
}//end of draw()
