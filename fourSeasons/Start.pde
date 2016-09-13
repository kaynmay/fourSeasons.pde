class Start{
  PImage forest = loadImage(data.fll.get(0));
  PImage field = loadImage(data.spr.get(0));
  PImage desert = loadImage(data.smr.get(0));
  PImage mountains = loadImage(data.wtr.get(0));
  void display(){
    image(field, 0, 0, width/2, height/2);
    image(desert, width/2, 0, width/2, height/2); 
    image(forest, 0, height/2, width/2, height/2);
    image(mountains, width/2, height/2, width/2, height/2);
  }
}

class Button {
  int startX, startY;
  boolean rectOver;
  int m = 0;
  PFont a = createFont("Arial", 24);
  PFont b = createFont("Airal", 16);
  Button(int _x, int _y, boolean rect_over){
    startX = _x;
    startY = _y;
    rectOver = rect_over;
}
  
void display(){  
    update();
    fill(0);
    textFont(b);
    text("Hold 'N' for night mode", 275, 335);
}
  
void update() {
  if ( overRect(startX, startY, 190, 35) ) {
    rectOver = true;
    fill(125, 125, 125, 200);
    noStroke();
    rect(startX, startY, 190, 35, 7);
    fill(255);
    strokeWeight(2);
    textFont(a);
    text("Four Seasons", 280, 310); 
  } else {
    rectOver = false;
    fill(125, 125, 125, 150);
    noStroke();
    rect(startX, startY, 190, 35, 7);
    fill(255);
    textFont(a);
    text("Four Seasons", 280, 310); 
  }
}  

void pressed(){
  if (rectOver){
    m = 1;
    /// how we know to switch to Spring from the start screen
  }
}

boolean overRect(int x, int y, int rwidth, int rheight)  {
  if (mouseX >= x && mouseX <= x+rwidth && 
      mouseY >= y && mouseY <= y+rheight) {
    return true;
  } else {
    return false;
  }
}


}