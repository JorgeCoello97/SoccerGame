class Player {
  int x;
  int y;
  int speed;
  PImage img;

  Player(int _x , int _y, String url){
    this.x = _x;
    this.y = _y;
    this.img = loadImage(url);
    this.speed = 25;
  }
  
  void Draw(){
    imageMode(CORNER);
    image(img, x, y);
  }
  
  void Draw(int _x, int _y){
    this.x = _x;
    this.y = _y;
    imageMode(CORNER);
    image(img, _x, _y);
  }
  
  public boolean isWithIn(int _x , int _y)
  {
    if(_x >= x && _x <= x +img.width && _y >= y && _y <= y +round(img.height/4))
    {
      return true;
    }else
    {
      return false;
    }
  }
}
