class ScoreScreen
{
  Button bttnReturn;
  color colorTable;
  color colorRow;
  color colorBackground = #5d8d5d;
  //GAME MANAGER
  FSM game;
  
  ScoreScreen(FSM _game)
  {
    this.game = _game;
    
    this.colorTable = #4a503d;
    this.colorRow = #8e9775;
    
    this.bttnReturn = new Button(width/2, (height/2)+2*(height/6), 800, 250, "RETURN");
  }
  
  void Draw()
  {
    background(colorBackground);
    if(db.connect())
    {
      db.query(SELECT_DB_SQL);
      long numData = db.getRecordCount("scores");
      if(numData > 0){
        int numRows;
        if (numData == 1){
          numRows = 1;
        }
        else if (numData == 2){
          numRows = 2;
        }
        else {
          numRows = 3;
        }
        int widthTable = (width/2)+(width/4);
        int heightRow = (height/12);
        int heightTable = (1 + numRows) * heightRow;
        
        rectMode(CENTER);
        stroke(0);
        strokeWeight(8);
        fill(colorTable);
        rect(width/2, height/2, widthTable,  heightTable);
         //HEADER
        Cell headerPlayer1 = new Cell((width/2)-(widthTable/2), (height/2)-(heightTable/2),(widthTable/2), heightRow, colorTable, "PLAYER 2");
        headerPlayer1.Draw();
        
        Cell headerPlayer2 = new Cell(headerPlayer1.nextCell(), (height/2)-(heightTable/2),(widthTable/2), heightRow, colorTable, "PLAYER 1");
        headerPlayer2.Draw();
        if (numData == 1){
          //VALUE #1
          db.next();
          String cell1_value1 = str(db.getInt("player1"));
          String cell1_value2 = str(db.getInt("player2"));
          Cell cell1_player1 = new Cell((width/2)-(widthTable/2), headerPlayer1.nextRow(),(widthTable/2), heightRow, colorRow, cell1_value1);
          cell1_player1.Draw();
          
          Cell cell1_player2 = new Cell(cell1_player1.nextCell(), headerPlayer1.nextRow(),(widthTable/2), heightRow, colorRow, cell1_value2);
          cell1_player2.Draw();
        }
        else if (numData == 2){
          //VALUE #1
          db.next();
          String cell1_value1 = str(db.getInt("player1"));
          String cell1_value2 = str(db.getInt("player2"));
          Cell cell1_player1 = new Cell((width/2)-(widthTable/2), headerPlayer1.nextRow(),(widthTable/2), heightRow, colorRow, cell1_value1);
          cell1_player1.Draw();
          
          Cell cell1_player2 = new Cell(cell1_player1.nextCell(), headerPlayer1.nextRow(),(widthTable/2), heightRow, colorRow, cell1_value2);
          cell1_player2.Draw();
          
           //VALUE #2
           db.next();
          String cell2_value1 = str(db.getInt("player1"));
          String cell2_value2 = str(db.getInt("player2"));
          Cell cell2_player1 = new Cell((width/2)-(widthTable/2), cell1_player1.nextRow(),(widthTable/2), heightRow, colorRow, cell2_value1);
          cell2_player1.Draw();
          
          Cell cell2_player2 = new Cell(cell2_player1.nextCell(), cell1_player1.nextRow(),(widthTable/2), heightRow, colorRow, cell2_value2);
          cell2_player2.Draw();
        }
        else {
          //VALUE #1
          db.next();
          String cell1_value1 = str(db.getInt("player1"));
          String cell1_value2 = str(db.getInt("player2"));
          Cell cell1_player1 = new Cell((width/2)-(widthTable/2), headerPlayer1.nextRow(),(widthTable/2), heightRow, colorRow, cell1_value1);
          cell1_player1.Draw();
          
          Cell cell1_player2 = new Cell(cell1_player1.nextCell(), headerPlayer1.nextRow(),(widthTable/2), heightRow, colorRow, cell1_value2);
          cell1_player2.Draw();
          
          //VALUE #2
          db.next();
          String cell2_value1 = str(db.getInt("player1"));
          String cell2_value2 = str(db.getInt("player2"));
          Cell cell2_player1 = new Cell((width/2)-(widthTable/2), cell1_player1.nextRow(),(widthTable/2), heightRow, colorRow, cell2_value1);
          cell2_player1.Draw();
          
          Cell cell2_player2 = new Cell(cell2_player1.nextCell(), cell1_player1.nextRow(),(widthTable/2), heightRow, colorRow, cell2_value2);
          cell2_player2.Draw();
          
          //VALUE #3
          db.next();
          String cell3_value1 = str(db.getInt("player1"));
          String cell3_value2 = str(db.getInt("player2"));
          Cell cell3_player1 = new Cell((width/2)-(widthTable/2), cell2_player1.nextRow(),(widthTable/2), heightRow, colorRow, cell3_value1);
          cell3_player1.Draw();
          
          Cell cell3_player2 = new Cell(cell3_player1.nextCell(), cell2_player1.nextRow(),(widthTable/2), heightRow, colorRow, cell3_value2);
          cell3_player2.Draw();
        }
      }
      else{
        textAlign(CENTER,CENTER);
        textSize(100);
        stroke(0);
        text("There aren't scores yet.",width/2, height/2);
      } 
    }
    
    bttnReturn.Draw();
  }
}
