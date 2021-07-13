class Ball {
  static final int LEFT = 0;
  static final int RIGHT = 1;
  int x;
  int y;
  int speed;
  int angle;
  int size;
  double displacementX = 0;
  double displacementY = 0;
  int direction;
  Ball(int _x , int _y){
    this.x = _x;
    this.y = _y;
    this.speed = 20;
    this.angle = 35;
    this.direction = RIGHT; //RIGHT:145º, LEFT:35º
    this.size = 150;
  }
  
  void Draw(){
    pushStyle();
    
    fill(0);
    stroke(0);
    circle(x,y,size);
    popStyle();
  }
  
  void Draw(int _x, int _y){
    this.x = _x;
    this.y = _y;
    Draw();
  }
  
  public boolean isWithIn(int _x , int _y)
  {
    
    if
    (
      (_x >= (x-round(size/2)) && _x <= (x+round(size/2)))
      &&
      (_y >= (y-round(size/2)) && _y <= (y+round(size/2)))
    )
    {
      return true;
    }
    else {
      return false;
    }
  }
  
  void updateDisplacement(){
    
    direction = (direction == Ball.LEFT) ? RIGHT : LEFT; 
    
    double radians = angle * Math.PI / 180;
    displacementX = cos((float)radians) * speed;
    displacementY = sin((float)radians) * speed;
  }
}
