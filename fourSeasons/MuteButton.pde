PImage vol;

class MuteButton {
  String name;
  int x_pos, y_pos;
  int size;
  PImage vol = loadImage("vol.png");
  boolean muted = false;
  boolean isMuted() {
    return muted;
  }
 
  MuteButton (String s, int xp, int yp, int sz) {
    name=s;
    x_pos=xp;
    y_pos=yp;
    size=sz;
  }
 
  void press() {
    if ((mouseX >=x_pos) && (mouseX<= x_pos+size) &&(mouseY>=y_pos) && (mouseY<= y_pos+size)) {
      muted = !muted;
    }
  }
 
  void display() {
    stroke(0);
    image(vol, x_pos, y_pos, size, size);
    textSize(10);
    //text(name, x_pos+size+10, y_pos+size);
    if (muted) {
      stroke(#980000);
      strokeWeight(3);
      line(x_pos, y_pos, x_pos+size, y_pos+size);
      line(x_pos+size, y_pos, x_pos, y_pos+size);
    }
  }
}