//----------------Farbwerte----------------
//------Apfel------
color appleRed = color(255, 0, 0);  //Apfel
color appleBrown = color(190, 90, 30);  //Stiel des Apfels

//------Kirsche------
color cherryRed = color(255, 0, 0);   //Kirsche
color cherryGreen = color(50, 110, 25);  //"Stiehl" der Kirsche

//------Bombe------
color bombBlack = color(0);  //Bombe
color bombWhite = color(255);  //Striche (=X) auf der Bombe
color bombBrown = color(190, 90, 30);   //Zuender der Bombe
color bombFire = color(250,175,15);  //"Feuer" auf der Zundschnur der Bombe

/*void setup() {
  size(1000, 1000);
  noStroke();
}

void draw() {

  drawApple(400, 400, 500, 300);

  drawCherry(750,900,300,300,10);

  drawBomb(100, 100, 100, 100);
}*/


//----------------Funktionen----------------
//------Apfel------
void drawApple(final int POS_X, final int POS_Y, final int DELTA_X, final int DELTA_Y) {
  float circleWidth = DELTA_X/2;  //Durchmesser einer Apfelhaelfte
  float stielXBeginn = POS_X - circleWidth * 0.05;
  float stielXEnd = POS_X + circleWidth * 0.05;
  float stielYBeginn = POS_Y;
  float stielYEnd = POS_Y -DELTA_X * 0.5;

  //---Stiel---
  fill(appleBrown);
  noStroke();
  quad(stielXBeginn, stielYBeginn, stielXEnd, stielYBeginn, stielXEnd, stielYEnd, stielXBeginn, stielYEnd);

  //---Apfel---
  fill(appleRed);
  ellipse(POS_X - circleWidth*0.25, POS_Y, circleWidth, DELTA_Y);
  ellipse(POS_X + circleWidth*0.25, POS_Y, circleWidth, DELTA_Y);
}

//------Kirsche------
void drawCherry(final int POS_X, final int POS_Y, final int DELTA_X, final int DELTA_Y, final int STIEL_SIZE) {
  float cherrySize = DELTA_X/3;   //Durchmesser einer Kirsche
  float xCherry1 = POS_X - cherrySize;   //X-Position Kirsche Links
  float xCherry2 = POS_X + cherrySize;   //X-Position Kirsche Rechts    

  //---"Stiel"---
  stroke(cherryGreen);
  strokeWeight(STIEL_SIZE);
  line(xCherry1, POS_Y, POS_X, POS_Y - 0.6 * DELTA_Y);
  line(xCherry2, POS_Y, POS_X, POS_Y - 0.6 * DELTA_Y);

  //---Kirsche---
  fill(cherryRed);
  noStroke();
  ellipse(xCherry1, POS_Y, cherrySize, DELTA_Y * 0.4 );
  ellipse(xCherry2, POS_Y, cherrySize, DELTA_Y * 0.4 );
}

//------Bombe------
//###ACHTUNG###
//Zuender der Bombe geht ueber Delta_Y hinaus
void drawBomb(final int POS_X, final int POS_Y, final int DELTA_X, final int DELTA_Y) {
  //---Zuender---
  stroke(bombBrown);
  strokeWeight(DELTA_X * 0.1);
  line(POS_X, POS_Y, POS_X + DELTA_X * 0.1, POS_Y - DELTA_Y / 1.25);
  noStroke();
  //---"Feuer"---
  fill(bombFire);
  ellipse(POS_X + DELTA_X * 0.1,POS_Y - DELTA_Y / 1.25, DELTA_X * 0.2, DELTA_Y * 0.2);
  
  //---Bombe---
  fill(bombBlack);
  ellipse(POS_X, POS_Y, DELTA_X, DELTA_Y);
  //---Kreuz auf der Bombe---
  stroke(bombWhite);
  strokeWeight(DELTA_X * 0.1);
  line(POS_X - DELTA_X / 4, POS_Y - DELTA_Y / 4, POS_X+DELTA_X / 4, POS_Y+DELTA_Y / 4);
  line(POS_X+DELTA_X / 4, POS_Y - DELTA_Y / 4, POS_X - DELTA_X /4 , POS_Y+DELTA_Y / 4);
}
