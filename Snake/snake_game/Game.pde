class GameModel {
  int gameSquares = 20;
  int currentDirection;
  
  Button button;  
  SnakeModel snake;
  
  GameModel(PVector screensize) {
    snake = new SnakeModel(screensize, 10, height/gameSquares);
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
  }
  
  private void GameOver() {
    background(0);
    textSize(100);
    fill(#FF5A5A);
    text("GAME OVER", width/6, height/2);
    textSize(20);
    button = new Button("Play Again", width/3, 3*height/4, 200, 50);
    button.Draw();
    //drawHead(width/2, 3*height/4, 100, 100);
  }
  
}


class Button {
  String label;
  float x;    // top left corner x position
  float y;    // top left corner y position
  float w;    // width of button
  float h;    // height of button
  
  Button(String labelB, float xpos, float ypos, float widthB, float heightB) {
    label = labelB;
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
  }
  
  void Draw() {
    fill(218);
    stroke(141);
    rect(x, y, w, h, 10);
    textAlign(CENTER, CENTER);
    fill(0);
    text(label, x + (w / 2), y + (h / 2));
  }
  
  boolean MouseIsOver() {
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
      return true;
    }
    return false;
  }
}
