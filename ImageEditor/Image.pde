PImage img;

void penDraw() {
  if(mode.equals("Mode: Draw") && mousePressed){
  circle(mouseX, mouseY, sliderDraw.getValueI());
  }
}

void invert(){
  if(image != null){
  
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

void flip () {
    image(img, 0, 0);
    pushMatrix();
    scale(-1.0, 1.0);
    image(img, -img.width, 0);
    popMatrix();
}
