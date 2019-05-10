class pixelObject {
  float x;
  float y;
  float z;
  float r;
  float g;
  float b;
  float a;
  boolean isGreen;

  pixelObject(int px, int py, float rx, float gx, float bx, float ax, boolean isGreenx) {
    x = px;
    y = py;
    r = rx;
    g = gx;
    b = bx;
    a = ax;
    isGreen = isGreenx;
  }

  void show() {
    stroke(r, g, b, a);
    fill(r, g, b, a);
    rect(x, y, 20, 20);
  }
}
