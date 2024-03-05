Ball[] ball=new Ball[3];

class Ball {
  boolean alive=false;

  float x, y;
  float px, py;

  float dia;

  float spdx;
  float spdy;

  float speed;

  float position;

  float space;

  boolean magnet=false;

  //バーに当たったボールの反射角
  float limitAngle=(PI*2/360)*20;
  //ボール反射の最大角
  float subtleAngle=(PI*2/360)*5;

  boolean notContinueX=false;
  boolean notContinueY=false;

  Ball() {
  }

  void remake() {
    alive=false;

    dia=13.0*magn;

    this.x=width/2;
    this.y=bar.y;

    this.px=this.x;
    this.py=this.y;

    space=20.0*magn;

    speed=SPEED;
  }

  void Random() {
    float sAngle=random(PI/2-subtleAngle, PI/2+subtleAngle);

    this.spdx=-cos(sAngle)*this.speed;
    this.spdy=-sin(sAngle)*this.speed;
  }

  void move() {
    if (alive) {
      if (State==1) {
        this.x+=this.spdx*SPadjust;
        this.y+=this.spdy*SPadjust;
      }
    }
  }

  void display() {
    if (alive) {

      if (State==0) {
        this.x=bar.nowPoint;
        this.y=bar.y-this.dia/2-bar.h/2;
      } else if (magnet) {
        this.x=bar.nowPoint+position*bar.w/2.0;
        this.y=bar.y-this.dia/2-bar.h/2;
      }
      if (itemEffect.inv) {
        invincible.display(this.x, this.y, this.spdx, this.spdy);
      }
      colorMode(RGB);
      noStroke();
      fill(255);
      ellipse(this.x, this.y, this.dia, this.dia);

      this.px=this.x;
      this.py=this.y;
    }
  }

  void wallReflection () {
    if (alive) {
      if (((this.x<margin+dia/2.0)||(this.x>margin+newWidth-dia/2.0))&&(!notContinueX)) {
        this.spdx=-this.spdx;
        sound.pingpong.play(0);
        notContinueX=true;
      } else if ((this.x>margin+space)&&(this.x<margin+newWidth-space)) {
        notContinueX=false;
      }
      if ((this.y<above+dia/2.0)&&(!notContinueY)) {
        sound.pingpong.play(0);
        this.spdy=-this.spdy;
        notContinueY=true;
      } else if (this.y>above+space) {
        notContinueY=false;
      }
      if (this.y>height-200.0) {
        //this.spdy=-this.spdy;//デバッグ用
      }
    }
  }
}
