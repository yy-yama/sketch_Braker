Score score;

class Score {

  Table scores;
  int[]pastScores;
  int rowCount;

  int endTime;

  int num;

  int top;
  int high;
  int total;
  int bonus;
  int bonusItem=500;

  int []seriesPoint={0, 0, 0};

  Score() {
  }

  void remake() {
    seriesPoint[0]=0;
    seriesPoint[1]=0;
    seriesPoint[2]=0;

    bonusItem=500;

    scores=loadTable("BreakerScore.csv");
    rowCount=scores.getRowCount();
    pastScores=new int[rowCount+1];
    for (int i=0; i<rowCount; i++) {
      pastScores[i]=scores.getInt(i, 0);
    }
    high=max(pastScores);

    path=dataPath("BreakerScore.csv");
  }

  void endControl() {
    if (end==0) {
      sound.pause();

      itemEffect.itemReturn();

      Control=2;

      endTime=millis()-hit.startTime;
      bonus=constrain(300-floor(endTime/1000), 0, 300)+constrain(150-bar.times, 0, 150)+undWin.life*100+constrain(bonusItem, 0, 1000);

      total=num+bonus;
      pastScores[rowCount]=total;
      top=max(pastScores);
      r.write(path, total);
      delay(1000);
      endWin.endTime=millis();
    }
    //ゲーム終了の判定
  }
}
