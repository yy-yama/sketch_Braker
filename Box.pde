Box box;

class Box {

  /*
  ブロック置き方：四隅を空ける
   
   ０・１段目：６個　ブロック番号：０～１１
   ２・３段目：８個　ブロック番号：１２～２７
   ４～１０段目：１０個　ブロック番号：２８～９７
   １１・１２段目：８個　ブロック番号：９８～１１３
   １３・１４段目：６個　ブロック番号：１１４～１２５
   */

  final int NUM=126;
  //ブロックの数
  float[] state=new float[NUM];
  float[]x=new float[NUM];
  float[]y=new float[NUM];
  float[]col=new float[NUM];
  //各ブロックの座標、色
  float w;
  float h;
  //ブロックの長さと幅

  float bottom;
  //ブロックの下限
  float space;
  //各ブロック間の隙間

  Box() {
    w=95.0*magn;
    h=25.0*magn;
    bottom=450.0*magn;
    space=5.0*magn;
  }

  void remake() {
    for (int i=0; i<NUM; i++) {
      state[i]=0;
    }
  }

  void blockIn() {
    for (int i=0; i<NUM; i++) {
      this.col[i]=map(i, 0, NUM-1, 0, 255);

      if (i<12) {
        this.x[i]=(i%6+2)*(this.w+space)+space+margin;
        this.y[i]=i/6*(this.h+space)+space+above;
      } else if (i<28) {
        int k=i-12;
        this.x[i]=(k%8+1)*(this.w+space)+space+margin;
        this.y[i]=(k/8+2)*(this.h+space)+space+above;
      } else if (i<98) {
        int k=i-28;
        this.x[i]=(k%10)*(this.w+space)+space+margin;
        this.y[i]=(k/10+4)*(this.h+space)+space+above;
      } else if (i<114) {
        int k=i-98;
        this.x[i]=(k%8+1)*(this.w+space)+space+margin;
        this.y[i]=(k/8+11)*(this.h+space)+space+above;
      } else {
        int k=i-114;
        this.x[i]=(k%6+2)*(this.w+space)+space+margin;
        this.y[i]=(k/6+13)*(this.h+space)+space+above;
      }
    }
  }

  void display() {
    noStroke();
    colorMode(HSB);
    rectMode(CORNER);

    if (mode) {
      p.display();

      for (int i=0; i<NUM; i++) {
        if (this.state[i]==1) {
          p.hide(this.x[i], this.y[i]);
        }
      }
    } else {
      for (int i=0; i<NUM; i++) {

        fill(this.col[i], 205, 255);

        if (this.state[i]==0) {
          rect(this.x[i], this.y[i], this.w, this.h);
        }
      }
    }


    //ブロックの表示
  }
}
