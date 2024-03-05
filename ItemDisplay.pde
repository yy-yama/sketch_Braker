ItemDisplay itemDisp;

class ItemDisplay {
  /*
アイテムの説明：
   A　バー長くなる
   B　バー短くなる
   C　バーの効果を消す
   D　磁石
   E　ビーム
   F　ボール無敵になる
   G　ボール3つに増える
   H　ボール早くなる
   I　ボール遅くなる
   */

  ItemDisplay() {
  }

  void a(float x, float y) {
    common(x, y);
    noStroke();
    fill(0, 255, 0);
    rect(0, 0, 19.0, 8.0);
    stroke(255);
    line(10.0, 0, 1.0, 0);
    line(-10.0, 0, -1.0, 0);
    line(-4.0, -3.0, -9.0, 0);
    line(-4.0, 3.0, -9.0, 0);
    line(0+4.0, 0-3.0, 0+9.0, 0);
    line(0+4.0, 0+3.0, 0+9.0, 0);
    popMatrix();
  }
  void b(float x, float y) {
    common(x, y);
    noStroke();
    fill(255, 0, 255);
    rect(0, 0, 19.0, 8.0);
    stroke(255);
    line(0-10.0, 0, 0-1.0, 0);
    line(0+10.0, 0, 0+1.0, 0);
    line(0-4.0, 0-3.0, 0-1.0, 0);
    line(0-4.0, 0+3.0, 0-1.0, 0);
    line(0+4.0, 0-3.0, 0+1.0, 0);
    line(0+4.0, 0+3.0, 0+1.0, 0);
    popMatrix();
  }
  void c(float x, float y) {
    common(x, y);
    noStroke();
    fill(255, 255, 0);
    rect(0, 0, 19.0, 8.0);
    popMatrix();
  }
  void d(float x, float y) {
    common(x, y);
    noStroke();
    fill(255, 0, 0);
    rect(0-4.5, 0, 9.5, 8.0);
    fill(0, 0, 255);
    rect(0+4.5, 0, 9.5, 8.0);
    popMatrix();
  }
  void e(float x, float y) {
    common(x, y);
    stroke(255, 255, 0);
    fill(255, 0, 0);
    triangle(0, 0-6.0, 0+3.0, 0+7.0, 0-3.0, 0+7.0);
    popMatrix();
  }
  void f(float x, float y) {
    common(x, y);
    fill(255, 50, 0);
    ellipse(0, 0, 15.0, 15.0);
    fill(255);
    ellipse(0, 0, 5.0, 5.0);
    popMatrix();

    //invincible.miniDisplay(x, y);
  }
  void g(float x, float y) {
    common(x, y);
    fill(255);
    stroke(255);
    strokeWeight(1.0);
    ellipse(cos(radians(30))*5.0+0, sin(radians(30))*5.0+0, 5.0, 5.0);
    ellipse(cos(radians(150))*5.0+0, sin(radians(150))*5.0+0, 5.0, 5.0);
    ellipse(cos(radians(270))*5.0+0, sin(radians(270))*5.0+0, 5.0, 5.0);
    popMatrix();
  }
  void h(float x, float y) {
    common(x, y);
    fill(255);
    stroke(255);
    strokeWeight(1.0);
    ellipse(0+4.0, 0, 8.0, 8.0);
    line(0-9.0, 0, 0-1.0, 0);
    line(0-9.0, 0+6.0, 0+4.0, 0+6.0);
    line(0-9.0, 0-6.0, 0+4.0, 0-6.0);
    line(0-9.0, 0+3.0, 0+1.0, 0+3.0);
    line(0-9.0, 0-3.0, 0+1.0, 0-3.0);
    popMatrix();
  }
  void i(float x, float y) {
    common(x, y);
    fill(255);
    stroke(255);
    strokeWeight(1.0);
    ellipse(0+4.0, 0, 8.0, 8.0);
    line(0-7.0, 0, 0-1.0, 0);
    line(0-7.0, 0+6.0, 0-3.0, 0+6.0);
    line(0-7.0, 0-6.0, 0-3.0, 0-6.0);
    popMatrix();
  }
  void common(float x, float y) {
    colorMode(RGB);
    rectMode(CENTER);
    stroke(255);
    strokeWeight(1.0);
    fill(0);
    pushMatrix();
    translate(x, y);
    scale(magn*1.4);
    rect(0, 0, 20.0, 20.0);
  }
}
