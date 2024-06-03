void invert(){
}

void penDraw() {
  if(mousePressed) {
  circle(mouseX, mouseY, slider.getValueI());
  }
}

void crop() {
  if(mousePressed) {
    PImage crop = img.get(0,0,500,500);
    image(crop, 0, 0);
}
}
