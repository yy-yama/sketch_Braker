Item item;

class Item {
  int num=27;

  float[]boxRNum;
  int[]boxOrder;

  int []kind=new int[num];
  float[] x=new float[num];
  float[] y=new float[num];
  float[] py=new float[num];
  boolean []state=new boolean[num];
  boolean A, B, C, D, E, F, G, H, I=false;

  int PSecond;

  Item() {
    boxRNum=new float[box.NUM];
    boxOrder=new int[box.NUM];
  }

  void remake() {
    for (int i=0; i<box.NUM; i++) {
      boxOrder[i]=0;
    }
    
    A=false;
    B=false;
    C=false;
    D=false;
    E=false;
    F=false;
    G=false;
    H=false;
    I=false;
  }

  void itemIn() {
    for (int i=0; i<boxRNum.length; i++) {
      boxRNum[i]=random(100);
    }
    for (int i=0; i<boxRNum.length; i++) {
      for (int j=0; j<boxRNum.length; j++) {
        if (boxRNum[i]>boxRNum[j]) {
          boxOrder[i]++;
        }
      }
    }
    for (int i=0; i<num; i++) {
      state[i]=false;
    }
  }

  void part(int i) {
    if (boxOrder[i]<num) {
      state[boxOrder[i]]=true;
      x[boxOrder[i]]=box.x[i]+box.w/2;
      y[boxOrder[i]]=box.y[i]+box.h/2;
    }

    coin.make(boxOrder[i], box.x[i], box.y[i]);
  }

  void sorting(int i) {
    switch(floor(i/3.0)) {
    case 0:
      itemDisp.a(x[i], y[i]);
      break;
    case 1:
      itemDisp.b(x[i], y[i]);
      break;
    case 2:
      itemDisp.c(x[i], y[i]);
      break;
    case 3:
      itemDisp.d(x[i], y[i]);
      break;
    case 4:
      itemDisp.e(x[i], y[i]);
      break;
    case 5:
      itemDisp.f(x[i], y[i]);
      break;
    case 6:
      itemDisp.g(x[i], y[i]);
      break;
    case 7:
      itemDisp.h(x[i], y[i]);
      break;
    case 8:
      itemDisp.i(x[i], y[i]);
      break;
    }
  }

  int k=0;

  void display() {

    for (int i=0; i<num; i++) {

      if (state[i]) {
        py[i]=y[i];

        y[i]+=SPEED*0.2*SPadjust;
        sorting(i);
        judge(i);

        if (y[i]>height) {
          state[i]=false;
        }
      }
    }

    if (PSecond<floor(millis()/1000)) {
      if ((A)||(D)||(E)) {
        score.bonusItem--;
      }
      if (B) {
        score.bonusItem++;
      }
    }
    PSecond=floor(millis()/1000);
  }

  void judge(int i) {
    hit.mouseChange();

    if (hit.judge(x[i], y[i], x[i], py[i], newMouseX-bar.w/2.0, bar.y-bar.h/2.0, newMouseX+bar.w/2.0, bar.y-bar.h/2.0)||
      (hit.judge(x[i], y[i], x[i], py[i], newMouseX-bar.w/2.0, bar.y+bar.h/2.0, newMouseX+bar.w/2.0, bar.y+bar.h/2.0))||
      ((y[i]>bar.y-bar.h/2.0)&&(y[i]<bar.y+bar.h/2.0)&&(newMouseX-bar.w/2<x[i])&&(x[i]<newMouseX+bar.w/2.0))){

      sound.getItem.play(0);

      switch(floor(i/3.0)) {
      case 0:
        itemEffect.A();
        break;
      case 1:
        itemEffect.B();
        break;
      case 2:
        itemEffect.C();
        break;
      case 3:
        itemEffect.D();
        break;
      case 4:
        itemEffect.E();
        break;
      case 5:
        itemEffect.F();
        invincible.clean();
        break;
      case 6:
        itemEffect.G();
        break;
      case 7:
        itemEffect.H();
        break;
      case 8:
        itemEffect.I();
        break;
      }
      state[i]=false;
    }
  }
}
