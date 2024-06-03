PImage img;
PImage output;
import g4p_controls.*;
GCustomSlider slider;
int curr;
String[] names;
Kernel[] kernels;
int name;

void setup(){
  size(1800,800);
   img = loadImage("main-image.jpeg");
  output = img.copy();
    image(img, 0, 0);
stroke(255);
  flip();

  curr = 0;
  
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
  
  textSize(32);



    slider = new GCustomSlider(this, 50, 50, 400, 100, "grey_blue");
  slider.setShowValue(true);
  slider.setShowLimits(true);
  slider.setLimits(38, 0, 100);
  slider.setNbrTicks(11);
  slider.setShowTicks(true);
  slider.setEasing(6.0);
  slider.setNumberFormat(G4P.INTEGER, 0);
  slider.setOpaque(true);
  
  crop();
   GButton btn = new GButton(this, 100, 90, 96, 32, "A button");
   

}


void kern() {
   kernels[curr].apply(img, output);
image(img, 0, 0);
image(output, img.width, 0);
text(names[name], width / 2 + 20, 50);

}
 

void draw() {
    drawl();

  if(keyPressed) {
  for(int i = 0; i <= 7; i++) {
    if(key == str(i).charAt(0)) {
            kern();

      curr = i;
      name = i;
      break;
    }
  }

}

}

void drawl() {
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

void flip () {
    image(img, 0, 0);
    pushMatrix();
    scale(-1.0, 1.0);
    image(img, -img.width, 0);
    popMatrix();
}
