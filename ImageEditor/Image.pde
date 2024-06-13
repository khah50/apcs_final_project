import g4p_controls.*;
int cropX, cropY, cropWidth, cropHeight;

void penDraw() {
  if(mode.equals("Mode: Draw") && mousePressed){
      pg.line(mouseX, mouseY, pmouseX, pmouseY);
  }
}

void rotateImg(PImage img) {
   pg.translate(width / 2, height / 2);
   pg.rotate(sliderRotate.getValueI()*TWO_PI/360);
   pg.translate(-width / 2, -height / 2);
}

void invertLeft(PImage image){
  image.loadPixels();
  for (int y = 0; y < image.height; y++) {
    for (int x = 0; x < image.width / 2; x++) {
      int pixelOne = x + y * image.width;
      int pixelTwo = (image.width - x - 1) + y * image.width;
      int invertedColor = image.pixels[pixelOne];
      image.pixels[pixelOne] = image.pixels[pixelTwo];
      image.pixels[pixelTwo] = invertedColor;
    }
  }
  image.updatePixels();
}

void invertRight(PImage image){
  image.loadPixels();
  for (int y = 0; y < image.height; y++) {
    for (int x = 0; x < image.width / 2; x++) {
      int pixelOne = x + y * image.width;
      int pixelTwo = (image.width - x - 1) + y * image.width;
      int invertedColor = image.pixels[pixelOne];
      image.pixels[pixelOne] = image.pixels[pixelTwo];
      image.pixels[pixelTwo] = invertedColor;
    }
  }
  image.updatePixels();
}

void invertUp(PImage image){
  image.loadPixels();
  for (int y = 0; y < image.height / 2; y++) {
    for (int x = 0; x < image.width; x++) {
      int pixelOne = x + y * image.width;
      int pixelTwo = x + (image.height - y - 1) * image.width;
      int invertedColor = image.pixels[pixelOne];
      image.pixels[pixelOne] = image.pixels[pixelTwo];
      image.pixels[pixelTwo] = invertedColor;
    }
  }
  image.updatePixels();
}

void invertDown(PImage image){
  image.loadPixels();
  for (int y = 0; y < image.height / 2; y++) {
    for (int x = 0; x < image.width; x++) {
      int pixelOne = x + y * image.width;
      int pixelTwo = x + (image.height - y - 1) * image.width;
      int invertedColor = image.pixels[pixelOne];
      image.pixels[pixelOne] = image.pixels[pixelTwo];
      image.pixels[pixelTwo] = invertedColor;
    }
  }
  image.updatePixels();
}

void crop() {
  if (image != null) {
    int x = sliderCropX.getValueI();
    int y = sliderCropY.getValueI();
    int width = sliderCropWidth.getValueI();
    int height = sliderCropHeight.getValueI();

    if (x >= 0 && y >= 0 && x + width <= image.width && y + height <= image.height) {
      image = image.get(x, y, width, height);
    }
  }
}
