class Button {
  int x;
  int y;
  int width1;
  int height1;
  color color1;
  String name;
  color colorName;
  int sizeName;
  
  Button(int _x, int _y, int _width, int _height, String _name){
    x = _x;
    y = _y;
    width1 = _width;
    height1 = _height;
    name = _name;
    color1 = #bec2cb;
    colorName = #000000;
    sizeName = 50;
  }
  
  void Draw(){
    pushStyle();
    rectMode(CENTER);
    fill(color1);
    stroke(0);
    strokeWeight(8);
    rect(x, y, width1,height1);
    
    
    fill(colorName);
    stroke(colorName);
    textAlign(CENTER,CENTER);
    textSize(sizeName);
    text(name, x, y);
    popStyle();
  }
  
  boolean isClicked(int _x, int _y){
    boolean result = false;
    if ((_x >= x && _x <= (x+width1)) && (_y >= y && _y <= (y+height1))){  
      result = true;
    }
    return result;
  }
}
