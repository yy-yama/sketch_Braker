StartWindow strWin;

class StartWindow {
  float dia;
  StartWindow() {
    dia=200.0*magn;
  }

  void selectWindow() {
    background(0);
    noStroke();
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(m40);

    float d1=dist(mouseX, mouseY, width/2.0-300.0*magn, height/2.0);
    float d2=dist(mouseX, mouseY, width/2.0+300.0*magn, height/2.0);
    if (d1<100.0*magn) {
      fill(255, 255, 0);
      if (mousePressed) {
        wiiuse=true;
        noCursor();

        Control=-1;
        delay(500);
      }
    } else {
      fill(255);
    }
    ellipse(width/2.0-300.0*magn, height/2.0, dia, dia);

    if (d2<100.0*magn) {
      fill(255, 255, 0);
      if (mousePressed) {
        wiiuse=false;
        Control=-1;
        delay(500);
      }
    } else {
      fill(255);
    }
    ellipse(width/2.0+300.0*magn, height/2.0, dia, dia);

    fill(0);
    text("Wii Mode", width/2.0-300.0*magn, height/2.0);
    text("PC Mode", width/2.0+300.0*magn, height/2.0);
  }
  void startWindow() {
    colorMode(HSB);
    background(125, 100, 200);
    textAlign(CENTER, CENTER);
    textFont(font);
    noStroke();

    if (wiiuse) {
      button2();
    } else {
      button1();
    }

    textFont(font);
    if (frameCount%200<=100) {
      textSize(230.0*magn);
      fill(255);
    } else {
      textSize(250.0*magn);
      colorMode(RGB);
      fill(255, 255, 0);
    }
    text("Breaker", width/2.0, 200.0*magn);
    //タイトル表示

    colorMode(RGB);
    fill(0);
    textFont(scoreFont);
    textSize(75.0*magn);
    text("HIGH SCORE : "+score.high, width/2.0, height/2.0+200.0*magn);

    //ハイスコア表示

    //スタート画面の表示
  }

  void soundReturn() {
    if (!sound.asunoyozora.isPlaying()) {
      sound.asunoyozora.play(0);
    }
  }

  void button1() {
    if ((width/2-200.0*magn<mouseX)&&(mouseX<width/2.0+200.0*magn)&&(height/2.0-50.0*magn<mouseY)&&(mouseY<height/2.0+50.0*magn)) {
      colorMode(HSB);
      fill(100, 200, 200);
      if (mousePressed) {
        if (keyPressed&&(key=='p')) {
          mode=true;
          sound.p_click.play(0);
          click();
          delay(4000);
          sound.p_tema.play(0);
          return;
        } else {
          sound.click.play(0);
          click();
          sound.tettete.play(0);
          return;
        }
        //ボタンが押されたら開始
      }
    } else {
      fill(255);
    }
    //ボタン上にカーソルがあるかどうか判定

    rectMode(CENTER);
    stroke(0);
    strokeWeight(1*magn);
    rect(width/2.0, height/2.0, 400.0*magn, 100.0*magn);
    //ボタンの描画

    textFont(font);
    textSize(80.0*magn);
    if ((width/2-200.0*magn<mouseX)&&(mouseX<width/2.0+200.0*magn)&&(height/2.0-50.0*magn<mouseY)&&(mouseY<height/2.0+50.0*magn)) {
      colorMode(HSB);
      fill(0, 200, 200);
    } else {
      fill(0);
    }
    text("Start !", width/2.0, height/2.0-10.0*magn);
    //ボタンの名前表示

    //スタートボタン

    soundReturn();
  }

  boolean upButton_selected=true;
  boolean downButton_selected=false;

  void button2() {

    if (wiiUse.buttonSelect()==1) {
      upButton_selected=true;
      downButton_selected=false;
    } else if (wiiUse.buttonSelect()==2) {
      upButton_selected=false;
      downButton_selected=true;
    }
    colorMode(RGB);
    fill(255);
    rectMode(CENTER);
    textFont(font);

    if (upButton_selected) {
      stroke(255, 0, 0);
      strokeWeight(20.0*magn);
      if (keyPressed&&(key==ENTER)) {
        mode=true;
        wii=true;
        sound.p_click.play(0);
        click();
        delay(4000);
        sound.p_tema.play(0);
        return;
      } 

      if ((mousePressed)&&(mouseButton==CENTER)) {
        wii=true;
        sound.click.play(0);
        click();
        sound.tettete.play(0);
        return;
      }
    } else {
      stroke(0);
      strokeWeight(1*magn);
    }
    rect(width/2.0, height/2.0-70.0*magn, 400.0*magn, 100.0*magn);

    if (downButton_selected) {
      stroke(255, 0, 0);
      strokeWeight(20.0*magn);
      if (keyPressed&&(key==ENTER)) {
        mode=true;
        wii=false;
        sound.p_click.play(0);
        click();
        delay(4000);
        sound.p_tema.play(0);
        return;
      } 
      if ((mousePressed)&&(mouseButton==CENTER)) {
        wii=false;
        sound.click.play(0);
        click();
        sound.tettete.play(0);
        return;
      }
    } else {
      stroke(0);
      strokeWeight(1*magn);
    }
    rect(width/2.0, height/2.0+70.0*magn, 400.0*magn, 100.0*magn);

    fill(0);
    noStroke();
    textFont(scoreFont);
    textSize(50.0*magn);
    text("Slope Mode", width/2.0, height/2.0-60.0*magn);
    text("Button Mode", width/2.0, height/2.0+80.0*magn);

    soundReturn();
  }

  void click() {
    Control=1;
    sound.asunoyozora.pause();

    delay(500);
    State=0;
  }
}
