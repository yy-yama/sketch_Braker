WiiUse wiiUse;

class WiiUse {

  void barSet() {
    newMouseX=width/2.0;
  }

  int buttonSelect() {
    if (mousePressed) {

      if (mouseButton==RIGHT) {
        return 1;
      } else if (mouseButton==LEFT) {
        return 2;
      } else {
        return 0;
      }
    } else {
      return 0;
    }
  }

  void barMove() {
    if (mousePressed) {
      if (mouseButton==LEFT) {
        if (newMouseX>margin+bar.w/2.0) {
          newMouseX-=m10;
        }
      }

      if (mouseButton==RIGHT) {
        if (newMouseX<margin+newWidth-bar.w/2.0) {
          newMouseX+=m10;
        }
      }
    }
  }
}

void keyPressed() {

  if (key==CODED) {
    switch(keyCode) {
    case SHIFT:
      if (wiiuse) {
        undWin.life++;
      }
      break;
    }
  }

  switch(key) {
  case TAB:
    if (wiiuse) {
      Runtime r=Runtime.getRuntime();
      try {
        r.exec(sketchPath()+"\\wii_mice1a\\wii_remote_connect.exe");
        //r.exec(sketchPath()+"\\WiinRemote_v2007.1.13\\WiinRemote.exe");
      }
      catch(IOException e) {
        println(e);
      }
    }
    break;

  case BACKSPACE:
  case DELETE:
    Control=-1;
    sound.pause();
    break;
  }
}
