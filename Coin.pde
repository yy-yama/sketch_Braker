Coin coin;

class Coin {
  int []coinState=new int[20];
  float[] coinX=new float[20];
  float[] coinY=new float[20];
  float[] coinPY=new float[20];
  float coinSize=25.0;

  Coin() {
  }

  void delate() {
    for (int i=0; i<coinState.length; i++) {
      coinState[i]=0;
    }
  }

  void make(int boxOrder, float x, float y) {
    if (boxOrder>=box.NUM-20) {
      coinState[box.NUM-1-boxOrder]=1;
      coinX[box.NUM-1-boxOrder]=x+box.w/2;
      coinY[box.NUM-1-boxOrder]=y+box.h/2;
    }
  }

  void display() {
    for (int i=0; i<coinX.length; i++) {

      if (coinState[i]==1) {
        coinPY[i]=coinY[i];

        coinY[i]+=SPEED*0.2*SPadjust;

        pushMatrix();
        translate(coinX[i], coinY[i]);
        scale(magn*1.3);

        colorMode(RGB);
        noStroke();
        fill(215, 215, 0);
        arc(0+2, 0, coinSize-5, coinSize, -PI/2, PI/2);
        fill(245, 255, 0);
        ellipse(0, 0, coinSize-5, coinSize);        
        fill(0);
        ellipse(0, 0, coinSize-8, coinSize-3);        
        rectMode(CENTER);
        fill(245, 255, 0);
        rect(0, 0, coinSize-22, coinSize-15);
        popMatrix();
        if (coinY[i]>height) {
          coinState[i]=0;
        }
        judge(i);
      }
    }
  }

  void judge(int i) {
    hit.mouseChange();

    if (dist(coinX[i], coinY[i], newMouseX, bar.y)<m200) {

      if (hit.judge(coinX[i], coinY[i], coinX[i], coinPY[i], newMouseX-bar.w/2.0, bar.y-bar.h/2.0, newMouseX+bar.w/2.0, bar.y-bar.h/2.0)||
        hit.judge(coinX[i], coinY[i], coinX[i], coinPY[i], newMouseX-bar.w/2.0, bar.y+bar.h/2.0, newMouseX+bar.w/2.0, bar.y+bar.h/2.0)||
        (coinY[i]>bar.y-bar.h/2.0)&&(coinY[i]<bar.y+bar.h/2.0)&&(newMouseX-bar.w/2<coinX[i])&&(coinX[i]<newMouseX+bar.w/2.0)) {
        sound.coin.play(0);

        coinState[i]=0;
        score.num+=10;

        return;
      }
    }
    return;
  }
}
