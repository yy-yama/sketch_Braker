Hit hit;

class Hit {
  float Angle;

  float[] cornerTX=new float[5];
  float[] cornerTY=new float[5];

  boolean[]cross=new boolean[5];

  float []boxCornerX=new float[4];
  float []boxCornerY=new float[4];
  //ブロック四隅の座標
  float []boxCornerAngle=new float[4];
  //ブロック角反射角
  float boxCornerR;
  //ブロック角の当たり判定の広さ
  float []boxCornerJudge=new float[4];
  //ブロック角当たり判定

  boolean firstStart=true;
  int startTime;

  boolean hitting;

  Hit() {
    boxCornerR=1.0*magn;
  }

  void remake() {
    firstStart=true;
  }

  void mouseChange() {
    if (wiiuse) {
      if (wii) {
        newMouseX=map(-mouseY, -height, 0, margin+bar.w/2.0, margin+newWidth-bar.w/2.0);
      } else {
      }
    } else {
      newMouseX=mouseX;
      if (mouseX<margin+bar.w/2.0) {
        newMouseX=margin+bar.w/2.0;
      }
      if (margin+newWidth-bar.w/2.0<mouseX) {
        newMouseX=margin+newWidth-bar.w/2.0;
      }
    }
  }

  void move() {
    if (wiiuse) {
      if ((mousePressed)&&(mouseButton==CENTER)) {
        moves();
      }
    } else {
      if (mousePressed) {
        moves();
      }
    }
    //ボールの運動
  }

  void moves() {
    if (firstStart) {
      firstStart=false;
      startTime=millis();
    }
    State=1;
    for (int z=0; z<3; z++) {
      ball[z].magnet=false;
    }
  }

  void barReflection() {

    for (int z=0; z<3; z++) {
      if (ball[z].alive) {
        mouseChange();

        if (dist(ball[z].x, ball[z].y, newMouseX, bar.y)<m200) {

          if ((ball[z].x>newMouseX-bar.w/2.0)&&(ball[z].x<newMouseX+bar.w/2.0)&&(ball[z].y+ball[z].dia/2.0>bar.y-bar.h/2.0)&&(ball[z].y+ball[z].dia/2.0<bar.y+bar.h/2.0)) {
            ball[z].position=(ball[z].x-newMouseX)/(bar.w/2.0);
            Angle=angle(ball[z].position*bar.w/2.0, z);
            ball[z].spdx=-cos(Angle)*ball[z].speed;
            ball[z].spdy=-sin(Angle)*ball[z].speed;

            ball[z].notContinueX=false;
            ball[z].notContinueY=false;

            score.seriesPoint[z]=0;
            bar.times++;
            if (item.D) {
              sound.magnet.play(0);
            } else {
              if (!(State==0)) {
                sound.pingpong.play(0);
              }
            }
            if (item.D) {
              ball[z].magnet=true;
            } else {
              ball[z].magnet=false;
            }
          }
        }
      }
    }
    //バ－に当たったとき、跳ね返り角度の調整
  }

  float angle(float length, int z) {
    float accel=map(length, -bar.w/2, bar.w/2, ball[z].limitAngle, PI-ball[z].limitAngle);
    return(accel);
  }

  void blockReflection() {
    end=0;
    for (int i=0; i<box.NUM; i++) {

      if (box.state[i]==0) {

        end=1;
        hitting=false;

        for (int z=0; z<3; z++) {

          if (dist(ball[z].x, ball[z].y, box.x[i], box.y[i])<m200) {

            boxCornerX[0]=box.x[i]+m1;
            boxCornerY[0]=box.y[i]+m1;

            boxCornerX[1]=box.x[i]+box.w-m1;
            boxCornerY[1]=box.y[i]+m1;

            boxCornerX[2]=box.x[i]+m1;
            boxCornerY[2]=box.y[i]+box.h-m1;

            boxCornerX[3]=box.x[i]+box.w-m1;
            boxCornerY[3]=box.y[i]+box.h-m1;

            boxCornerAngle[0]=constrain(map(boxCornerX[0]-ball[z].x, 0, boxCornerR+ball[z].dia/2.0, radians(260), radians(190)), radians(260), radians(190));
            boxCornerAngle[1]=constrain(map(ball[z].x-boxCornerX[1], 0, boxCornerR+ball[z].dia/2.0, radians(280), radians(350)), radians(280), radians(350));
            boxCornerAngle[2]=constrain(map(boxCornerX[2]-ball[z].x, 0, boxCornerR+ball[z].dia/2.0, radians(100), radians(170)), radians(100), radians(170));
            boxCornerAngle[3]=constrain(map(ball[z].x-boxCornerX[3], 0, boxCornerR+ball[z].dia/2.0, radians(80), radians(10)), radians(80), radians(10));

            for (int j=0; j<4; j++) {
              //boxCornerJudge[j]=sq(boxCornerX[j]-ball[z].x)+sq(boxCornerY[j]-ball[z].y)-sq(boxCornerR+ball[z].dia/2.0);

              boxCornerJudge[j]=dist(boxCornerX[j], boxCornerY[j], ball[z].x, ball[z].y)-(boxCornerR+ball[z].dia/2.0);

              if (boxCornerJudge[j]<0) {
                if (!itemEffect.inv) { 
                  ball[z].spdx=cos(boxCornerAngle[j])*ball[z].speed;
                  ball[z].spdy=sin(boxCornerAngle[j])*ball[z].speed;
                }
                breakBlock.make(i, box.x[i], box.y[i], box.col[i]);
                hit(i, z);
                hitting=true;
              }
              //角の当たり判定
            }

            cornerTX[0]=box.x[i];
            cornerTY[0]=box.y[i];

            cornerTX[1]=cornerTX[0]+box.w;
            cornerTY[1]=cornerTY[0];

            cornerTX[2]=cornerTX[0]+box.w;
            cornerTY[2]=cornerTY[0]+box.h;

            cornerTX[3]=cornerTX[0];
            cornerTY[3]=cornerTY[0]+box.h;

            cornerTX[4]=cornerTX[0];
            cornerTY[4]=cornerTY[0];

            if (hitting) {
            } else {

              for (int j=0; j<4; j++) {
                cross[j]=judge(ball[z].x, ball[z].y, ball[z].px, ball[z].py, cornerTX[j], cornerTY[j], cornerTX[j+1], cornerTY[j+1]);
              }

              cross[4]=cross[0];

              for (int j=0; j<4; j++) {
                if (cross[j]&&cross[j+1]) {
                  if (!itemEffect.inv) { 
                    inter(cornerTX[j+1], cornerTY[j+1], z);
                  }
                  breakBlock.make(i, box.x[i], box.y[i], box.col[i]);
                  hit(i, z);
                  hitting=true;
                }
              }
            } 
            if (hitting) {
            } else if (cross[0]||cross[2]) {
              if (!itemEffect.inv) { 
                ball[z].spdy=-ball[z].spdy;
              }
              breakBlock.make(i, box.x[i], box.y[i], box.col[i]);
              hit(i, z);
              hitting=true;
            } else if (cross[1]||cross[3]) {
              if (!itemEffect.inv) { 
                ball[z].spdx=-ball[z].spdx;
              }
              breakBlock.make(i, box.x[i], box.y[i], box.col[i]);
              hit(i, z);
              hitting=true;
            }
          }
        }

        if (hitting) {
        } else {
          for (int j=0; j<itemEffect.beamNum; j++) {
            if ((box.y[i]+boxCornerR<itemEffect.beamY[j])&&(itemEffect.beamY[j]<box.y[i]+box.h-boxCornerR)&&(box.x[i]+boxCornerR<itemEffect.beamX[j])&&(itemEffect.beamX[j]<box.x[i]+box.w-boxCornerR)) {
              breakBlock.make(i, box.x[i], box.y[i], box.col[i]);
              box.state[i]=1;
              score.num+=10;

              //item.part(i);//デバッグ用

              itemEffect.beamState[j]=false;
              sound.broken.play(0);
              return;
              //ビームによる破壊
            }
          }
        }
      }
    }
    //ブロックとの当たり判定
  }

  boolean judge(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
    float tc, td, ta, tb;

    ta=(x1-x2)*(y3-y1)+(y1-y2)*(x1-x3);
    tb=(x1-x2)*(y4-y1)+(y1-y2)*(x1-x4);

    tc=(x3-x4)*(y1-y3)+(y3-y4)*(x3-x1);
    td=(x3-x4)*(y2-y3)+(y3-y4)*(x3-x2);

    if ((ta*tb<0)&&(tc*td<0)) {
      return true;
    } else {
      return false;
    }
  }

  void inter(float cx, float cy, int z) {
    float a, b, ix, iy, jx, jy;
    float x1=ball[z].x;
    float y1=ball[z].y;
    float x2=ball[z].px;
    float y2=ball[z].py;
    float d1, d2;

    a=(y2-y1)/(x2-x1);
    b=y1-a*x1;

    iy=cy;
    ix=(iy-b)/a;

    jx=cx;
    jy=a*jx+b;

    d1=dist(ball[z].px, ball[z].py, ix, iy);
    d2=dist(ball[z].px, ball[z].py, jx, jy);

    if (d1<d2) {
      ball[z].spdy=-ball[z].spdy;
    } else {
      ball[z].spdx=-ball[z].spdx;
    }
  }

  void hit(int i, int z) {
    box.state[i]=1;
    score.num+=10;
    score.num+=score.seriesPoint[z];
    if (!itemEffect.inv) { 
      score.seriesPoint[z]+=10;
      item.part(i);
    }
    sound.broken.play(0);

    ball[z].notContinueX=false;
    ball[z].notContinueY=false;
    //item.part(i);
  }

  void breaking() {
    for (int j=0; j<box.NUM; j++) {
      if (box.state[j]==1) {
        if (mode) {
          breakBlock.modeDisplay(j);
        } else {
          breakBlock.display(j, box.col[j]);
        }
      }
    }
  }

  void ballHelp() {
    for (int z=0; z<3; z++) {
      if (ball[z].y>height) {
        if (!mode)sound.falling.play(0);
        if (mode)sound.p_falling.play(0);
        /*
        ボール落ちる→１か２→そのまま無視
         ０→1か2の情報を0にする。
         */
        ball[z].alive=false;

        ball[z].y=-200;
        ball[z].py=-200;

        if (z==0) {
          if (ball[1].alive) {
            replace(1);
          } else if (ball[2].alive) {
            replace(2);
          }
        }
        if (!ball[0].alive&&!ball[1].alive&&!ball[2].alive) {
          State=0;
          for (int t=0; t<3; t++) {
            hit.mouseChange();
            ball[t].x=newMouseX;
            ball[t].y=bar.y;
            ball[t].px=newMouseX;
            ball[t].py=bar.y;

            ball[t].Random();
            ball[t].speed=SPEED;

            score.seriesPoint[t]=0;
          }
          for (int i=0; i<item.num; i++) {
            item.state[i]=false;
          }
          coin.delate();

          itemEffect.C();
          undWin.life--;

          sound.invincible.pause();
          sound.accel.pause();
          sound.decel.pause();

          itemEffect.hState=false;
          itemEffect.iState=false;

          itemEffect.inv=false;

          ball[0].alive=true;
          return;
        }
      }
    }
    //ボール落下時、バー上に戻す
  }

  void replace(int k) {
    ball[0].x=ball[k].x;
    ball[0].y=ball[k].y;
    ball[0].px=ball[k].px;
    ball[0].py=ball[k].py;
    ball[0].spdx=ball[k].spdx;
    ball[0].spdy=ball[k].spdy;
    ball[0].magnet=ball[k].magnet;
    ball[0].notContinueX=ball[k].notContinueX;
    ball[0].notContinueY=ball[k].notContinueY;
    ball[0].position=ball[k].position;
    ball[0].alive=true;
    ball[k].alive=false;
  }
}
