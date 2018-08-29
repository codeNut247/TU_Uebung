class GameModel {
  int gameSquares = 20;
  int currentDirection;
  
  SnakeModel snake;
  
  GameModel(PVector screensize) {
    snake = new SnakeModel(screensize, 10, height/gameSquares);
  }
  
  void Run() {
    snake.Move(currentDirection);
    snake.Display();
  }
}
