import g4p_controls.*;
PImage img;

void penDraw() {
  if(mode.equals("Mode: Draw") && mousePressed){
  circle(mouseX, mouseY, sliderDraw.getValueI());
  }
}

void invert() {
  if(mode.equals("Mode: Invert (right)") && keyPressed == true){
    image(image, 0, 0);
    pushMatrix();
    scale(-1.0, 1.0);
    image(image, -image.width, 0);
    popMatrix();
  }
}

void crop() {
  if(image != null){
  if(mousePressed) {
    PImage crop = img.get(0,0,500,500);
    image(crop, 0, 0);
  }
}
}
