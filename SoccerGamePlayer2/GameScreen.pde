class GameScreen
{
  Ball ball;
  Player player;
  Stadium stadium;
  IntList paletteColoursStadium;
  int separation = 10;
  boolean tooLate = false;
  boolean yourTurn = false;
  boolean started = false;
  boolean scoredGoal = false;
  boolean endGame = false;
  boolean resultSaved = false;
  int scoredByPlayer = 2;
  int countdown = 3;
  
  Button bttnReturn;
  
  //GAME MANAGER 
  FSM game;
  
  GameScreen(FSM _game){
    this.game = _game;
    
    //STADIUM
    paletteColoursStadium = new IntList();
    fillPalleteColurStadium();
    int indexColour = int(random(paletteColoursStadium.size()));
    stadium = new Stadium(width, height, paletteColoursStadium.get(indexColour), separation);
    
    //BALL
    ball = new Ball(width/2, 0);
    ball.y = round(ball.size/2);
    ball.angle = 180 - ball.angle; //left
    //ball.angle = 35; //right
    ball.updateDisplacement();
    
    //PLAYER
    player = new Player(width/2, height - (height/4), "player2.png");
    player.x = (width/2) - (player.img.width/2);
    
    bttnReturn = new Button(width/2, (2*(height/4))+(3*170)+(170/2), 800, 250, "RETURN");
  }
  
  void Draw(){
    stadium.Draw();
    if(started){
      if(!scoredGoal)
      {
        if(yourTurn){
          ball.x += ball.displacementX;
          ball.y += ball.displacementY;
          ball.Draw();
        }
        
        player.Draw();
        
        if(yourTurn){
          if( (ball.x-round(ball.size/2)) <= 0 || (ball.x+round(ball.size/2)) >= width){ //COLLISION LATERALS
            ball.angle = 180 - ball.angle;
            ball.updateDisplacement();
          }
          
          if(!tooLate && player.isWithIn(ball.x-round(ball.size/2), ball.y-round(ball.size/2))){ //COLLISION BALL WITH THE PLAYER
            ball.angle = 360 - ball.angle;
            ball.updateDisplacement();
            tooLate = false;
          }
          else {
            if(ball.y >= player.y+round(player.img.height/4)){
              tooLate = true;
            }
          }
          
          if(tooLate && ball.y+round(ball.size/2) >= height) //GOAL COLLISION
          {
            stadium.puntuation2 = stadium.puntuation2+1;
            
            OscMessage msgPuntuation = new OscMessage("puntuation");
            msgPuntuation.add(stadium.puntuation2);
            oscP5.send(msgPuntuation, remoteLocation);
            
            scoredGoal = true;
            scoredByPlayer = 1;
            
            if(stadium.puntuation2 == stadium.MAX_PUNTUATION){
              started = false;
              endGame =  true;
            }
            else {
              endGame =  false;
            }
          }
         
          
          if(ball.y-round(ball.size/2) < 0){
            OscMessage msgBall = new OscMessage("ball");
            msgBall.add((int)width);
            msgBall.add(ball.x);
            msgBall.add(ball.direction);
            oscP5.send(msgBall, remoteLocation);
            
            yourTurn = false;
            tooLate = false;
          }
        }
        
        if(mousePressed){
          if(mouseX != width/2){
            if(mouseX < width/2){
              if(player.x >= separation){
                player.x = player.x - player.speed;
              }
            }
            else {
              if(player.x <= width-(width/3)-4*separation){
                player.x = player.x + player.speed;
              }
            }
          }
        }
      }
      else 
      {
        pushStyle();
        fill(255);
        stroke(255);
        textSize(170);
        textAlign(CENTER,CENTER);
        text("PLAYER "+scoredByPlayer+"\nHAS SCORED", width/2, height/2);
        popStyle();
        tooLate = false;
        resetOriginalPositions();
        scoredGoal = false;
      }
    }
    else {
      if(endGame){
          pushStyle();
          fill(255);
          stroke(255);
          textSize(170);
          textAlign(CENTER,CENTER);
          int winner = stadium.puntuation1 > stadium.puntuation2 ? 2 : 1;
          text("END GAME", width/2, (2*(height/4)));
          text("WINNER", width/2, (2*(height/4))+170);
          text("PLAYER "+winner, width/2, (2*(height/4))+(2*170));
          popStyle();
          started = false;
          if(!resultSaved)
          {
            if(db.connect())
            {
              db.execute("INSERT into scores (`time`,`player1`,`player2`) "+
              "VALUES ('"+System.currentTimeMillis()+"', '"+stadium.puntuation1+"', '"+stadium.puntuation2+"')");   
            }
            resultSaved = true;
          }
          bttnReturn.Draw();
      }
      else{
        if(countdown >= 0 && countdown <= 3)
        {
          pushStyle();
          fill(255);
          stroke(255);
          textSize(200);
          textAlign(CENTER,CENTER);
          if(countdown != 0)
          {
            text(countdown, width/2, height/2);
          }
          else
          {
            text("GO!", width/2, height/2);
          }
          popStyle();
          delay(1500);
          countdown = countdown - 1;
        }else{
          started = true;
        }
      }
    }
  }
  void resetGameScreen(){
    tooLate = false;
    yourTurn = false;
    started = false;
    scoredGoal = false;
    endGame = false;
    resultSaved = false;
    scoredByPlayer = 2;
    countdown = 3;
    
    //STADIUM
    paletteColoursStadium = new IntList();
    fillPalleteColurStadium();
    int indexColour = int(random(paletteColoursStadium.size()));
    stadium = new Stadium(width, height, paletteColoursStadium.get(indexColour), separation);
    
    //BALL
    ball = new Ball(width/2, 0);
    ball.y = round(ball.size/2);
    ball.angle = 180 - ball.angle; //left
    //ball.angle = 35; //right
    ball.updateDisplacement();
    
    //PLAYER
    player = new Player(width/2, height - (height/4), "player2.png");
    player.x = (width/2) - (player.img.width/2);
    
    
    bttnReturn = new Button(width/2, (2*(height/4))+(3*170)+(170/2), 800, 250, "RETURN");
  }
  
  void resetOriginalPositions(){
    //BALL
    ball.x = width/2;
    ball.y = round(ball.size/2);
    ball.angle = 145; //left
    //ball.angle = 35; //right
    ball.updateDisplacement();
    
    //PLAYER
    player.x = (width/2) - (player.img.width/2);
  }
  
  void fillPalleteColurStadium(){
    paletteColoursStadium.append(color(192, 57, 43));
    paletteColoursStadium.append(color(236, 112, 99));
    paletteColoursStadium.append(color(175, 122, 197));
    paletteColoursStadium.append(color(165, 105, 189));
    paletteColoursStadium.append(color(84, 153, 199));
    paletteColoursStadium.append(color(93, 173, 226));
    paletteColoursStadium.append(color(72, 201, 176));
    paletteColoursStadium.append(color(69, 179, 157));
    paletteColoursStadium.append(color(82, 190, 128));
    paletteColoursStadium.append(color(88, 214, 141));
    paletteColoursStadium.append(color(244, 208, 63));
    paletteColoursStadium.append(color(245, 176, 65));
    paletteColoursStadium.append(color(235, 152, 78));
    paletteColoursStadium.append(color(220, 118, 51));
    paletteColoursStadium.append(color(93, 109, 126));
    paletteColoursStadium.append(color(86, 101, 115));
  }
}

void oscEvent(OscMessage oscMessage){
  if(oscMessage.addrPattern().equals("puntuation")){
    int _puntuation = oscMessage.get(0).intValue();
    game.gameScreen.stadium.puntuation1 = _puntuation;
    
    if(game.gameScreen.stadium.puntuation1 == game.gameScreen.stadium.MAX_PUNTUATION){
      game.gameScreen.started = false;
      game.gameScreen.endGame =  true;
    }
    else {
      game.gameScreen.endGame =  false;
    }
    game.gameScreen.scoredGoal = true;
    game.gameScreen.scoredByPlayer=2;
  }
  else if (oscMessage.addrPattern().equals("ball")){
    int _width = oscMessage.get(0).intValue();
    int _x = oscMessage.get(1).intValue();
    int _direction = oscMessage.get(2).intValue();
    
    _x = (int) map(_x, 0, _width, 0, width);
    
    
    
    game.gameScreen.ball.y = round(game.gameScreen.ball.size/2);
    game.gameScreen.ball.direction = _direction == Ball.LEFT ? Ball.RIGHT : Ball.LEFT;
    game.gameScreen.ball.angle = _direction == Ball.LEFT ? 145 : 35;
    
    game.gameScreen.ball.updateDisplacement();
    game.gameScreen.yourTurn = true;
    game.gameScreen.tooLate = false;
  }
}
