import ketai.net.*;
import ketai.data.*;

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress remoteLocation;
int port = 12000;
String remoteAddress = "192.168.0.159"; //customize

KetaiSQLite db;
String CREATE_DB_SQL = "CREATE TABLE scores ( time INTEGER PRIMARY KEY, player1 INTEGER NOT NULL, player2 INTEGER NOT NULL);";
String SELECT_DB_SQL = "SELECT * FROM scores ORDER BY time DESC LIMIT 3";

FSM game;

void setup()
{
  fullScreen();
  frameRate(60);
  orientation(PORTRAIT);
  
  
  //CONFIG CONNECTION
  oscP5 = new OscP5(this, port);
  remoteLocation = new NetAddress(remoteAddress, port);
  
  //SQLite
  db = new KetaiSQLite(this);
  if(db.connect()){
    if(!db.tableExists("scores")){
      db.execute(CREATE_DB_SQL);
    }
  }
  
  //GAME MANAGER
  game = new FSM(FSM.ST_MAINSCREEN);
}

void draw()
{
  game.run();
}
