void setup() {
  //fullScreen();
  fullScreen(2);
  //size(800,400);

  frameRate(60);
  noSmooth();
  magn=height/1000.0;
  newWidth=1005.0*magn;
  margin=(width-newWidth)/2.0;
  background(0);

  sound=new Sound();
  sound.minim=new Minim(this);

  breaker=new Breaker();
  definition();
}

void draw() {

  SPadjust=60.0/frameRate;

  if (frameCount%5==0)println(frameRate);

  switch(Control) {
  case -2:
    strWin.selectWindow();
    break;

  case -1:
    breaker.remake();
    Control=0;
    break;

  case 0:
    strWin.startWindow();
    break;

  case 1:
    background(0);

    breaker.move();
    breaker.reflection();
    breaker.display();

    endWin.gameOverControl();
    score.endControl();

    break;

  case 2:
    endWin.endWindow();
    break;

  case 3:
    endWin.gameOver();
    break;
  }
  exitButton();
}
