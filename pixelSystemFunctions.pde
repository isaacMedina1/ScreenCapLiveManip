import java.awt.Robot;
import java.awt.image.BufferedImage;
import java.awt.Rectangle;

/*JAVA OBJECTS*/
Robot robot;
BufferedImage img1;

/*OUR SYSTEM OF CAPTURED PIXELS*/
PixelSystem pxs;

int mySizeX = 408; 
int mySizeY = 702;

void setup() {
  size(mySizeX, mySizeY, P2D);
  try {
    robot = new Robot();
  } 
  catch (Exception e) {
    println(e.getMessage());
  }
  pxs = new PixelSystem();
}

void draw() {
  background(0);
  float randR = random(255);
  float randG = random(255);
  float randB = random(255);
  
  int myValue;
  myValue = int(map(mouseX, 0, width, 0, 3));
  println(myValue);
  
  //pxs.run[func, sizeX, sizeY, xAdd, yAdd, cR, cG, cB] <- cheat line
  pxs.run(myValue, mySizeX, mySizeY, 5, 5, randR, randG, randB); //function number selected by myValue
}
