/* @pjs preload="bee.png","crown.png","lemonade.png", "lemon.png"; */
import processing.sound.*;
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
float lvy= 5;
PFont font;
SoundFile file;

void setup() {
  frameRate(30);
  size(700, 500);
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  lem = loadImage("lemonade.png");  // Load the image into the program  
  bee = loadImage("bee.png");
  crown= loadImage("crown.png");
  lemon = loadImage("lemon.png");
  font = loadFont("font.vlw");
  file = new SoundFile(this, "formation.mp3");
  file.play();
}

void draw() {
  background(255, 213, 255);
  textSize(40);
  text("What happens when a bee", 50, 40);
  text("drinks some lemonade?", 50, 80);
  // Displays the image at its actual size at point (0,0)
  image(lem, 10, height/2, lem.width/2, lem.height/2);
  image(bee, bxpos, bypos);
  bxpos= mouseX;
  bypos= mouseY;
  if (bxpos <= 226 && bxpos > 216 && bypos <= 190 && bypos > 180) {
    image(crown, 226, 180);
  }
}

void rainlem() {
     // file.play();
  size(700, 500);
  background(255, 213, 255);
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
textFont(font, 32);
fill((float)Math.random()*100,(float)Math.random()*200,(float)Math.random()*190);
text("Okay Ladies Now Lets Get In Formation", 30, 480);

lypos1 += lvy;
lypos2 += lvy;
lypos3 += lvy;
lypos4 += lvy;
lypos5 += lvy;
 
if (lypos1 == 510) {lypos1=10;}
if (lypos2 == 510) {lypos2=10;}
if (lypos3 == 510) {lypos3=10;}
if (lypos4 == 510) {lypos4=10;}
if (lypos5 == 510) {lypos5=10;}

  image(lem, 10, height/2, lem.width/2, lem.height/2);
  image(bee, bxpos, bypos);
  image(crown, 217, 180);
  bxpos= mouseX;
  bypos= mouseY;
}
