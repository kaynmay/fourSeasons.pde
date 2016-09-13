//create class for summer background
class summer{
  //load summer image
  PImage desert = loadImage(data.smr.get(0));
  
  //display the background
  void display(){
    image(desert, 0, 0);
  }
}

//create class to animate the tumbleweed
class summerA{
  //load tumbleweed shape
  PShape tumbleweed = loadShape(data.smr.get(1));
  
  //create initial variables
  float x = -85;
  float y = 450;
  float angle = 0;
  int counter = 0;
  
  //method to animate the tumbleweed
  void animate(){
    //reset values once off the screen
    if (x > 785){
      x = -85;
    }
    
    //move tumbleweed each time method is called
    x = x + 7;
    counter = counter + 1;
    
    //rotate tumbleweed
    if (counter % 2 == 0){
      angle = angle - .4;
    }
  }
  
  //display the tumbleweed
  void display(){
    angle = radians(angle);
    animate();
    tumbleweed.translate(tumbleweed.width/2, tumbleweed.width/2);
    tumbleweed.rotate(-angle);
    tumbleweed.translate(-tumbleweed.width/2, -tumbleweed.width/2);
    shape(tumbleweed, x, y, 75, 75);
  }
}