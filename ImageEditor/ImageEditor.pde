import g4p_controls.*;
PImage image;
String imagePath;
String mode = "Choose a mode";

GCustomSlider sliderImageX, sliderImageY;

public void handleSliderEvents(GValueControl slider, GEvent event) {
  System.out.println("slider event");
}

void fileSelect(File selection) {
  if (selection == null) {
    System.out.println("No image selected");
  } else {
    System.out.println("User selected " + selection.getAbsolutePath());
    imagePath = selection.getAbsolutePath();
    image = loadImage(imagePath);
    if (image == null) {
      System.out.println("Image failed to load");
    }
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
    if (keyCode == 100) { //draw D
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
  }
}

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
}

void draw() {
  background(200, 200, 220);
  if (image != null) {
    imageMode(CENTER);
    image(image, 690, 450, sliderImageX.getValueI(), sliderImageY.getValueI());
  }
  String mode = this.mode;
  text(mode, 300, 300);
}
