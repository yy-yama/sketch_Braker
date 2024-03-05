Invincible invincible;

class Invincible {

  int nT=0;
  int tNum=256;
  int[]tState=new int[tNum];
  float[]tX=new float[tNum];
  float[]tY=new float[tNum];
  float[]tXspeed=new float[tNum];
  float[]tYspeed=new float[tNum];
  float[]tR=new float[tNum];
  float[]tG=new float[tNum];
  float[]tB=new float[tNum];
  float[]tA=new float[tNum];
  float[]tS=new float[tNum];
  float[]tAng=new float[tNum];

  float ran;
  float maxS;

  Invincible() {
    ran=10.0*magn;
    maxS=15.0*magn;
  }

  void remake() {
    nT=0;
    for (int i=0; i<tNum; i++) {
      tState[i]=0;
    }
  }

  void display(float x, float y, float spdx, float spdy) {

    colorMode(RGB);
    noStroke();

    TT(nT, x, y, spdx, spdy);

    Tdisplay();

    for (int i=0; i<tNum; i++) {
      tA[i]--;
    }

    nT++;
    if (nT>=tNum) {
      nT=0;
    }
  }

  void miniDisplay(float x, float y) {
    colorMode(RGB);
    noStroke();

    if (frameCount%4==0) {
      TT(nT, x, y, 0, SPEED*0.2);
    }

    Tdisplay();

    for (int i=0; i<tNum; i++) {
      tA[i]--;
    }

    nT++;
    if (nT>=tNum) {
      nT=0;
    }
  }

  void TT(int i, float x, float y, float spdx, float spdy) {
    tState[i]=1;

    tX[i]=random(x-ran, x+ran);
    tY[i]=random(y-ran, y+ran);
    tS[i]=random(maxS);
    tR[i]=random(255);
    tG[i]=random(50);
    tB[i]=random(50);
    tA[i]=255;
    tAng[i]=random(2*PI);
    tXspeed[i]=random(spdx/10.0, -spdx/10.0);
    tYspeed[i]=random(spdy/10.0, -spdy/10.0);
  }

  void Tdisplay() {

    for (int i=0; i<tNum; i++) {
      if (tState[i]==1) {
        fill(tR[i], tG[i], tB[i], tA[i]);
        beginShape();
        vertex(tX[i]+cos(tAng[i])*tS[i], tY[i]+sin(tAng[i])*tS[i]);
        vertex(tX[i]+cos(tAng[i]+radians(120))*tS[i], tY[i]+sin(tAng[i]+radians(120))*tS[i]);
        vertex(tX[i]+cos(tAng[i]+radians(240))*tS[i], tY[i]+sin(tAng[i]+radians(240))*tS[i]);

        endShape(CLOSE);
        if (i%2==0) {
          tAng[i]+=radians(1);
        } else {
          tAng[i]-=radians(1);
        }
        tX[i]+=tXspeed[i]*SPadjust;
        tY[i]+=tYspeed[i]*SPadjust;
      }
    }
  }

  void clean() {
    for (int i=0; i<tNum; i++) {
      tState[i]=0;
    }
  }
}
