class Stadium {
  final int MAX_PUNTUATION = 5;
  int puntuation1;
  int puntuation2;
  int _width;
  int _height;
  color background;
  int separation;
  
  Stadium(int _width1 , int _height1, int _background, int _separation){
    this.puntuation1 = 0;
    this.puntuation2 = 0;
    this._width = _width1;
    this._height = _height1;
    this.background = _background;
    this.separation = _separation;
  }
  
  void Draw(){
    noStroke();
    fill(background);
    rectMode(CORNER);
    rect(0,0, _width, _height);
    
    //LIMITS
    stroke(255);
    strokeWeight(4);
    line(separation, 0, separation, _height-separation);
    line(separation, _height-separation, _width-separation, _height-separation);
    line(_width-separation, _height-separation, _height-separation, 0);
    
    //PUNTUATIONS
    fill(255);
    textSize(150);
    text(puntuation2, 3*separation, (height/2)-150);
    text("-", 4*separation, height/2);
    text(puntuation1, 3*separation, (height/2)+150);
    
    
    //CENTER
    stroke(255);
    fill(background);
    strokeWeight(4);
    circle(_width/2, 0, _height/3);
    
    //GOAL
    stroke(255);
    strokeWeight(4);
    line((_width/4), _height-separation, (_width/4), _height-(_height/4));
    line((_width/4), _height-(_height/4),3*(_width/4), _height-(_height/4));
    line(3*(_width/4), _height-separation, 3*(_width/4), _height-(_height/4));
  }
}
