class Cell {
  int x;
  int y;
  int width1;
  int height1;
  color color1;
  String name;
  color colorName;
  int sizeName;
  
  Cell(int _x, int _y, int _width, int _height, color colorCell, String _name){
    x = _x;
    y = _y;
    width1 = _width;
    height1 = _height;
    name = _name;
    color1 = colorCell;
    colorName = #ffffff;
    sizeName = 60;
  }
  
  void Draw(){
    pushStyle();
    rectMode(CORNER);
    fill(color1);
    stroke(0);
    strokeWeight(8);
    rect(x, y, width1,height1);
    
    
    fill(colorName);
    stroke(colorName);
    textAlign(CENTER,CENTER);
    textSize(sizeName);
    text(name, x+(width1/2), y+(height1/2));
    popStyle();
  }
  
  
  int nextCell(){
    return (x+width1);
  }
  int nextRow(){
    return (y+height1);
  }
}
