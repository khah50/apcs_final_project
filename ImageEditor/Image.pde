PImage img;
PImage output;
import g4p_controls.*;
GCustomSlider slider;


void setup(){
  size(1370,800);
   img = loadImage("main-image.jpeg");
  output = img.copy();
    image(img, 0, 0);
stroke(255);
    slider = new GCustomSlider(this, 50, 50, 400, 100, "grey_blue");
  slider.setShowValue(true);
  slider.setShowLimits(true);
  slider.setLimits(38, 0, 100);
  slider.setNbrTicks(11);
  slider.setShowTicks(true);
  slider.setEasing(6.0);
  slider.setNumberFormat(G4P.INTEGER, 0);
  slider.setOpaque(true);

}

void draw() {
  drawl();
}

void drawl() {
  if(mousePressed) {
  circle(mouseX, mouseY, slider.getValueI());
  }
}
