//create class for winter background
class winter{
  //load winter image
  PImage mountains = loadImage(data.wtr.get(0));
  
  //display the background
  void display(){
    image(mountains, 0, 0);
  }
}

//create class to animate the snowflakes
class winterA{
  //load snowflake shape
  PShape snowflake = loadShape(data.wtr.get(1));
  
  //create initial variables
  int sx, sy, w, h, x, y;
  
  //method to animate the snowflakes
  void animate(){
    //reset values once off the screen
    if (y > 600 + w){
      y = round(random(-100, -w));
      x = round(random(-50, 700)); 
    }
    
    //move snowflake each time method is called
    y = y + 7;
  }
  
  //get a random start position and size
  winterA(float startx, float starty, float wid){
    sx = round(startx);
    sy = round(starty);
    x = round(startx);
    y = round(starty);
    w = round(wid);
    h = round(wid);
  }
  
  //dispaly the snowflakes
  void display(){
    animate();
    snowflake.translate(snowflake.width/2, snowflake.width/2);
    snowflake.rotate(radians(4));
    snowflake.translate(-snowflake.width/2, -snowflake.width/2);
    shape(snowflake, x, y, w, h);
  }
}