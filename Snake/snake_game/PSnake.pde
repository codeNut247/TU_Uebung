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
  float head_rotation_radians;
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
          if(currentDirection != dRIGHT)                                               // OR GameOver?
          {this.headLocation.x -= this.singleFieldSquareSize;if(this.headLocation.x<0){this.headLocation.x = width;};adjustBody();head_rotation_radians=radians(270);}
          break;
        case dRIGHT:;
          if(currentDirection != dLEFT) 
          //{this.headLocation.x = (this.headLocation.x + this.singleFieldSquareSize) % width;adjustBody();}
          {this.headLocation.x += this.singleFieldSquareSize;if(this.headLocation.x>=width){this.headLocation.x = 0;};adjustBody();head_rotation_radians=2*PI/4;}
          break;
        case dUP:
          if(currentDirection != dDOWN) 
          {this.headLocation.y -= this.singleFieldSquareSize;if(this.headLocation.y<0){this.headLocation.y = height;};adjustBody();head_rotation_radians=2*PI;}
          break;
        case dDOWN:
          if(currentDirection != dUP) 
          //{this.headLocation.y = (this.headLocation.y + this.singleFieldSquareSize) % height;adjustBody();}
          {this.headLocation.y += this.singleFieldSquareSize;if(this.headLocation.y>=height){this.headLocation.y = 0;};adjustBody();head_rotation_radians=PI;}
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
      drawBody(link.x, link.y,singleFieldSquareSize, singleFieldSquareSize,i%2==0);
    }
    fill(24, 53, 2);
    rotateHeadAndDraw();
  }
  
  private void rotateHeadAndDraw(){
    pushMatrix();
    translate(this.headLocation.x + singleFieldSquareSize/2, this.headLocation.y + singleFieldSquareSize/2);
    rotate(head_rotation_radians);
    drawHead(0 - singleFieldSquareSize/2, 0 - singleFieldSquareSize/2, singleFieldSquareSize, singleFieldSquareSize);
    popMatrix();
  }
  
}
