SnakeModel snake;
GameModel game;

void setup() {
 size(800, 800);
 game = new GameModel();
}

void draw() {
  background(205);
  
  game.Run();
  
  delay(100);
}

void mousePressed(){
  if (mouseButton == LEFT) {
    if(game.isGameOver){
      game.btn_ReInit_Click(mouseX, mouseY);
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      game.currentDirection = dUP;
    } else if (keyCode == DOWN) {
      game.currentDirection = dDOWN;
    } else if (keyCode == LEFT) {
      game.currentDirection = dLEFT;
    } else if (keyCode == RIGHT) {
      game.currentDirection = dRIGHT;
    } 
  }
}
