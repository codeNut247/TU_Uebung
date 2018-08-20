public final int dLEFT = 1;
public final int dRIGHT = 2;
public final int dUP = 3;
public final int dDOWN = 4;

class SnakeModel {
  float singleFieldSquareSize;
  int currentDirection;
  // head
  PVector prevLocation;
  PVector headLocation;
  ArrayList<PVector> body;
  
  SnakeModel(PVector screensize, int bodysize, int singleFieldSquareSize) {
    currentDirection = dRIGHT;
    this.singleFieldSquareSize = singleFieldSquareSize;
    this.headLocation = new PVector(random(screensize.x/4, 3*(screensize.x/4)), 
                                    random(screensize.y/4, 3*(screensize.y/4)));
    prevLocation = new PVector();
    // Initialize Body
    body = new ArrayList<PVector>();
    for(int i = 1; i <= bodysize; i++) {
      body.add(new PVector(this.headLocation.x - i*singleFieldSquareSize,
                           this.headLocation.y));
    }
  }
  
  void Move(int direction){
    //if(direction != currentDirection) {
      this.currentDirection = direction;
      this.prevLocation = new PVector(this.headLocation.x, this.headLocation.y);
      switch(direction) {
        case dLEFT:
          if(currentDirection != dRIGHT) {this.headLocation.x -= this.singleFieldSquareSize;adjustBody();}
          break;
        case dRIGHT:;
          if(currentDirection != dLEFT) {this.headLocation.x = (this.headLocation.x + this.singleFieldSquareSize) % width;adjustBody();}
          break;
        case dUP:
          if(currentDirection != dDOWN) {this.headLocation.y -= this.singleFieldSquareSize;adjustBody();}
          break;
        case dDOWN:
          if(currentDirection != dUP) {this.headLocation.y += this.singleFieldSquareSize;adjustBody();}
          break;
      }
    //}
  }
  
  void adjustBody() {
    for(int i = this.body.size() -1 ; i >= 0; i--) {
      if(i != 0) {
        PVector nextlink = this.body.get(i-1);
        // copy position from next link to current link
        this.body.set(i, nextlink);
      }else {
        // if last link, then take preveous head position
        this.body.set(i, this.prevLocation);
      }
    }
  }
  
  void Display() {
    fill(231, 182, 134);
    for(int i = 1; i <= this.body.size(); i++) {
      PVector link = this.body.get(i - 1);
      rect(link.x, link.y, singleFieldSquareSize, singleFieldSquareSize);
    }
    fill(24, 53, 2);
    rect(this.headLocation.x, this.headLocation.y, 
         singleFieldSquareSize, singleFieldSquareSize);
  }
  
}
