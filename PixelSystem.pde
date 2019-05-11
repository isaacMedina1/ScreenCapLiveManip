/*this is the soul of our program*/

class PixelSystem {
  ArrayList<PixelObject> pixelObjects;

  //int isGreen;

  PixelSystem () {
    pixelObjects = new ArrayList<PixelObject>();
  }

  void run(int func) {
    Rectangle screenCap = new Rectangle(30, 30, 400, 400);
    img1 = robot.createScreenCapture(screenCap);
    PImage current = new PImage(img1);
    current.loadPixels();
    for (int x = 0; x < current.width; x = x+20) {
      for (int y = 0; y < current.height; y = y+20) {
        int index = x + y * current.width;
        color currentColor = current.pixels[index];
        float r1 = red(currentColor);
        float g1 = green(currentColor);
        float b1 = blue(currentColor);
        float a1 = alpha(currentColor);

        PixelObject p = new PixelObject(x, y, r1, g1, b1, a1 /*,isGreen*/);
        pixelObjects.add(p);
      }
    }
    for (PixelObject p : pixelObjects) {
      p.show(func);
    }
    pixelObjects.clear();
  }
}
