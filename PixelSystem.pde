/*this is the soul of our program*/

class PixelSystem {
  ArrayList<PixelObject> pixelObjects;
  color trackColor = color(148, 244, 75);
  float Colorthreshold = 80;
  float dThreshold = 30;

  PixelSystem () {
    pixelObjects = new ArrayList<PixelObject>();
  }

  void run(int func, int sizeX, int sizeY, int xAdd, int yAdd, float cR, float cG, float cB) {
    Rectangle screenCap = new Rectangle(0, 23, sizeX, sizeY);
    img1 = robot.createScreenCapture(screenCap);
    PImage current = new PImage(img1);
    current.loadPixels();
    
    for (int x = 0; x < current.width; x = x+xAdd) {
      for (int y = 0; y < current.height; y = y+yAdd) {
        int index = x + y * current.width;
        color currentColor = current.pixels[index];
        float r1 = red(currentColor);
        float g1 = green(currentColor);
        float b1 = blue(currentColor);
        float a1 = alpha(currentColor);
        
        float r2 = red(trackColor);
        float g2 = green(trackColor);
        float b2 = blue(trackColor);
        float d1 = distSq(r1, g1, b1, r2, g2, b2);
        
        int thresholdDark = 120;
        float avgRGB = (r1 + g1 + b1)/3;
        boolean isGreen = false;
        if (avgRGB > thresholdDark) {
          if (d1 < Colorthreshold*Colorthreshold) {
            isGreen = true;
          }//end of "if(d1...)" statement
          PixelObject p = new PixelObject(x, y, r1, g1, b1, a1, isGreen);
          pixelObjects.add(p);
        }//end of "if(avgRGB...)" statement
      }//end of "for(y...)" loop
      
      for (PixelObject p : pixelObjects) {
        p.show(func, xAdd, yAdd, cR, cG, cB);
      }//end of "for(PixelObject p:pixelObjects)" loop
      pixelObjects.clear();
    }//end of "for(x...)" loop
  }//end of "void run()"
  
  float distSq(float x1, float y1, float z1, float x2, float y2, float z2) {
    float d = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) + (z2-z1)*(z2-z1);
    return d;
  }//end of "float distSq()"
}//end of "class PixelSystem{}"
