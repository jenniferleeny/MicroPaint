import javax.swing.*; 
import java.awt.*;
import java.util.*;

final static String CIRCLE = "circle.jpg";
final static String DOGE = "doge.jpg";
final static String DEGAS = "Degas.jpg";

int stage = 0;
String pic = "";
PImage img;
float red = 0;
float green = 0;
float blue = 0;
float brushsize = 5;

//Palette
int palettewidth = 150;

//Regular Brush 
boolean brush = true;
//float widthOfEllipseBrush = 10; float heightOfEllipseBrush = 10;

//Brush size slider
float startSliderSizeX = 10; float startSliderSizeY = 50;
float sliderWidth = 10; 
float sliderSizeLength = 127; float buttonSliderSizeX = (1/2)*sliderSizeLength + startSliderSizeX;
  
  void mouseClicked() {
    if (stage == 0) {
      if (mouseX >= 20 && mouseX <= 420) {
        if (mouseY > 90 && mouseY < 240) {
          stage = 1;
          pic = CIRCLE;
        }
        else if (mouseY > 260 && mouseY < 410) {
          stage = 2;
          pic = DOGE;
        }
        else if (mouseY > 430 && mouseY < 580) {
          stage = 3;
          pic = DEGAS;
        }
      }
    }
      img = loadImage(pic);
      frameRate(9999); 
      frame.setSize(2*img.width + palettewidth, img.height);
      background(255);
      image(img, img.width + palettewidth, 0, img.width, img.height);
      resetSidebar();
      //loadPixels(); //into pixels[], use upgdatepixels after
    if (stage != 0) {
     if ((mouseX > 40 && mouseX < 90) && (mouseY > 320 && mouseY <350)) {
       grades();
     }
    }
  }
    
  void mouseDragged() {
    if ( 
    (mouseX < buttonSliderSizeX + 2 && mouseX > buttonSliderSizeX - 2
    && ( mouseX > startSliderSizeX && mouseX < startSliderSizeX + sliderSizeLength )
    && mouseY > startSliderSizeY + 5 && mouseY < startSliderSizeY - 5)
    ) {
      fill(0);
      ellipse(mouseX, mouseY, 10, 10);
    }
    if (mouseX > palettewidth) {
      if (brush) {
       fill(red, green, blue);
       ellipse(mouseX, mouseY, brushsize, brushsize);
      }
    }
  
  
     if (mouseX > startSliderSizeX && mouseX < startSliderSizeX + sliderSizeLength) {
       resetSidebar();
       if (mouseY > startSliderSizeY - 1 && mouseY < startSliderSizeY + sliderWidth + 1) 
         red = 2*(mouseX - startSliderSizeX);
       if (mouseY > startSliderSizeY + 40 - 1 && mouseY < startSliderSizeY + 40 + sliderWidth + 1)
         green = 2*(mouseX - startSliderSizeX);
       if (mouseY > startSliderSizeY + 80 - 1 && mouseY < startSliderSizeY + 80 + sliderWidth + 1)
         blue = 2* (mouseX - startSliderSizeX); 
       if (mouseY > 220 - sliderWidth && mouseY < 220)
         brushsize = (mouseX - startSliderSizeX)/10 + 1; 
       if (mouseY > 260 - sliderWidth && mouseY < 260) {
         brushsize = (mouseX - startSliderSizeX)/10 + 1;
         red = 255; green = 255; blue = 255;
       }
     } 
}
  
  void grades() {//setup    
  /////////////THIS IS WHAT GETS YOUR GRADESSS YES?
   loadPixels();
   GenTest g = new GenTest();
   System.out.println(g.grade()); //To print out the grade, may just be for testing purposes
    
    //Status of Drawing; NEXT LEVEL BUTTON
    fill(200);
    rect(200, 100, 300, 300);
    PFont fgrade = createFont("Arial", 20, true);
    textFont(fgrade);
    fill(255);
    text("YOUR GRADE: " + g.grade(), 250, 250);
    
    PFont f0 = createFont("Arial", 20, true);
    textFont(f0);
    fill(255);
    text(g.evaluate(), 250, 350);
    System.out.println(g.evaluate());
  }
  
  public void setup() {  
   //level setup
  //size(800, 800);
   size(400 + 40, 3*150 + 50 + 100);
  frame.setResizable(true);
  
  if (stage == 0) {
  background(255, 10, 20);
  PFont ftext = createFont("Arial", 40, true);
    textFont(ftext);
    fill(0);
    text("CHOOSE A LEVEL", 50, 50);
  for (int i = 0; i < 3; i++) {
    fill(255);
    rect(20, 90 + i*170, 400, 150);
    PFont flevel = createFont("Arial", 30, true);
    textFont(ftext);
    fill(0);
    text("Level " + (i + 1), 150, 90 + i*170 + 75);
  }
  }
    //image setup
    /*
    if (stage == 1)
      pic = CIRCLE;
    else if (stage == 2)
      pic = DOGE;
    else if (stage == 3)
      pic = DEGAS;
      */
     //img = loadImage(pic);
     //frameRate(9999);

    /*if (stage != 0) {
      frame.setSize(2*img.width + palettewidth, img.height);
      background(255);
      //fill(255);
      image(img, img.width + palettewidth, 0, img.width, img.height);
      resetSidebar();
      //loadPixels(); //into pixels[], use upgdatepixels after
    }
    */
    Username user = new Username();
    String s = user.readFile();
    
    //user.addToScoreBoard(s);
  }

  boolean isEraser() { 
    return (red == 255 && blue == 255 && green == 255);
  }

  void resetSidebar() { 
    //setup sidebar
    noStroke();
    fill(70, 199, 199);
    rect(0, 0, palettewidth, height);
    
    //set up text boxes titles
    PFont f0 = createFont("Arial", 16, true);
    textFont(f0);
    fill(255);
    text("MicroPaint Palette", 10, 20);
    PFont f1 = createFont("Arial", 10, true);
    textFont(f1);
    fill(255);
    text("Red: " + red, 10, 40);
    PFont f2 = createFont("Arial", 10, true);
    textFont(f2);
    fill(255);
    text("Green: "+ green, 10, 80);
    PFont f3 = createFont("Arial", 10, true);
    textFont(f3);
    fill(255);
    text("Blue: " + blue, 10, 120);
    
    PFont f4 = createFont("Arial", 11, true);
    textFont(f4);
    fill(255);
    text("To turn off eraser, please \nread adjust the color slides.", 10, 280);
  
    //create color slides
    for (int i = 0; i < 3; i++) {
      if ( i == 0)
        fill(199, 70, 70); 
      else if (i == 1)
        fill(70, 199, 70);
      else 
        fill(70, 70, 199);
      strokeWeight(30);
      rect(startSliderSizeX, startSliderSizeY + i*40, startSliderSizeX + sliderSizeLength, sliderWidth);
      //ellipse(buttonSliderSizeX, startSliderSizeY + i*40, 10, 10);
    }
    //Collective color
    PFont f5 = createFont("Arial", 12, true);
    textFont(f5);
    fill(255);
    text("Color and Size:", 10, 160);
    if ( isEraser() ) {
      fill(0,0,0);
      ellipse(20, 175, 20, 20);
      rect(22, 165, palettewidth - 35, 20 );
    }
    else {
      fill(255, 255, 255);
      ellipse(20, 175, 20, 20);
      rect(22, 165, palettewidth - 35, 20 );
    }
    //NOTE: circle AT (X, Y) = (10, 170)
    //Width of brush
    PFont f6 = createFont("Arial", 12, true);
    textFont(f6);
    fill(255);
    if (! isEraser() ) {
      text("Brush Width: " + brushsize, 10, 200);
    }
    else {
      text("Brush Width: N/A", 10, 200);
    }
    fill(255, 255, 255);
    triangle(10, 220, 10 + sliderSizeLength, 220 - sliderWidth, 10 + sliderSizeLength, 220); 
    //Eraser
    PFont f7 = createFont("Arial", 12, true);
    textFont(f7);
    fill(255);
    if (red == 255 && blue == 255 && green == 255) {
      text("Eraser Size: " + brushsize, 10, 240);
    }
    else {
      text("Eraser Size: N/A", 10, 240);
    }
    fill(255, 255, 255);
    triangle(10, 260, 10 + sliderSizeLength, 260 - sliderWidth, 10 + sliderSizeLength, 260); 
    //ellipse(20, 280, 10, 10);
    
    fill(255, 10, 10);
    rect(40, 320, 50, 30);
    PFont fsubmit = createFont("Arial", 12, true);
    textFont(fsubmit);
    fill(255);
    text("Submit", 50, 340);
  }

  void draw() {
    //collective color box: displays color!
    fill(red, green, blue);
    fill(red, green, blue);
    //ellipse(20, 175, brushsize, brushsize);

  }


