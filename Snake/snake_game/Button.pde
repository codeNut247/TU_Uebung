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
    stroke(0);
  }
  
  boolean MouseIsOver(float mouse_X, float mouse_Y) {
    if (mouse_X > x && mouse_X < (x + w) && mouse_Y > y && mouse_Y < (y + h)) {
      return true;
    }
    return false;
  }
}
