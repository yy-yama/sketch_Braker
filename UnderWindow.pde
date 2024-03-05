UnderWindow undWin;

class UnderWindow {
  float scoreHeight;

  int life;

  float[]heartX=new float[360];
  float[]heartY=new float[360];

  UnderWindow() {
  }

  void remake() {
    life=LIFENUM;
    if (wiiuse) {
      scoreHeight=height-70.0*magn;
    } else {
      scoreHeight=height-50.0*magn;
    }
    float R=1.0*magn;
    for (int t = 0; t < 360; t++) {
      heartX[t] = R * (16 * sin(radians(t)) * sin(radians(t)) * sin(radians(t)))+margin+newWidth-200.0*magn;
      heartY[t] = (-1) * R * (13 * cos(radians(t)) - 5 * cos(radians(2 * t))- 2 * cos(radians(3 * t)) - cos(radians(4 * t)))+scoreHeight;
    }
  }

  void scoreDisplay() {
    textAlign(CORNER, CENTER);
    textFont(scoreFont);
    textSize(m40);
    colorMode(RGB);
    fill(255);
    text("score : "+score.num, margin+m50, scoreHeight);

    //スコアの表示
  }

  void lifeDisplay() {
    textAlign(CORNER, CENTER);
    textFont(scoreFont);
    textSize(m40);
    colorMode(RGB);
    fill(255);
    text("LIFE", margin+newWidth-m320, scoreHeight);

    noStroke();
    fill(255, 0, 0);
    strokeJoin(ROUND);

    for (int LN=0; LN<life; LN++) {
      beginShape();
      for (int t = 0; t < 360; t++) {
        vertex(heartX[t]+LN*m40, heartY[t]);
      }
      endShape(CLOSE);
    }
    //残機表示
  }

  void timeDisplay() {
    textAlign(CORNER, CENTER);
    textFont(scoreFont);
    textSize(m40);
    colorMode(RGB);
    fill(255);
    if (hit.firstStart) {
      text("00 : 00 : 00", width/2.0-m100, scoreHeight);
    } else {
      String M=nf(Minute(0), 2);
      String S=nf(Second(0), 2);
      String T=nf(tenMillisSecond(0), 2);
      text(M+" : "+S+" : "+T, width/2.0-m100, scoreHeight);
    }
    //時間表示

    soundReturn();
  }

  void soundReturn() {
    if ((!mode)&&(!sound.tettete.isPlaying())) {
      sound.tettete.play(0);
    }
    if ((mode)&&(!sound.p_tema.isPlaying())) {
      sound.p_tema.play(0);
    }
  }

  int tenMillisSecond(int k) {
    int t=floor((millis()-hit.startTime)/10)%100;
    return t;
  }

  int Second(int k) {
    int s=floor((millis()-hit.startTime)/1000)%60;
    return s;
  }

  int Minute(int k) {
    int m=floor((millis()-hit.startTime)/60000);
    return m;
  }
}
