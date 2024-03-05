EndWindow endWin;

class EndWindow {

  float GOC=0;
  float GOMC=255;

  boolean gameOverSound=true;
  boolean Loser=true;

  int endTime;

  boolean don1=true;
  boolean don2=true;
  boolean cymbal=true;

  boolean clear=true;
  boolean highScore=true;
  boolean sharuru=true;
  boolean eikou=true;

  int wait;

  float d=0;
  int t=2000;

  void remake() {
    GOC=0;
    GOMC=255;

    gameOverSound=true;
    Loser=true;

    don1=true;
    don2=true;
    cymbal=true;

    clear=true;
    highScore=true;
    sharuru=true;
    eikou=true;

    d=0;
    t=2000;
  }

  void gameOver() {
    colorMode(RGB);
    fill(0, GOC);
    rectMode(CORNER);
    rect(0, 0, width, height);

    if (GOC<120) {
      GOC+=0.5;
    } else {
      if (gameOverSound) {
        if (!mode)sound.gameOver.play(0);
        if (mode)sound.p_gameOver.play(0);
        gameOverSound=false;
      }

      fill(255);
      textAlign(CENTER, CENTER);
      textFont(scoreFont);
      textSize(130.0*magn);
      text("GAME OVER", width/2, height/2-50.0*magn);

      if (GOMC>0) {
        GOMC-=1.0;
      }
      noStroke();
      fill(0, GOMC);
      rectMode(CORNER);
      rect(0, 0, width, height);

      if (GOMC<=0.0) {
        if (Loser) {
          delay(t);
          sound.loser.play(0);
          Loser=false;
        }
        if (!sound.loser.isPlaying()) {
          t=0;
          Loser=true;
        }

        if (wiiuse) {
          if ((mousePressed)&&(mouseButton==CENTER)) {
            ends();
          }
        }

        if ((width/2-200.0*magn<mouseX)&&(mouseX<width/2.0+200.0*magn)&&(height/2.0+150.0*magn<mouseY)&&(mouseY<height/2.0+250.0*magn)) {
          colorMode(HSB);
          fill(0, 200, 200);
          if (wiiuse) {
          } else {
            if (mousePressed) {
              ends();
            }
          }
        } else {
          fill(255);
        }

        textSize(80.0*magn);

        if (wiiuse) {
          fill(255);

          textAlign(CENTER, CENTER);
          textSize(ts(d));
          text("p", width/2.0-180.0*magn, height/2.0+190.0*magn);
          textSize(ts(d-20));
          text("r", width/2.0-120.0*magn, height/2.0+190.0*magn);
          textSize(ts(d-40));
          text("e", width/2.0-60.0*magn, height/2.0+190.0*magn);
          textSize(ts(d-60));
          text("s", width/2.0, height/2.0+190.0*magn);//中央
          textSize(ts(d-80));
          text("s", width/2.0+60.0*magn, height/2.0+190.0*magn);


          textSize(ts(d-100));
          text("2", width/2.0+180.0*magn, height/2.0+190.0*magn);

          d+=3.0;
        } else {
          rectMode(CENTER);
          stroke(1);
          rect(width/2.0, height/2.0+200.0*magn, 400.0*magn, 100.0*magn);
          if ((width/2-200.0*magn<mouseX)&&(mouseX<width/2.0+200.0*magn)&&(height/2.0+150.0*magn<mouseY)&&(mouseY<height/2.0+250.0*magn)) {
            colorMode(HSB);
            fill(100, 200, 200);
          } else {
            fill(0);
          }
          text("retry?", width/2.0, height/2.0+190.0*magn);
          //リトライボタン
        }
      }
    }
  }

  void ends() {
    sound.loser.pause();
    sound.click.play(0);
    delay(500);
    State=0;
    Control=-1;
  }

  void gameOverControl() {
    if (undWin.life==0) {
      itemEffect.itemReturn();
      Control=3;
      r.write(path, score.num);
      sound.pause();
    }
    //ゲームオーバーの判定
  }

  void endWindow() {
    colorMode(HSB);
    background(90, 200, 150);

    textAlign(CENTER, CENTER);
    if (millis()-endTime>1000) {
      if (don1) {
        sound.drum.play(0);
        don1=false;
      }
      colorMode(RGB);
      fill(0);
      textFont(scoreFont);
      textSize(70.0*magn);
      text("BOUNUS "+score.bonus, width/2, height/2-50.0*magn);
      if (millis()-endTime>3000) {
        if (don2) {
          sound.drum.play(0);
          don2=false;
        }
        text("SCORE  "+score.num, width/2, height/2+30.0*magn);
        if (millis()-endTime>4500) {
          if (cymbal) {
            sound.cymbal.play(0);
            cymbal=false;
          }
          textSize(100.0*magn);
          text("TOTAL "+score.total, width/2, height/2+150.0*magn);

          if (millis()-endTime>7500) {

            colorMode(HSB);
            fill(floor(millis()/20)%256, 200, 200);
            textFont(scoreFont);

            if (score.top==score.total) {
              if (highScore) {
                if (!mode)sound.highScore.play(0);
                if (mode)sound.p_highScore.play(0);
                highScore=false;
              }

              textFont(font2);
              textSize(130.0*magn);
              text("HIGH SCORE!!!", width/2, height/2-200.0*magn);
              fill(245, 200, 200);
              textSize(100.0*magn);
              text("Congratulations!!", width/2, height/2-350.0*magn);
              if (!mode)wait=20000;
              if (mode)wait=24000;
            } else {
              if (clear) {
                if (!mode)sound.clear.play(0);
                if (mode)sound.p_clear.play(0);
                clear=false;
              }

              textSize(170.0*magn);
              text("Cleared !!", width/2, height/2-250.0*magn);
              wait=12000;
            }

            if (millis()-endTime>wait) {
              if (clear) {
                if (eikou) {
                  sound.eikou.play(0);
                  eikou=false;
                } else if (!sound.eikou.isPlaying()) {
                  eikou=true;
                }
              }
              if (highScore) {
                if (sharuru) {
                  sound.sharuru.play(0);
                  sharuru=false;
                } else if (!sound.sharuru.isPlaying()) {
                  sharuru=true;
                }
              }
              if (wiiuse) {
                if ((mousePressed)&&(mouseButton==CENTER)) {
                  returns();
                }
              }
              if ((width/2-200.0*magn<mouseX)&&(mouseX<width/2.0+200.0*magn)&&(height/2.0+300.0*magn<mouseY)&&(mouseY<height/2.0+400.0*magn)) {
                colorMode(HSB);
                fill(35, 255, 255);
                if (wiiuse) {
                } else {
                  if (mousePressed) {
                    returns();
                  }
                }
              } else {
                colorMode(HSB);
                fill(250, 100, 150);
              }
              textSize(80.0*magn);

              if (wiiuse) {
                fill(0);
                textAlign(CENTER, CENTER);
                textSize(ts(d));
                text("p", width/2.0-180.0*magn, height/2.0+340.0*magn);
                textSize(ts(d-20));
                text("r", width/2.0-120.0*magn, height/2.0+340.0*magn);
                textSize(ts(d-40));
                text("e", width/2.0-60.0*magn, height/2.0+340.0*magn);
                textSize(ts(d-60));
                text("s", width/2.0, height/2.0+340.0*magn);//中央
                textSize(ts(d-80));
                text("s", width/2.0+60.0*magn, height/2.0+340.0*magn);


                textSize(ts(d-100));
                text("2", width/2.0+180.0*magn, height/2.0+340.0*magn);

                d+=3.0;
              } else {
                rectMode(CENTER);
                stroke(1);
                rect(width/2.0, height/2.0+350.0*magn, 400.0*magn, 100.0*magn);

                textSize(80.0*magn);
                if ((width/2-200.0*magn<mouseX)&&(mouseX<width/2.0+200.0*magn)&&(height/2.0+300.0*magn<mouseY)&&(mouseY<height/2.0+400.0*magn)) {
                  colorMode(HSB);
                  fill(150, 255, 255);
                } else {
                  fill(0);
                }
                text("retry?", width/2.0, height/2.0+340.0*magn);
                //リトライボタン
              }
            }
          }
        }
      }
    }
    //終了時の表示画面
  }

  float ts(float _d) {
    float s;

    s=constrain(sin(radians(_d))*150.0*magn, 100.0*magn, 200.0*magn);

    return s;
  }

  void returns() {
    sound.eikou.pause();
    sound.sharuru.pause();
    sound.click.play(0);
    delay(500);
    State=0;
    Control= -1;
  }
}
