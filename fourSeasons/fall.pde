//create class for fall background
class fall{
  //load fall image
  PImage forest = loadImage(data.fll.get(0));
  
  //display the background
  void display(){
    image(forest, 0, 0);
  }
}

//create class to animate the leaves
class fallA{
  //load leaf shape
  PShape leaf = loadShape(data.fll.get(1));
  
  //create initial variables
  int sx, sy, w, h, x, y;
  
  //method to animate the leaves
  void animate(){
    //reset values once off the screen
    if (y > 600 + w){
      y = round(random(-100, -w));
      x = round(random(-50, 700)); 
    }
    
    //move leaf each time method is called
    y = y + 4;
  }
  
  //get a random start position and size
  fallA (float startx, float starty, float wid){
    sx = round(startx);
    sy = round(starty);
    x = round(startx);
    y = round(starty);
    w = round(wid);
    h = round(wid);
  }
  
  //display the leaves
  void display(){
    animate();
    shape(leaf, x, y, w, h);
  }
}