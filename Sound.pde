import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Sound sound;

class Sound {

  Minim minim;

  AudioPlayer cymbal;
  AudioPlayer drum;
  AudioPlayer broken;
  AudioPlayer click;
  AudioPlayer invincible;
  AudioPlayer falling;
  AudioPlayer coin;
  AudioPlayer pingpong;
  AudioPlayer beam;
  AudioPlayer clear;
  AudioPlayer tettete;
  AudioPlayer loser;
  AudioPlayer asunoyozora;
  AudioPlayer sharuru;
  AudioPlayer getItem;
  AudioPlayer gameOver;
  AudioPlayer highScore;
  AudioPlayer eikou;
  AudioPlayer magnet;
  AudioPlayer accel;
  AudioPlayer decel;
  AudioPlayer expan;
  AudioPlayer shrin;

  AudioPlayer p_highScore;
  AudioPlayer p_clear;
  AudioPlayer p_click;
  AudioPlayer p_falling;
  AudioPlayer p_tema;
  AudioPlayer p_gameOver;

  Sound() {
  }

  void make() {
    getItem=minim.loadFile("getItem.wav");
    asunoyozora=minim.loadFile("asunoyozora.wav");
    sharuru=minim.loadFile("sharuru.wav");
    loser=minim.loadFile("loser.wav");
    tettete=minim.loadFile("tettete.wav");
    clear=minim.loadFile("clear.wav");
    beam=minim.loadFile("beam.wav");
    pingpong=minim.loadFile("pingpong.wav");
    coin=minim.loadFile("coin.wav");
    falling=minim.loadFile("falling.wav");
    invincible=minim.loadFile("invincible.wav");
    click=minim.loadFile("click.wav");
    drum=minim.loadFile("drum.wav");
    broken=minim.loadFile("broken.wav");
    cymbal=minim.loadFile("cymbal.wav");
    gameOver=minim.loadFile("gameOver.wav");
    highScore=minim.loadFile("highScore.wav");
    eikou=minim.loadFile("eikou.wav");
    magnet=minim.loadFile("magnet.wav");
    accel=minim.loadFile("accel.wav");
    decel=minim.loadFile("decel.wav");
    expan=minim.loadFile("expan.wav");
    shrin=minim.loadFile("shrin.wav");
    p_highScore=minim.loadFile("p_highScore.wav");
    p_clear=minim.loadFile("p_clear.wav");
    p_click=minim.loadFile("p_click.wav");
    p_falling=minim.loadFile("p_falling.wav");
    p_tema=minim.loadFile("p_tema.wav");
    p_gameOver=minim.loadFile("p_gameOver.wav");
  }

  void pause() {
    asunoyozora.pause();
    sharuru.pause();
    loser.pause();
    tettete.pause();
    clear.pause();
    beam.pause();
    pingpong.pause();
    coin.pause();
    invincible.pause();
    click.pause();
    drum.pause();
    cymbal.pause();
    gameOver.pause();    
    highScore.pause();
    eikou.pause();
    magnet.pause();
    accel.pause();
    decel.pause();
    expan.pause();
    shrin.pause();
    p_highScore.pause();
    p_clear.pause();
    p_click.pause();
    p_tema.pause();
    p_gameOver.pause();
  }

  void end() {
    getItem. close();
    asunoyozora. close();
    sharuru. close();
    loser. close();
    tettete. close();
    clear. close();
    beam. close();
    pingpong. close();
    coin. close();
    falling. close();
    invincible. close();
    click. close();
    drum. close();
    broken. close();
    cymbal. close();
    gameOver. close();    
    highScore. close();
    eikou. close();
    magnet. close();
    accel. close();
    decel. close();
    expan. close();
    shrin. close();
    p_highScore. close();
    p_clear. close();
    p_click. close();
    p_falling. close();
    p_tema. close();
    p_gameOver. close();
    minim.stop() ;
  }
}
