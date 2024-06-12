  import g4p_controls.*;
  PImage image;
  PImage sampleImg;
  PImage img, 
  output;
  String imagePath;
  String mode = "Choose a mode";
  String imageFailMessage = "No image selected";
  String[] names;
  PGraphics pg;
  PImage ogImage;
  int ogWidth;
  int ogHeight;
  boolean seeCropSliders = false;
  boolean seeRotate = false;
  Kernel[] kernels;
  
  
  GCustomSlider sliderImageX, sliderImageY;
  GCustomSlider sliderDraw;
  GCustomSlider sliderCropWidth, sliderCropHeight, sliderCropX, sliderCropY;
  GCustomSlider sliderRotate;
  
  void setup() {
    size(1300, 900);
    pg = createGraphics(width, height);
   // pg.beginDraw();
   // pg.text("Mode: Draw", 300, 300);
  //  pg.endDraw();
    background(200, 200, 220);
    selectInput("Choose an image to edit:", "fileSelect");

    sliderCropX = new GCustomSlider(this, 100, 300, 200, 40, "grey_blue");
    sliderCropX.setShowValue(false);
    sliderCropX.setShowLimits(false);
    sliderCropX.setLimits(500, 0, 500);
    sliderCropX.setNbrTicks(11);
    sliderCropX.setShowTicks(true);
    sliderCropX.setEasing(6.0);
    sliderCropX.setNumberFormat(G4P.INTEGER, 0);
    sliderCropX.setOpaque(false);
    sliderCropX.setVisible(false);
    
    sliderCropY = new GCustomSlider(this, 100, 400, 200, 40, "grey_blue");
    sliderCropY.setShowValue(false);
    sliderCropY.setShowLimits(false);
    sliderCropY.setLimits(500, 0, 500);
    sliderCropY.setNbrTicks(11);
    sliderCropY.setShowTicks(true);
    sliderCropY.setEasing(6.0);
    sliderCropY.setNumberFormat(G4P.INTEGER, 0);
    sliderCropY.setOpaque(false);
    sliderCropY.setVisible(false);
    
    sliderCropWidth = new GCustomSlider(this, 100, 500, 200, 40, "grey_blue");
    sliderCropWidth.setShowValue(false);
    sliderCropWidth.setShowLimits(false);
    sliderCropWidth.setLimits(500, 0,500);
    sliderCropWidth.setNbrTicks(11);
    sliderCropWidth.setShowTicks(true);
    sliderCropWidth.setEasing(6.0);
    sliderCropWidth.setNumberFormat(G4P.INTEGER, 0);
    sliderCropWidth.setOpaque(false);
    sliderCropWidth.setVisible(false);

    sliderCropHeight = new GCustomSlider(this, 100, 600, 200, 40, "grey_blue");
    sliderCropHeight.setShowValue(false);
    sliderCropHeight.setShowLimits(false);
    sliderCropHeight.setLimits(500, 0, 500);
    sliderCropHeight.setNbrTicks(11);
    sliderCropHeight.setShowTicks(true);
    sliderCropHeight.setEasing(6.0);
    sliderCropHeight.setNumberFormat(G4P.INTEGER, 0);
    sliderCropHeight.setOpaque(false);
    sliderCropHeight.setVisible(false);
    
    sliderImageX = new GCustomSlider(this, 100, 300, 200, 40, "grey_blue");
    sliderImageX.setShowValue(false);
    sliderImageX.setShowLimits(false);
    sliderImageX.setLimits(220, 200, 1000);
    sliderImageX.setNbrTicks(11);
    sliderImageX.setShowTicks(true);
    sliderImageX.setEasing(6.0);
    sliderImageX.setNumberFormat(G4P.INTEGER, 0);
    sliderImageX.setOpaque(false);

    sliderImageY = new GCustomSlider(this, 100, 400, 200, 40, "grey_blue");
    sliderImageY.setShowValue(false);
    sliderImageY.setShowLimits(false);
    sliderImageY.setLimits(220, 200, 1000);
    sliderImageY.setNbrTicks(11);
    sliderImageY.setShowTicks(true);
    sliderImageY.setEasing(6.0);
    sliderImageY.setNumberFormat(G4P.INTEGER, 0);
    sliderImageY.setOpaque(false);

    sliderRotate = new GCustomSlider(this, 100,500,200,40, "grey_blue");
    sliderRotate.setShowValue(false);
    sliderRotate.setShowLimits(false);
    sliderRotate.setLimits(38, 0, 100);
    sliderRotate.setNbrTicks(11);
    sliderRotate.setShowTicks(true);
    sliderRotate.setEasing(6.0);
    sliderRotate.setNumberFormat(G4P.INTEGER, 0);
    sliderRotate.setOpaque(false);
    sliderRotate.setVisible(false);
    
    sliderDraw = new GCustomSlider(this, 100, 500, 200, 40, "grey_blue");
    sliderDraw.setShowValue(false);
    sliderDraw.setShowLimits(false);
    sliderDraw.setLimits(5, 0, 15);
    sliderDraw.setNbrTicks(11);
    sliderDraw.setShowTicks(true);
    sliderDraw.setEasing(6.0);
    sliderDraw.setNumberFormat(G4P.INTEGER, 0);
    sliderDraw.setOpaque(false);

    //GButton btn = new GButton(this, 100, 90, 96, 32, "A button");

        names = new String[]{
    "Identity", "Blur", "Sharpen",
    "Outline", "Left Sobel", "Right Sobel",
    "Top Sobel", "Emboss"
  };

  kernels = new Kernel[] {
    new Kernel( new float[][] {
      {0, 0, 0},
      {0, 1, 0},
      {0, 0, 0}
    }) ,
    new Kernel( new float[][] {
      {0.111, .111, .111},
      {.111, .111, .111},
      {.111, .111, .111}
    }) ,
    new Kernel( new float[][] {
      {0, -1, 0},
      {-1, 5, -1},
      {0, -1, 0}
    }) ,
    new Kernel( new float[][] {
      {-1, -1, -1},
      {-1, 8, -1},
      {-1, -1, -1}
    }) ,
    new Kernel( new float[][] {
      {1, 0, -1},
      {2, 0, -2},
      {1, 0, -1}
    }) ,
    new Kernel( new float[][] {
      {-1, 0, 1},
      {-2, 0, 2},
      {-1, 0, 1}
    }) ,
    new Kernel( new float[][] {
      {1, 2,  1},
      {0, 0, 0},
      {-1, -2, -1}
    }),
    new Kernel( new float[][] {
      {-2, -1,  0},
      {-1, 1, 1},
      {0, 1, 2}
    })
  };  
}
  
  void draw() {
    background(200, 200, 220);
    textSize(20);
    text(mode, 20, 50);
    
  if(!seeCropSliders){
    sliderImageX.setVisible(true);
    sliderImageY.setVisible(true);
    sliderRotate.setVisible(true);
    sliderDraw.setVisible(true);
    fill(0);
    textSize(12);
    textAlign(LEFT, CENTER);
    text("Image Width", 20, 300);
    text("Image Height", 20, 400);
    text("Pen Thickness", 20, 500);    
  }
  else if(seeRotate){
    sliderImageX.setVisible(false);
    sliderImageY.setVisible(false);
    sliderDraw.setVisible(false);
    sliderCropX.setVisible(false);
    sliderCropY.setVisible(false);
    sliderCropWidth.setVisible(false);
    sliderCropHeight.setVisible(false);
    sliderRotate.setVisible(true);
    seeCropSliders = false;
    fill(0);
    textSize(12);
    textAlign(LEFT, CENTER);
    text("Rotate", 20, 300);
  }
   else{
    sliderImageX.setVisible(false);
    sliderImageY.setVisible(false);
    sliderRotate.setVisible(false);
    sliderDraw.setVisible(false);
    fill(0);
    textSize(12);
    textAlign(LEFT, CENTER);
    text("X-Coord", 20, 300);
    text("Y-Coord", 20, 400);
    text("Crop Width", 20, 500);
    text("Crop Height", 20,600);
  }
    
    if (image != null) {
      imageMode(CENTER);
      image(image, 690, 450, sliderImageX.getValueI(), sliderImageY.getValueI());

  } 
    else {
      sampleImg = loadImage("test.jpeg");
      image = sampleImg;
      imageMode(CENTER);
      image(image, 690, 450, sliderImageX.getValueI(), sliderImageY.getValueI());
    }
    
    if (mode.equals("Mode: Draw")) {
      if (mousePressed) {
        pg.beginDraw();
        pg.stroke(0);
        pg.strokeWeight(sliderDraw.getValueI());
        pg.line(pmouseX, pmouseY, mouseX, mouseY);
        pg.endDraw();
      }
    }
    
    if (mode.equals("Mode: Crop")) {
      mode = "Mode: Cropping...";
      seeCropSliders = true;
      sliderCropX.setVisible(true);
      sliderCropY.setVisible(true);
      sliderCropWidth.setVisible(true);
      sliderCropHeight.setVisible(true);
    }
    
      if (mode.equals("Mode: Rotate")) {
      mode = "Mode: Rotating...";
      seeRotate = true;
      sliderRotate.setVisible(true);
      
    }
     image(pg, 655, 450);
  }
  
  void keyPressed() {
    img = image;
    if (keyPressed) {
      if (keyCode == 67) { //crop C
        mode = "Mode: Crop";
        seeCropSliders = true;
        sliderCropX.setVisible(true);
        sliderCropY.setVisible(true);
        sliderCropWidth.setVisible(true);
        sliderCropHeight.setVisible(true);
      }
      else if(keyCode == ENTER){
        if(seeCropSliders){
          crop();
          sliderCropX.setVisible(false);
          sliderCropY.setVisible(false);
          sliderCropWidth.setVisible(false);
          sliderCropHeight.setVisible(false);
          seeCropSliders = false;
          mode = "Mode: Cropped";
        }
      }
      if (keyCode == 88) { //contrast X
        mode = "Mode: Contrast";
        kernels[1].apply(img, img);
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
        rotate(image);
        seeRotate = true;
        sliderRotate.setVisible(true);
        sliderCropX.setVisible(false);
        sliderCropY.setVisible(false);
        sliderCropWidth.setVisible(false);
        sliderCropHeight.setVisible(false);
        sliderImageX.setVisible(false);
        sliderImageY.setVisible(false);
        sliderDraw.setVisible(false);
      }
      if (keyCode == UP) { //invert
       mode = "Mode: Vertical Invert";
       invertUp(image);
      }
      if (keyCode == DOWN) {
        mode = "Mode: Vertical Invert";
        invertDown(image);
      }
      if (keyCode == LEFT) {
        mode = "Mode: Horizontal Invert";
       invertLeft(image);
      }
      if (keyCode == RIGHT) {
        mode = "Mode: Horizontal Invert";
        invertRight(image);
      }
      if (keyCode == BACKSPACE) { //clears drawing only
        mode = "Mode: Cleared";
        background(200, 200, 220);
        pg.beginDraw();
        pg.clear();
        pg.endDraw();
        mode = "Mode: Draw";
      }
      if (keyCode == 32 ) { //resets everything
        background(200, 200, 220);
        mode = "Mode: Reset";
        pg.beginDraw();
        pg.clear();
        pg.endDraw();
        image = ogImage.copy();
        seeCropSliders = false; 
        seeRotate = false;
        sliderCropX.setVisible(false);
        sliderCropY.setVisible(false);
        sliderCropWidth.setVisible(false);
        sliderCropHeight.setVisible(false);
        sliderRotate.setVisible(false);

        sliderImageX.setValue(ogWidth);
        sliderImageY.setValue(ogHeight);
      }
    }
  }
  
  public void handleSliderEvents(GValueControl slider, GEvent event) {
  }
  
  void fileSelect(File selection) {
    if (selection == null) {
      System.out.println("Sample Image Provided");
      sampleImg = loadImage("test.jpeg");
      ogWidth = sampleImg.width;
      ogHeight = sampleImg.height;
      image = sampleImg;
      ogImage = sampleImg.copy();
      //text(imageFailMessage, 600, 300);
    } else {
      System.out.println("User selected " + selection.getAbsolutePath());
      imagePath = selection.getAbsolutePath();
      image = loadImage(imagePath);
      ogWidth = image.width;
      ogHeight = image.height;
      if (image == null) {
        System.out.println("Image failed to load");
      }
      else{
      ogImage = image.copy();
      }
    }
  }
