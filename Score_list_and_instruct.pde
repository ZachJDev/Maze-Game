class ScoreList {
  int[] scores;
  ScoreList() {
    scores = new int[0];
  }
  void saveScore (int score) {
    scores = expand(scores, scores.length +1);
    scores[scores.length-1] = score;
    
   
  }
  void displayScores() {
    textSize(16);
    fill(0,0, 255);
    text("Move the mouse from green to pink to score!", 50, 400);
    textSize(32);
   int[] a = reverse(sort(scores));
    for(int i = 0; i < a.length && i < 5; i++) {
      scores = reverse(sort(scores));
      text("score: "+ scores[i], 200, 100 + i*50);
    }
  }
}