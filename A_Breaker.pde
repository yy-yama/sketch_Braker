Breaker breaker;

class Breaker {
  Breaker() {

    bar=new Bar();
    invincible=new Invincible();
    box=new Box();
    item=new Item();
    itemDisp=new ItemDisplay();
    itemEffect=new ItemEffect();
    ball[0]=new Ball();
    ball[1]=new Ball();
    ball[2]=new Ball();
    strWin=new StartWindow();
    undWin=new UnderWindow();
    endWin=new EndWindow();
    hit=new Hit();
    score=new Score();
    coin=new Coin();
    breakBlock=new BreakBlock();   
    sound.make();
    wiiUse=new WiiUse();
    p=new PopTeam();

    font=createFont("IndieFlower.ttf", fontSize);
    scoreFont=createFont("Montserrat-Black.ttf", fontSize);
    font2=createFont("Muller-ExtraBold-DEMO.ttf", fontSize);
  }
  void remake() {
    SPEED=6.5*magn;
    
    if (wiiuse) {
      above=20.0*magn;
    } else {
      above=0;
    }
    bar.remake();
    invincible.remake();
    box.remake();
    itemEffect.remake();
    ball[0].remake();
    ball[1].remake();    
    ball[2].remake();
    item.remake();
    undWin.remake();
    endWin.remake();
    hit.remake();
    score.remake();
    sound.end();
    sound.make();
    item.itemIn();
    box.blockIn();
    p.remake();

    mode=false;

    score.num=0;

    newMouseX=width/2;

    State=0;
    end=1;
    
    coin.delate();

    ball[0].alive=true;
    ball[0].Random();

    sound.asunoyozora.play(0);
  }
  void move() {
    wiiUse.barMove();
    ball[0].move();
    ball[1].move();
    ball[2].move();
    hit.move();
    itemEffect.move();
  }
  void display() {
    bar.display();
    if (mode)box.display();
    ball[0].display();
    ball[1].display();
    ball[2].display();
    if (!mode)box.display();
    hit.breaking();
    item.display();
    coin.display();
    itemEffect.beamDisplay();
    undWin.scoreDisplay();
    undWin.lifeDisplay();
    undWin.timeDisplay();

    stroke(255);
    strokeWeight(5.0*magn);
    line(margin, 0, margin, height);
    line(margin+newWidth, 0, margin+newWidth, height);

    if (wiiuse) {
      line(margin, above, margin+newWidth, above);
    }

    fill(0);
    noStroke();
    rectMode(CORNER);
    rect(0, 0, margin, height);
    rect(margin+newWidth, 0, margin, height);
    if (wiiuse) {
      rect(0, 0, width, above);
    }
  }
  void reflection() {
    ball[0].wallReflection();
    ball[1].wallReflection();
    ball[2].wallReflection();
    hit.barReflection();
    hit.ballHelp();
    hit.blockReflection();
  }
}
