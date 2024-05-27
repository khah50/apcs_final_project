import g4p_controls.*;
PImage image;
String imagePath;
GCustomSlider slider;

public void handleSliderEvents(GValueControl slider, GEvent event){
}

void fileSelect(File selection){
  if(selection == null){
    System.out.println("No image selected");
  }
  else{
    System.out.println("User selected " + selection.getAbsolutePath());
    imagePath = selection.getAbsolutePath();
    image = loadImage(imagePath);
    if(image == null){
      System.out.println("Image failed to load");
    }
  }
}
void setup(){
  size(1470,1000);
  selectInput("Choose an image to edit:", "fileSelect");
  slider = new GCustomSlider(this, 50, 50, 400, 100, "grey_blue");
  slider.setShowValue(true);
  slider.setShowLimits(true);
  slider.setLimits(38, 0, 100);
  slider.setNbrTicks(11);
  slider.setShowTicks(true);
  slider.setEasing(6.0);
  slider.setNumberFormat(G4P.INTEGER, 0);
  slider.setOpaque(true);
  background(200,200,220);
}
void draw(){
  background(200,200,220);
  if(image != null){
    image.resize(300,300);
    image(image,600,300);  
  }
}
