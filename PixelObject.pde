/*Our Pixel class.
 Here we can write all the functions we want
 and activate them whith an specific number
 which may come from an OSC connection
 or just the movement of the mouse
 */

class PixelObject {
  float x;
  float y;
  float z;

  float r;
  float g;
  float b;
  float a;
  boolean isGreen;

  PixelObject(int px, int py, float rx, float gx, float bx, float ax, boolean isGreenx) {
    x = px;
    y = py;
    r = rx;
    g = gx;
    b = bx;
    a = ax;
    isGreen = isGreenx;
  }

  //main show() function
  void show(int func, int xAdd, int yAdd, float cR, float cG, float cB) {
    if (func == 1) {
      downscale(xAdd, yAdd);//calling downscale() if '1'
    }
    if (func == 2) {
      rainbowfy(xAdd, yAdd, cR, cG, cB);//calling rainbowfy() if '2'
    }
  }//end of "void show()"

  /*************************************/
  /*WHATEVER FUNCTIONS WE WANT TO WRITE*/
  void downscale(int sizeX, int sizeY) {
    noStroke();
    fill(r, g, b, a);
    rect(x, y, sizeX, sizeY);
  }//end of "void downscale()"

  void rainbowfy(int sizeX, int sizeY, float randomColorR, float randomColorG, float randomColorB) {
    if (isGreen) {
      r = randomColorR;
      g = randomColorG;
      b = randomColorB;
    }
    noStroke();
    fill(r, g, b, a);
    rect(x, y, sizeX, sizeY);
  }//end of "void rainbowfy()"
  /*************************************/
}
