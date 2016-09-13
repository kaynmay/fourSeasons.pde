class Seasons{
  PFont c = createFont("Arial", 18);
  int x, y;
  
  Seasons(int _x, int _y){
    x = _x;
    y = _y;
  }
  
  void display(){
    fill(255);
    textFont(c);
    String[] season = new String[4];
    season[0] = "Spring";
    season[1] = "Summer";
    season[2] = "Fall";
    season[3] = "Winter";
    text(season[0], 143, y);
    text(season[1], 255, y);
    text(season[2], 395, y);
    text(season[3], 505, y);
  }
  
}