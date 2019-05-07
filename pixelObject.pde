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
    point(x, y);
    //ellipseMode(CENTER);
    //ellipse(x, y, 1, 1);
  }
  
  void move() {
    x = x + random(1,20);
    y = y + random(1,20);
  }
  
  void slide() {
    
  }

  void rainbowfy(float randomColorR, float randomColorG, float randomColorB) {
    if (isGreen) {
      r = randomColorR;
      g = randomColorG;
      b = randomColorB;
    }
  }
}
