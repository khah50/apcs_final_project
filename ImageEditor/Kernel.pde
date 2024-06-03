public class Kernel {
  float[][]kernel;

  /**Constructor takes the kernel that will be applied to the image
  *This implementation only allows 3x3 kernels
  */
  public Kernel(float[][]init) {
    kernel = init;
    
  }

  /**If part of the kernel is off of the image, return black, Otherwise
  *Calculate the convolution of r/g/b separately, and return that color\
  *if the calculation for any of the r,g,b values is outside the range
  *     0-255, then clamp it to that range (< 0 becomes 0, >255 becomes 255)
  */
  color calcNewColor(PImage img, int x, int y) {
    int red = 0;
    int blue = 0;
    int green = 0;
    for (int r = -1; r <= 1; r++) {
       for(int c = -1; c <= 1; c++) {
         int xadd = x + r;
         int yadd = y + c;
         
         if(xadd >= 0 && xadd < img.width && yadd >= 0 && yadd < img.height) { // check within pixels
           int newX = r + 1;
           int newY = c + 1;
           red += kernel[newX][newY] * red(img.get(xadd, yadd));
            blue += kernel[newX][newY] * blue(img.get(xadd, yadd));
            green += kernel[newX][newY] * green(img.get(xadd, yadd));

         } else {
           red = 0;
           blue = 0;
           green = 0;
         }

       }
     }

    red = Math.min(255, red);
    red = Math.max(0, red);
    green = Math.min(255, green);
    green = Math.max(0, green);
    blue = Math.min(255, blue);
    blue = Math.max(0, blue);

    return color(red, green, blue);

  }

  

  /**Apply the kernel to the source,
  *and saves the data to the destination.*/
  void apply(PImage source, PImage destination) {
    for (int i = 0; i < source.width; i++) {
      for(int j = 0; j < source.height; j++) {
        color fincol = calcNewColor(source, i, j);
        destination.set(i, j, fincol);
      }
    }
    
  }

}
