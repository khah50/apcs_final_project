import g4p_controls.*;
PImage image;
PImage sampleImg;
String imagePath;
String mode = "Choose a mode";
String imageFailMessage = "No image selected";
String[] names;
Kernel[] kernels;

GCustomSlider sliderImageX, sliderImageY, sliderDraw;

void setup() {
  size(1300, 900);
  background(200, 200, 220);
  selectInput("Choose an image to edit:", "fileSelect");
  
  sliderImageX = new GCustomSlider(this, 250, 50, 400, 100, "grey_blue");
  sliderImageX.setShowValue(true);
  sliderImageX.setShowLimits(true);
  sliderImageX.setLimits(200, 200, 1000);
  sliderImageX.setNbrTicks(11);
  sliderImageX.setShowTicks(true);
  sliderImageX.setEasing(6.0);
  sliderImageX.setNumberFormat(G4P.INTEGER, 0);
  sliderImageX.setOpaque(false);

  sliderImageY = new GCustomSlider(this, 700, 50, 400, 100, "grey_blue");
  sliderImageY.setShowValue(true);
  sliderImageY.setShowLimits(true);
  sliderImageY.setLimits(200, 200, 1000);
  sliderImageY.setNbrTicks(11);
  sliderImageY.setShowTicks(true);
  sliderImageY.setEasing(6.0);
  sliderImageY.setNumberFormat(G4P.INTEGER, 0);
  sliderImageY.setOpaque(false);

  sliderDraw = new GCustomSlider(this, 700, 700, 400, 100, "grey_blue");
  sliderDraw.setShowValue(true);
  sliderDraw.setShowLimits(true);
  sliderDraw.setLimits(38, 0, 100);
  sliderDraw.setNbrTicks(11);
  sliderDraw.setShowTicks(true);
  sliderDraw.setEasing(6.0);
  sliderDraw.setNumberFormat(G4P.INTEGER, 0);
  sliderDraw.setOpaque(true);
 
  GButton btn = new GButton(this, 100, 90, 96, 32, "A button");
}

void draw() {
  stroke(255);  
  background(200, 200, 220);
  textSize(13);
  text(mode, 300, 300);
  if(mode.equals("Mode: Draw")){
  penDraw();
  }
  if(image != null){
    imageMode(CENTER);
    image(image, 690, 450, sliderImageX.getValueI(), sliderImageY.getValueI());
  }
  else{
    sampleImg = loadImage("test.jpeg");
    imageMode(CENTER);
    image(sampleImg, 690, 450, sliderImageX.getValueI(), sliderImageY.getValueI());
  }
}

void keyPressed() {
  String[] names = new String[]{
    "Crop", "Contrast", "Saturation", "Blur", "Rotate", "Invert", "Draw"
  };
  //insert kernel
  if (keyPressed) {
    if (keyCode == 67) { //crop C
     mode = "Mode: Crop";
    }
    if (keyCode == 88) { //contrast X
         mode = "Mode: Contrast";
    }
    if (keyCode == 83) { //saturation S
         mode = "Mode: Saturation";
    }
    if (keyCode == 66) { //blur B
         mode = "Mode: Blur";
    }
    if (keyCode == 68) { //draw D
         mode = "Mode: Draw";
    }
    if (keyCode == 82) { //rotate R
         mode = "Mode: Rotate";
    }
    if (keyCode == UP) { //invert
         mode = "Mode: Invert (Up)";
    }
    if (keyCode == DOWN) {
      mode = "Mode: Invert (Down)";
    }
    if (keyCode == LEFT) {
      mode = "Mode: Invert (Left)";
    }
    if (keyCode == RIGHT) {
      mode = "Mode: Invert (Right)";
    }
    if (keyCode == BACKSPACE) { //quit modes
      mode = "Mode: None";
    }  
    if (keyCode == 32 ){ //resets image
      mode = "Mode: Clear";
    }
  }
}
  
public void handleSliderEvents(GValueControl slider, GEvent event) {
  
}
public void handleButtonEvents(GValueControl button, GEvent event) {
  
}


void fileSelect(File selection) {
  if (selection == null) {
    System.out.println("Sample Image Provided");
    sampleImg = loadImage("test.jpeg");
    //text(imageFailMessage, 600, 300);
  } 
  else{
    System.out.println("User selected " + selection.getAbsolutePath());
    imagePath = selection.getAbsolutePath();
    image = loadImage(imagePath);
    if (image == null) {
      System.out.println("Image failed to load");
    }
  }
}
