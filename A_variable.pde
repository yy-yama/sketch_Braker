import use.Record;
Record r=new Record(this);

int LIFENUM=5;

int Control=-1;
//制御
//-1でセットアップ、0でスタート画面、1でゲーム、2でクリア、3でゲームオ―バ-

int State;
//0でボール停止、1でボール運動、２で磁石効果
int end;
//0になったら終了

float magn;
//ウィンドウ倍率
float margin;
//ウィンドウ左余白
float newWidth;
//ウィンドウ横幅
float above;
//ウィンドウ上余白（Wiiモードのみ）
boolean wii=true;

boolean wiiuse=false;

boolean mode=false;

float SPEED;

float SPadjust;

float newMouseX;

PFont font;
PFont scoreFont;
PFont font2;
int fontSize=50;

String path;

float multi(float m) {
  float r=m*magn;
  return r;
}

void definition() {
  m0_01=multi(0.01);
  m1=multi(1);
  m1_5=multi(1.5);
  m2=multi(2);
  m5=multi(5);
  m10=multi(10);
  m15=multi(15);
  m20=multi(20);
  m30=multi(30);
  m40=multi(40);
  m50=multi(50);

  m100=multi(100);
  m200=multi(200);
  m320=multi(320);
}

void exitButton() {
  colorMode(RGB);
  strokeWeight(1.5*magn);
  stroke(255);

  if (dist(width-20.0*magn, 20.0*magn, mouseX, mouseY)<15.0*magn) {
    fill(255, 0, 0);
    if (mousePressed)exit();
  } else {
    noFill();
  }
  pushMatrix();

  translate(width-20.0*magn, 20.0*magn);

  ellipse(0, 0, 30.0*magn, 30.0*magn);

  rotate(radians(45));

  line(-10.0*magn, 0, 10.0*magn, 0);

  rotate(radians(90));

  line(-10.0*magn, 0, 10.0*magn, 0);

  popMatrix();
}

float m1, m2, m5, m10, m15, m20, m30, m40, m50, m100, m150, m180, m200, m300, m400, m500, m1_5, m0_01, m320
  ;
