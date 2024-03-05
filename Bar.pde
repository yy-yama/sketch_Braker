Bar bar;

class Bar {
  int r, g, b;
  //バーの水平位置、長さ、厚み

  float y;
  float w;
  float h;

  int times=0;

  float nowPoint;

  Bar() {
  }

  void remake() {
    times=0;

    w=160.0*magn;
    h=15.0*magn;

    this.r=255;
    this.g=255;
    this.b=255;

    this.y=height-160.0*magn;
  }

  void display() {
    rectMode(CENTER);
    colorMode(RGB);
    noStroke();
    fill(r, g, b);
    /*    
     if (mouseX<margin+this.w/2.0) {
     rect(margin+this.w/2.0, this.y, this.w, this.h);
     nowPoint=margin+this.w/2.0;
     } else if (margin+newWidth-this.w/2.0<mouseX) {
     rect(margin+newWidth-this.w/2.0, this.y, this.w, this.h);
     nowPoint=margin+newWidth-this.w/2.0;
     } else {
     rect(mouseX, this.y, this.w, this.h);
     nowPoint=mouseX;
     }
     */
    rect(newMouseX, this.y, this.w, this.h);
    nowPoint=newMouseX;

    if (item.D) {
      fill(255, 0, 0);
      rect(nowPoint-this.w/4.0, this.y, this.w/2.0, this.h);
      fill(0, 0, 255);
      rect(nowPoint+this.w/4.0, this.y, this.w/2.0, this.h);
    }
    if (item.E) {
      fill(255, 0, 0);
      rect(newMouseX, this.y-m5, m30, m20);
      rect(newMouseX, this.y-m15, m15, m40);
    }
  }

  void colorChange(int R, int G, int B) {
    this.r=R;
    this.g=G;
    this.b=B;
  }
}
