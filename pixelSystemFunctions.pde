import java.awt.Robot;
import java.awt.image.BufferedImage;
import java.awt.Rectangle;

/*JAVA OBJECTS*/
Robot robot;
BufferedImage img1;

/*OUR SYSTEM OF CAPTURED PIXELS*/
PixelSystem pxs;

void setup() {
  size(300, 300, P2D);
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
  
  int myValue;
  myValue = int(map(mouseX, 0, width, 0, 3));
  println(myValue);
  
  pxs.run(myValue); //function number selected by myValue
}
