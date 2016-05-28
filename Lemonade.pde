/* @pjs preload="bee.png","crown.png","lemonade.png", "lemon.png"; */
PImage lem;  // Declare variable "a" of type PImage
PImage bee;
PImage crown;
PImage lemon;
float bxpos = 590;
float bypos = 260;
float bvx;
float bvy;
float lypos1= 10;
float lypos2= 110;
float lypos3= 210;
float lypos4= 310;
float lypos5= 410;
float lypos6= 510;
float lvy= 5;
PFont font;

void setup() {
  size(700, 650);
  background(255, 213, 255);
  textSize(40);
  text("What happens when a bee", 50, 40);
  text("drinks some lemonade?", 50, 80);
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  lem = loadImage("lemonade.png");  // Load the image into the program  
  bee = loadImage("bee.png");
  crown= loadImage("crown.png");
  lemon = loadImage("lemon.png");
  font = loadFont("font.vlw");
}

void draw() {
  setup();
  // Displays the image at its actual size at point (0,0)
  image(lem, 10, height/2, lem.width/2, lem.height/2);
  image(bee, bxpos, bypos);
  bxpos= mouseX;
  bypos= mouseY;
  if (bxpos <= 226 && bxpos > 216 && bypos <= 260 && bypos > 250) {
    image(crown, 226, 250);
    rainlem();
    //noLoop();
  }
}

void rainlem() {
     // file.play();
  size(700, 650);
  background(255, 213, 255);
 /* for (int j=20; j<571; j += 110) {
    for (int i = 10; i<650; i += 100) {
      image(lemon, j, i);
      }
    }*/
image(lemon, 20, lypos1);
image(lemon, 130, lypos1);
image(lemon, 240, lypos1);
image(lemon, 350, lypos1);
image(lemon, 460, lypos1);
image(lemon, 570, lypos1);
//
image(lemon, 20, lypos2);
image(lemon, 130, lypos2);
image(lemon, 240, lypos2);
image(lemon, 350, lypos2);
image(lemon, 460, lypos2);
image(lemon, 570, lypos2);
//
image(lemon, 20, lypos3);
image(lemon, 130, lypos3);
image(lemon, 240, lypos3);
image(lemon, 350, lypos3);
image(lemon, 460, lypos3);
image(lemon, 570, lypos3);
//
image(lemon, 20, lypos4);
image(lemon, 130, lypos4);
image(lemon, 240, lypos4);
image(lemon, 350, lypos4);
image(lemon, 460, lypos4);
image(lemon, 570, lypos4);
//
image(lemon, 20, lypos5);
image(lemon, 130, lypos5);
image(lemon, 240, lypos5);
image(lemon, 350, lypos5);
image(lemon, 460, lypos5);
image(lemon, 570, lypos5);
//
image(lemon, 20, lypos6);
image(lemon, 130, lypos6);
image(lemon, 240, lypos6);
image(lemon, 350, lypos6);
image(lemon, 460, lypos6);
image(lemon, 570, lypos6);
textFont(font, 32);
fill((float)Math.random()*100,(float)Math.random()*200,(float)Math.random()*190);
text("Okay Ladies Now Lets Get In Formation", 20, 610);

lypos1 += lvy;
lypos2 += lvy;
lypos3 += lvy;
lypos4 += lvy;
lypos5 += lvy;
lypos6 += lvy;
 
if (lypos1 == 660) {lypos1=10;}
if (lypos2 == 660) {lypos2=10;}
if (lypos3 == 660) {lypos3=10;}
if (lypos4 == 660) {lypos4=10;}
if (lypos5 == 660) {lypos5=10;}
if (lypos6 == 660) {lypos6=10;}

  image(lem, 10, height/2, lem.width/2, lem.height/2);
  image(bee, bxpos, bypos);
  bxpos= mouseX;
  bypos= mouseY;
  if (bxpos <= 226 && bxpos > 216 && bypos <= 260 && bypos > 250) {
    image(crown, 226, 250);
}
//file.stop();
}