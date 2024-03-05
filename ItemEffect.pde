ItemEffect itemEffect;

class ItemEffect {
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
  int beamNum=100;
  int beam;
  float[]beamX=new float[beamNum];
  float[]beamY=new float[beamNum];
  boolean[]beamState=new boolean[beamNum];

  int[]t=new int[3];

  int num=15;
  float[][]px=new float[3][num];
  float[][]py=new float[3][num];

  float[][] ang=new float[3][num];

  int[][] col=new int[3][num];

  int hCount=0;
  int iCount=0;
  int changeCount=10000;
  //変化時間は１０秒間

  boolean hState, iState;

  boolean []timing={false, false, false};

  int invTime=0;
  boolean inv=false;

  boolean speedChange=true;
  boolean speedReturn=true;

  ItemEffect() {
  }

  void remake() {
    for (int i=0; i<beamNum; i++) {
      beamX[i]=width/2.0;
      beamY[i]=bar.y;
      beamState[i]=false;
    }

    hCount=0;
    iCount=0;
    timing[0]=false;
    timing[1]=false;
    timing[2]=false;

    invTime=0;
    inv=false;

    speedChange=true;
    speedReturn=true;

    for (int z=0; z<3; z++) {
      t[z]=0;
    }
  }

  void move() {
    speedChange();
    if (inv) {
      FReturn();
    }
  }

  void A() {
    itemReturn();
    bar.colorChange(0, 255, 0);
    bar.w=250.0*magn;
    item.A=true;
    score.bonusItem-=30;
    sound.expan.play(0);
  }

  void B() {
    itemReturn();
    bar.colorChange(255, 0, 255);
    bar.w=80.0*magn;
    item.B=true;
    score.bonusItem+=50;
    sound.shrin.play(0);
  }

  void C() {
    itemReturn();
  }

  void D() {
    itemReturn();
    bar.colorChange(0, 0, 0);
    item.D=true;
    score.bonusItem-=30;
  }

  void E() {
    itemReturn();
    item.E=true;

    beamX=new float[beamNum];
    beamY=new float[beamNum];
    beamState=new boolean[beamNum];

    bar.colorChange(255, 0, 0);
    score.bonusItem-=30;
  }

  void beamMake() {
    if (item.E) {
      sound.beam.play(0);

      beamState[beam]=true;
      beamX[beam]=bar.nowPoint;
      beamY[beam]=bar.y-55.0*magn;
      beam++;
      score.bonusItem-=2;

      if (beam>=beamNum) {
        beam=0;
      }
    }
  }

  void beamDisplay() {
    if (item.E) {
      colorMode(RGB);
      stroke(255, 255, 0);
      strokeWeight(m5);
      for (int i=0; i<beamNum; i++) {
        if (beamState[i]) {
          beamY[i]-=SPEED*2.0*SPadjust;
          line(beamX[i], beamY[i], beamX[i], beamY[i]+m20);
        }
      }
    }
  }

  void itemReturn() {

    bar.colorChange(255, 255, 255);
    bar.w=160.0*magn;

    item.A=false;
    item.B=false;
    item.D=false;
    item.E=false;
  }

  void F() {
    inv=true;
    sound.invincible.play(0);
    invTime=millis();
  }

  void FReturn() {
    if (millis()-invTime>5000) {
      inv=false;
      invincible.clean();
      sound.invincible.pause();
    }
  }

  void G() {
    ballMake();
  }

  void ballMake() {
    if (ball[1].alive) {
    } else {
      ball[1].alive=true;
      ball[1].x=ball[0].x;
      ball[1].y=ball[0].y;
      ball[1].px=ball[0].px;
      ball[1].py=ball[0].py;
      float angle=random(radians(30), radians(150));
      ball[1].spdx=cos(angle)*ball[1].speed;
      ball[1].spdy=sin(angle)*ball[1].speed;
    }
    if (ball[2].alive) {
    } else {
      ball[2].alive=true;
      ball[2].x=ball[0].x;
      ball[2].y=ball[0].y;
      ball[2].px=ball[0].px;
      ball[2].py=ball[0].py;
      float angle=random(radians(210), radians(330));
      ball[2].spdx=cos(angle)*ball[2].speed;
      ball[2].spdy=sin(angle)*ball[2].speed;
    }
  }

  void H() {
    csEffectReturn();
    hCount=millis();
    hState=true;
    //早くするアイテム
  }

  void I() {
    csEffectReturn();
    iCount=millis();
    iState=true;
    //遅くするアイテム
  }

  void speedChange() {
    if (millis()>changeCount) {

      if ((hCount>iCount) &&(hState)) {
        if (hCount+changeCount>millis()) {
          speedUp();
        } else {
          csEffectReturn();
          hState=false;
        }
      } else if (iState) {
        if (iCount+changeCount>millis()) {
          speedDown();
        } else {
          csEffectReturn();
          iState=false;
        }
      } else {
        if ( (hCount+changeCount<millis())&&(millis()<hCount+changeCount*2) || (iCount+changeCount<millis())&&(millis()<iCount+changeCount*2)) {
          speedReturn();
        }
      }
    }
  }


  void speedUp() {
    for (int z=0; z<3; z++) {
      if (ball[z].speed<SPEED+m1_5) {
        csEffect(true, z, true);
        timing[z]=false;
      } else if (!timing[z]) {
        t[z]=0;
        timing[z]=true;
      }
    }
  }
  void speedDown() {
    for (int z=0; z<3; z++) {
      if (ball[z].speed>SPEED-m1_5) {
        csEffect(false, z, true);
        timing[z]=false;
      } else if (!timing[z]) {
        t[z]=0;
        timing[z]=true;
      }
    }
  }
  void speedReturn() {
    for (int z=0; z<3; z++) {
      if (ball[z].speed<SPEED) {
        csEffect(true, z, false);
      } else if (ball[z].speed>SPEED) {
        csEffect(false, z, false);
      }
    }
  }

  void csEffectReturn() {
    px=new float[3][num];
    py=new float[3][num];
    for (int z=0; z<3; z++) {
      t[z]=0;
    }
    speedChange=true;
    speedReturn=true;
  }

  void csEffect(boolean j, int z, boolean m) {

    if (j) {
      ball[z].speed+=m0_01;
      if (m) {
        if (speedChange) {
          sound.accel.play(0);
          speedChange=false;
        }
      } else {
        if (speedReturn) {
          sound.accel.play(0);
          speedReturn=false;
        }
      }
    } else {
      if (m) {
        if (speedChange) {
          sound.decel.play(0);
          speedChange=false;
        }
      } else {
        if (speedReturn) {
          sound.decel.play(0);
          speedReturn=false;
        }
      }
      ball[z].speed-=m0_01;
    }

    pushMatrix();
    translate(ball[z].px, ball[z].py);
    ball[z].spdx=cos(atan2(ball[z].y-ball[z].py, ball[z].x-ball[z].px))*ball[z].speed;
    ball[z].spdy=sin(atan2(ball[z].y-ball[z].py, ball[z].x-ball[z].px))*ball[z].speed;
    popMatrix();

    for (int i=0; i<num; i++) {
      col[z][i]-=5;
      fill(255, col[z][i]);
      noStroke();

      pushMatrix();
      translate(px[z][i], py[z][i]);
      rotate(ang[z][i]);
      if (j) {
        rotate(PI);
      }
      if (ball[z].alive) {
        triangle(m5, 0, -m5, -m10, -m5, m10);
      }
      popMatrix();
    }

    if (frameCount%10==0) {
      if (t[z]<num) {
        px[z][t[z]]=ball[z].x;
        py[z][t[z]]=ball[z].y;
        col[z][t[z]]=255;
        ang[z][t[z]]=atan2(ball[z].y-ball[z].py, ball[z].x-ball[z].px);
        t[z]++;
      }
    }
  }
}

void mouseReleased() {
  if (wiiuse) {
    if (mouseButton==CENTER) {
      itemEffect.beamMake();
    }
  } else {
    itemEffect.beamMake();
  }
  //マウスがクリックされたとき、ビームの生成
}
