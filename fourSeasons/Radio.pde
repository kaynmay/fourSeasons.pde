class Radio {
  int x, y;
  int w, h;
  color onColor = color(125);
  color fallColor = color(75,41,6);
  color springColor = color(98,62,121);
  color summerColor = color(115,138,53);
  color winterColor = color(42,56,55);
  int id;
  Radio[] radioGroup;
  boolean isChecked = false;
  
  Radio(int _x, int _y, int _w, int _h, int _id, Radio[] rg) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    id = _id;
    radioGroup = rg;
  }
  
  boolean isPressed(int mx, int my) {
    if (mx >= x && mx <= x+w && my >= y && my <= y+h) {
      for (int i = 0; i < radioGroup.length; i++) {
        if (i != id) {
          radioGroup[i].isChecked = false;
        } else {
          radioGroup[i].isChecked = true;
        }
      }
      return true;
    }
    return false;
  }
  
  void display() {
    noStroke();
    if (id == 0){
      fill(springColor);
    } 
    if (id == 1){
      fill(summerColor);
    } 
    if (id == 2){
      fill(fallColor);
    } 
    if (id == 3){
      fill(winterColor);
    }
    rect(x, y, w, h, 7);
    if (isChecked){
      fill(onColor);
      rect(x, y, w, h, 7);
    }
  }
}