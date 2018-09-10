class GameModel {
  int gameSquares = 20;
  int currentDirection;
  
  boolean isGameOver;
  
  Button btn_ReInit;  
  SnakeModel snake;
  
  GameModel() {
    ReInitialize();
  }
  
  void Run() { //<>// //<>//
    if (snake.IsColliding() == true) {
      GameOver();
    }else{
      snake.Move(currentDirection);
      snake.Display();
    }
  }
  
  private void ReInitialize() {
    snake = new SnakeModel(new PVector(width, height), 10, height/gameSquares);
    btn_ReInit = new Button("Play Again", width/3, 3*height/4, 200, 50);
    // INIT Direction
    this.currentDirection = dRIGHT;
  }
  
  private void GameOver() {
    this.isGameOver = true;
    background(0);
    textSize(100);
    fill(#FF5A5A);
    text("GAME OVER", width/6, height/2);
    textSize(20);
    btn_ReInit.Draw();
  }
  
  public void btn_ReInit_Click(float mouse_X, float mouse_Y){
    if (this.btn_ReInit.MouseIsOver(mouse_X, mouse_Y)) {
      this.ReInitialize();
    }
  }
  
}
