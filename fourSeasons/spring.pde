//create class for spring background
class spring{
  //load spring image
  PImage field = loadImage(data.spr.get(0));
  
  //display the background
  void display(){
    image(field, 0, 0);
  }
}

//create class to animate the flowers
class springA{
  //load flower shape
  PShape stem = loadShape(data.spr.get(1));
  PShape petals = loadShape(data.spr.get(2));
  PShape middle = loadShape(data.spr.get(3));
  
  //create initial variables
  int x, endy, starty = 610, y = 610;
  float angle = 0;
  int counter = 0;
  boolean up = true;
  
  //get where the flower should end up
  springA(int x_pos, int y_pos){
    x = x_pos;
    endy = y_pos;
  }
  
  //method to animate the flower
  void animate(){
    //check if up or down
    if (y < endy){
      up = false;
    }
    if (y > starty){
      up = true;
    }
    
    //rotate flower
    counter = counter + 1;
    angle = angle - .4;
    
    //move flower
    if (counter % 2 == 0){
      if (up == true){
      y = y - 1;
      }
      if (up == false){
        y = y + 1;
      }
    }
  }
  
  //display the flower
  void display(){
    shape(stem, x, y, 100, 100+20);
    animate();
    angle = radians(angle);
    petals.translate(petals.width/2, petals.width/2);
    petals.rotate(angle);
    petals.translate(-petals.width/2, -petals.width/2);
    shape(petals, x, y-20, 100, 100);
    shape(middle, x+2, y, 100, 100);
  }
}