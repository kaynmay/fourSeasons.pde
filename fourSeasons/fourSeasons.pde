import ddf.minim.*;

// pictures and objects
Start screen;
Button go;
data data;
fall fallbg;
spring springbg;
summer summerbg;
winter winterbg;
fallA[] leaves = new fallA[20];
springA flower1, flower2, flower3, flower4, flower5;
summerA tumbleweed;
winterA[] snowflakes = new winterA[50];
// radio buttons
Radio[] radioButtons = new Radio[4];
Seasons s;

//sound
Minim minim;
AudioPlayer vivSpring;
AudioPlayer vivSummer;
AudioPlayer vivFall;
AudioPlayer vivWinter;
AudioPlayer tool;
AudioPlayer lastAudio;
int lastChecked = -1;
MuteButton muter;

void setup(){
  size(700, 600);
  
  // pictures and objects
  data = new data();
  screen = new Start();
  go = new Button(260, 283, false);
  fallbg = new fall();
  springbg = new spring();
  summerbg = new summer();
  winterbg = new winter();
  for (int i = 0; i<leaves.length; i++){
    leaves[i] = new  fallA(random(-50,700), random(-600, -50), random(20, 45));
  }
  flower1 = new springA(10, 510);
  flower2 = new springA(180, 490);
  flower3 = new springA(300, 500);
  flower4 = new springA(420, 490);
  flower5 = new springA(590, 510);
  tumbleweed = new summerA();
  for (int i = 0; i<snowflakes.length; i++){
    snowflakes[i] = new  winterA(random(-50,700), random(-600, -50), random(15, 45));
  }
    
  //sound
  minim = new Minim(this);
  vivSpring = minim.loadFile("vivaldiSpringchop.mp3");
  vivSummer = minim.loadFile("vivaldiSumchop.mp3");
  vivFall = minim.loadFile("vivaldiFchop.mp3");
  vivWinter = minim.loadFile("vivaldiWchop.mp3");
  tool = minim.loadFile("toolbit.mp3"); //default filler for lastAudio
  lastAudio = tool;
  muter = new MuteButton("mute", 670, 10, 25);
  
  // radio buttons
  s = new Seasons(195, 585);
  
  for (int i = 0; i < radioButtons.length; i++) {
    int x = 120 + i*120;
    ///////////////////// Radio(x, y, width, height, #, recursive);
    radioButtons[i] = new Radio(x, 565, 100, 30, i, radioButtons);
  }
  
}

void mousePressed() {
  for (Radio r : radioButtons) {
    r.isPressed(mouseX, mouseY);
  }
  muter.press();
  go.pressed();
}

void draw(){
  if (go.m == 0){
    screen.display();
    go.display();
  }
  
  else{
  //spring
  if (radioButtons[0].isChecked == true){
    springbg.display();
    flower1.display();
    flower2.display();
    flower3.display();
    flower4.display();
    flower5.display();
    if(lastChecked != 0) {
      lastAudio.pause();
      vivSpring.rewind();
      vivSpring.play();
      vivSpring.loop();
      lastAudio = vivSpring;
    }
    lastChecked = 0;
    
  }
  
  //summer
  else if (radioButtons[1].isChecked == true){
    summerbg.display();
    tumbleweed.display();
    if(lastChecked != 1) {
      lastAudio.pause();
      vivSummer.rewind();
      vivSummer.play();
      vivSummer.loop();
      lastAudio = vivSummer;
  }
    lastChecked = 1;
  }
  
  //fall
  else if (radioButtons[2].isChecked == true){
    fallbg.display();
    for(int j = 0; j<leaves.length; j++){
      leaves[j].display();
    }
    if(lastChecked != 2) {
      lastAudio.pause();
      vivFall.rewind();
      vivFall.play();
      vivFall.loop();
      lastAudio = vivFall;
    }
    lastChecked = 2;
  }
  
  //winter
  else if (radioButtons[3].isChecked == true){
    winterbg.display();
    for(int j = 0; j<snowflakes.length; j++){
      snowflakes[j].display();
    }
    if(lastChecked != 3) {
      lastAudio.pause();
      vivWinter.rewind();
      vivWinter.play();
      vivWinter.loop();
      lastAudio = vivWinter;
    }
    lastChecked = 3;
  } else {
    lastChecked = -1;
    lastAudio = tool;
  }
  
  //mute
  if (muter.isMuted()) {
    lastAudio.mute();
  }
  else lastAudio.unmute();
  
  
  //night display
  if (keyPressed && key == 'n'){
    fill(#14151C, 200);
    noStroke();
    blendMode(MULTIPLY);
    rect(0,0,700,600);
    blendMode(BLEND);
  }
  
  for (Radio r : radioButtons) {
    r.display();
  }
  s.display();
  
  muter.display();
  }
}