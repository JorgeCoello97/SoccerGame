
class MainScreen
{
  PImage imgLogo;
  int widthImage = 1000;
  int heightImage = 800;
  color colorBackground = #5d8d5d;
  Button bttnPlay, bttnHelp, bttnScores, bttnExit;
  
  //GAME MANAGER
  FSM game;
  
  MainScreen(FSM _game)
  {
    this.game = _game;
    
    imgLogo = loadImage("logo1.png");
    
    bttnPlay = new Button((width/2), heightImage+(heightImage/2)+(heightImage/4), 800, 250, "PLAY");
    
    bttnHelp = new Button((width/2), (heightImage+(heightImage/2)+(heightImage/4))+300, 800, 250, "HELP");
    
    bttnScores = new Button((width/2), (heightImage+(heightImage/2)+(heightImage/4))+2*300, 800, 250, "SCORES");
    
    bttnExit = new Button((width/2), (heightImage+(heightImage/2)+(heightImage/4))+3*300, 800, 250, "EXIT");
    
  }
  
  void Draw()
  {
    background(colorBackground);
    
    imageMode(CENTER);
    image(imgLogo, width/2, height/4, widthImage,heightImage);
    
    bttnPlay.Draw();
    bttnHelp.Draw();
    bttnScores.Draw();
    bttnExit.Draw();
    
  }
}
