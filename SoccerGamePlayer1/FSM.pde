
class FSM
{
  static final int ST_MAINSCREEN = 0;
  static final int ST_GAMESCREEN = 1;
  static final int ST_HELPSCREEN = 2;
  static final int ST_SCORESCREEN = 3;
  int state;
  
  MainScreen mainScreen;
  GameScreen gameScreen;
  HelpScreen helpScreen;
  ScoreScreen scoreScreen;
  
  FSM(int _state){
    this.state = _state;
    
    mainScreen = new MainScreen(this);
    gameScreen = new GameScreen(this);
    helpScreen = new HelpScreen(this);
    scoreScreen = new ScoreScreen(this);
  }
  
  void run(){
    switch(state)
    {
      case ST_MAINSCREEN:
        mainScreen.Draw();
        break;
      case ST_GAMESCREEN:
        gameScreen.Draw();
        break;
      case ST_HELPSCREEN:
        helpScreen.Draw();
        break;
      case ST_SCORESCREEN:
        scoreScreen.Draw();
        break;
    }
  }
}

//PRESSED BUTTON MANAGER
void mousePressed(){
  switch(game.state)
  {
    case FSM.ST_MAINSCREEN:
      if(game.mainScreen.bttnPlay.isClicked(mouseX,mouseY)){
        game.state = FSM.ST_GAMESCREEN;
      }
      else if(game.mainScreen.bttnHelp.isClicked(mouseX,mouseY)){
        game.state = FSM.ST_HELPSCREEN;
      }
      else if(game.mainScreen.bttnScores.isClicked(mouseX,mouseY)){
        game.state = FSM.ST_SCORESCREEN;
      }
      else if(game.mainScreen.bttnExit.isClicked(mouseX,mouseY)){
        exit();
      }
      break;
    case FSM.ST_GAMESCREEN:
      if(game.gameScreen.bttnReturn.isClicked(mouseX,mouseY)
        && game.gameScreen.endGame)
      {
        game.state = FSM.ST_MAINSCREEN;
        game.gameScreen.resetGameScreen();
      }
      break;
    case FSM.ST_HELPSCREEN:
      if(game.helpScreen.bttnReturn.isClicked(mouseX,mouseY))
      {
        game.state = FSM.ST_MAINSCREEN;
      } 
      break;
    case FSM.ST_SCORESCREEN:
      if(game.scoreScreen.bttnReturn.isClicked(mouseX,mouseY))
      {
        game.state = FSM.ST_MAINSCREEN;
      } 
      break;
  }
}
