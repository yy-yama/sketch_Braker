BreakBlock breakBlock;

class BreakBlock {
  int bbnum=19*5;

  float[][]bbX;
  float[][]bbY;

  float [][]bbspeedX;
  float [][]bbspeedY;

  float [][]bbspeedYY;

  float[]bbS;
  float[]bbB;

  float oneSide;

  BreakBlock() {
    bbX=new float[box.NUM][bbnum];
    bbY=new float[box.NUM][bbnum];

    bbspeedX=new float[box.NUM][bbnum];
    bbspeedY=new float[box.NUM][bbnum];

    bbspeedYY=new float[box.NUM][bbnum];

    bbS=new float[box.NUM];
    bbB=new float[box.NUM];

    oneSide=5.0*magn;
  }
  
  void make(int n, float x, float y, float c) {

    noStroke();
    colorMode(HSB);
    rectMode(CORNER);
    fill(c, 205, 255);

    for (int i=0; i<bbX[n].length; i++) {
      bbX[n][i]=i%19*5.0*magn+x;
      bbY[n][i]=floor(i/19)*5.0*magn+y;
      bbspeedY[n][i]=0;
      bbspeedYY[n][i]=random(0.09*magn, 0.1*magn);
      bbspeedX[n][i]=random(-0.2*magn, 0.2*magn);
      bbS[n]=205;
      bbB[n]=255;
    }
  }

  void display(int j, float boxColor) {

    colorMode(HSB);
    fill(boxColor, bbS[j], bbB[j]);
    noStroke();
    for (int i=0; i<bbX[j].length; i++) {
      if (bbY[j][i]<height) {
        rect(bbX[j][i], bbY[j][i], oneSide, oneSide);

        bbX[j][i]+=bbspeedX[j][i]*SPadjust;
        bbY[j][i]+=bbspeedY[j][i]*SPadjust;

        bbspeedY[j][i]+=bbspeedYY[j][i];
        bbB[j]-=0.015;
      }
    }
  }

  void modeDisplay(int k) {
    colorMode(RGB);
    noStroke();
    for (int i=0; i<bbX[k].length; i++) {
      if (bbY[k][i]<height) {
        fill(p.backColor[k][i], bbB[k]);

        rect(bbX[k][i], bbY[k][i], oneSide, oneSide);

        bbX[k][i]+=bbspeedX[k][i]*SPadjust;
        bbY[k][i]+=bbspeedY[k][i]*SPadjust;

        bbspeedY[k][i]+=bbspeedYY[k][i];
        bbB[k]-=0.015;
      }
    }
  }
}
