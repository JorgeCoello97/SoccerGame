
class MainScreen
{
  PImage imgLogo;
  color colorBackground = #5d8d5d;
  Button bttnPlay, bttnHelp, bttnScores, bttnExit;
  
  //GAME MANAGER
  FSM game;
  
  MainScreen(FSM _game)
  {
    this.game = _game;
    
    imgLogo = loadImage("logo2.png");
    
    bttnPlay = new Button(width/2, 2*(height/4), 800, 200, "PLAY");
    
    bttnHelp = new Button(width/2, (2*(height/4))+(250), 800, 200, "HELP");
    
    bttnScores = new Button(width/2, (2*(height/4))+(2*250), 800, 200, "SCORES");
    
    bttnExit = new Button(width/2, (2*(height/4))+(3*250), 800, 200, "EXIT");
  }
  
  void Draw()
  {
    background(colorBackground);
    
    imageMode(CENTER);
    image(imgLogo, width/2, height/4, width - (2*(width/4)),width - (2*(width/4)) - (width/6));
    
    bttnPlay.Draw();
    bttnHelp.Draw();
    bttnScores.Draw();
    bttnExit.Draw();
  }
}
