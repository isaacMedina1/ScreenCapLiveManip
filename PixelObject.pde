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

  PixelObject(int px, int py, float rx, float gx, float bx, float ax/*, boolean isGreenx*/) {
    x = px;
    y = py;
    r = rx;
    g = gx;
    b = bx;
    a = ax;
    //isGreen = isGreenx;
  }

  //main show() function
  void show(int func) {
    if (func == 1) {
      downscale(20, 20);//calling downscale() if '1'
    }
    if (func == 2) {
      downscale(10, 20);//calling downscale() if '2'
    }
  }

  //whatever functions we want
  void downscale(int sizeX, int sizeY) {
    stroke(r, g, b, a);
    fill(r, g, b, a);
    rect(x, y, sizeX, sizeY);
  }
}
