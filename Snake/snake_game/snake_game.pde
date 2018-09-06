SnakeModel snake;
GameModel game;

void setup() {
 size(800, 800);
 game = new GameModel(new PVector(width, height));
 game.currentDirection = dRIGHT;
}

void draw() {
  background(205);
  
  game.Run();
  
  delay(200);
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
