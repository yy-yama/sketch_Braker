PopTeam p;

class PopTeam {
  PImage pop1, pop2, pop3, girl;
  PImage back;

  int w;
  int h;

  color[][]backColor;

  float ivalW, ivalH, setX, setY;

  float space;

  float lit=0.2;

  PopTeam() {

    pop1=loadImage("popBlock1.jpg");
    pop2=loadImage("popBlock2.jpg");
    pop3=loadImage("popBlock3.jpg");
    
    girl=loadImage("girl.jpg");

    w=floor((box.w+box.space)*(9)+(box.w));
    h=floor((14)*(box.h+box.space)+box.h);

    backColor=new color[box.NUM][19*5];

    ivalW=box.w+box.space;
    ivalH=box.h+box.space;

    space=box.space/5.0*1.5;

    lit=lit*magn;
  }

  void remake() {
    setX=margin+box.space;
    setY=above+box.space;

    float ran=random(20);
    if (ran<7) {
      back=pop1;
    } else if (ran<13) {
      back=pop2;
    } else if (ran<19) {
      back=pop3;
    } else {
      back=girl;
    }

    back.resize(w, h);
    for (int k=0; k<box.NUM; k++) {
      for (int i=0; i<19*5; i++) {
        backColor[k][i]=back.get(int((box.x[k]-margin-space)+(i%19)*breakBlock.oneSide), int((box.y[k]-above-space)+(i/19)*breakBlock.oneSide));
      }
    }
  }


  void display() {
    image(back, setX, setY);

    rectMode(CORNER);
    noStroke();

    for (float i=0.0; i<9.0; i++) {
      fill(0);
      rect(i*ivalW+setX+box.w+space, setY, m2, h);//縦線
    }
    for (float i=0.0; i<14.0; i++) {
      rect(setX, i*ivalH+setY+box.h+space, w, m2);//横線
    }

    rect(setX-lit, setY-lit, ((2.0)*box.w+(1.0)*box.space+space+lit), ((2.0)*box.h+(1.0)*box.space+space+lit));
    rect(setX-lit, setY-lit, ((1.0)*box.w+(0.0)*box.space+space+lit), ((4.0)*box.h+(3.0)*box.space+space+lit));

    rect(setX+w+lit, setY-lit, -((2.0)*box.w+(1.0)*box.space+space+lit), ((2.0)*box.h+(1.0)*box.space+space+lit));
    rect(setX+w+lit, setY-lit, -((1.0)*box.w+(0.0)*box.space+space+lit), ((4.0)*box.h+(3.0)*box.space+space+lit));

    rect(setX-lit, setY+h+lit, ((2.0)*box.w+(1.0)*box.space+space+lit), -((2.0)*box.h+(1.0)*box.space+space+lit));
    rect(setX-lit, setY+h+lit, ((1.0)*box.w+(0.0)*box.space+space+lit), -((4.0)*box.h+(3.0)*box.space+space+lit));

    rect(setX+w+lit, setY+h+lit, -((2.0)*box.w+(1.0)*box.space+space+lit), -((2.0)*box.h+(1.0)*box.space+space+lit));
    rect(setX+w+lit, setY+h+lit, -((1.0)*box.w+(0.0)*box.space+space+lit), -((4.0)*box.h+(3.0)*box.space+space+lit));
  }

  void hide(float x, float y) {
    noStroke();
    fill(0);

    rect(x-space-lit, y-space-lit*10, ivalW+lit*2, ivalH+lit*10);
  }
}
