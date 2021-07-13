class HelpScreen
{
  color colorBackground = #5d8d5d;
  Button bttnReturn;
  PImage img;

  //GAME MANAGER
  FSM game;

  HelpScreen(FSM _game)
  {
    this.game = _game;

    img = loadImage("help_player1.png");
    bttnReturn = new Button(width/2, (width/12)+(height-(2*(width/6))), 800, 250, "RETURN");
  }

  void Draw()
  {
    background(colorBackground);
    imageMode(CORNER);
    image(img, width/12, width/12, width-(2*(width/12)),height-(2*(width/4)));
    bttnReturn.Draw();
  }
}