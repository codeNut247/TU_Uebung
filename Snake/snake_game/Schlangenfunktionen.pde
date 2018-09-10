boolean hellgruen = true;  //SOll hellgruen gezeichnet werden
final color GREEN_DARK = color(0, 100, 0);
final color GREEN_BRIGHT = color(0, 150, 0);
final color HEAD_COLOR = GREEN_DARK;

//void setup() {
//  size(300, 800);
//}

//void draw() {
//  noStroke();
  
//  //**************BEISPIELDURCHLAUF**************************

//  //***KOPF***
//  drawHead(100, 100, 100, 100);

//  //***KOERPER***
//  for(int i = 0; i<5; i++){
//    drawBody(100,200+(i*100),100,100,i%2==0);
//  }
  
  //<>//
//}

//Colorcode zuruckgeben
color getColor(boolean dark) {
  if (dark) {
    return GREEN_DARK;
  }
  return GREEN_BRIGHT;
}

//Zeichnet Kopf
//x, y Koordinate
//Delta X = Breite, Delta Y = Laenge
void drawHead(final float POS_X, final float POS_Y, final float DELTA_X, final float DELTA_Y) {
  final float POS_X_END = POS_X + DELTA_X; //X-Koordinate, wo der Kopf endet
  final float POS_Y_END = POS_Y + DELTA_Y; //Y-Koordinate, wo der Kopf endet


  fill(HEAD_COLOR);


  // Kopf
  float curveX = DELTA_X/4;
  float curveY = DELTA_X/4;
  rect(POS_X, POS_Y, DELTA_X, DELTA_Y, curveX, curveY, 0, 0);

  //Augen (Gruener Kreis)
  float eyePosY = POS_Y + (DELTA_Y/2);
  float eyeDiameter = DELTA_X/2;
  float eyeSpacing = DELTA_X * 0.15; //Augen sind +/- 15% vom Kopfbreite (deltaX) entfernt
  ellipse(POS_X+eyeSpacing, eyePosY, eyeDiameter, eyeDiameter);
  ellipse(POS_X_END-eyeSpacing, eyePosY, eyeDiameter, eyeDiameter);

  //Augen (Weisser Kreis)
  float innerEyeDiameter = DELTA_X/4;
  fill(255);
  ellipse(POS_X+eyeSpacing, eyePosY, innerEyeDiameter, innerEyeDiameter);
  ellipse(POS_X_END-eyeSpacing, eyePosY, innerEyeDiameter, innerEyeDiameter);

  //Augen (Pupille)
  fill(0);
  float pupilDiameter = DELTA_X/10;
  float yPosPupil = (POS_Y + (DELTA_Y/2)) - (pupilDiameter/2); //Position schwarze Pupille. Sie ist mittig zwischen den Mittelpunkt vom weißen Auge und dem Rand des weißen Auges positioniert.
  ellipse(POS_X+eyeSpacing, yPosPupil, pupilDiameter, pupilDiameter);
  ellipse(POS_X_END-eyeSpacing, yPosPupil, pupilDiameter, pupilDiameter);

  //Zunge
  fill(255, 0, 0);
  float tongueWidth = DELTA_X/10;
  float tongueHeight = DELTA_Y/5;
  float tongueStartX = (POS_X + (DELTA_X/2)) - (tongueWidth/2);
  float tongueStartY = POS_Y - tongueHeight;
  rect(tongueStartX, tongueStartY, tongueWidth, tongueHeight);
}

void drawBody(final float POS_X, final float POS_Y, final float DELTA_X, final float DELTA_Y, final boolean DARK) {
  final float POS_X_END = POS_X + DELTA_X; //X-Koordinate, wo der Body endet
  final float POS_Y_END = POS_Y + DELTA_Y; //Y-Koordinate, wo der Body endet

  //Grundstein
  fill(getColor(DARK));
  quad(POS_X, POS_Y, POS_X, POS_Y_END, POS_X_END, POS_Y_END, POS_X_END, POS_Y);

  //Einzelnen Schattierungen (=Muster)
  //Alle diese Funktionen zeichen vom Eckpunkt des Grundsteins aus 4 Quadrate, 
  //dessen Durchmesser (=Breite) sich jedes mal halbiert.
  //Beginnend mit dem halben Koerperdurchmesser
  //Die Startfarbe aendert sich jedesmal, einmal dunkel, einmal hell
  drawBodyTopLeft(POS_X, POS_Y, DELTA_X/2, DELTA_Y/2, !DARK);
  drawBodyBottomLeft(POS_X, POS_Y_END, DELTA_X/2, DELTA_Y/2, DARK);
  drawBodyBottomRight(POS_X_END, POS_Y_END, DELTA_X/2, DELTA_Y/2, !DARK);
  drawBodyTopRight(POS_X_END, POS_Y, DELTA_X/2, DELTA_Y/2, DARK);
}

void drawBodyTopLeft(final float POS_X, final float POS_Y, float DELTA_X, final float DELTA_Y, boolean dark) {
  float pos_x_end = POS_X + DELTA_X;
  float pos_y_end = POS_Y + DELTA_Y;
  int faktor = 2;


  for (int i = 1; i<5; i++) {
    fill(getColor(dark));
    quad(POS_X, POS_Y, pos_x_end, POS_Y, pos_x_end, pos_y_end, POS_X, pos_y_end);
    dark = !dark;
    pos_x_end = POS_X + (DELTA_X/pow(faktor, i));
    pos_y_end = POS_Y + (DELTA_Y/pow(faktor, i));
  }
}

void drawBodyBottomLeft(final float POS_X, final float POS_Y, float DELTA_X, final float DELTA_Y, boolean dark) {
  float pos_x_end = POS_X + DELTA_X;
  float pos_y_end = POS_Y - DELTA_Y;
  int faktor = 2;

  for (int i = 1; i<5; i++) {
    fill(getColor(dark));
    quad(POS_X, POS_Y, pos_x_end, POS_Y, pos_x_end, pos_y_end, POS_X, pos_y_end);
    dark = !dark;
    pos_x_end = POS_X + (DELTA_X/pow(faktor, i));
    pos_y_end = POS_Y - (DELTA_Y/pow(faktor, i));
  }
}

void drawBodyBottomRight(final float POS_X, final float POS_Y, float DELTA_X, final float DELTA_Y, boolean dark) {
  float pos_x_end = POS_X - DELTA_X;
  float pos_y_end = POS_Y - DELTA_Y;
  int faktor = 2;

  for (int i = 1; i<5; i++) {
    fill(getColor(dark));
    quad(POS_X, POS_Y, pos_x_end, POS_Y, pos_x_end, pos_y_end, POS_X, pos_y_end);
    dark = !dark;
    pos_x_end = POS_X - (DELTA_X/pow(faktor, i));
    pos_y_end = POS_Y - (DELTA_Y/pow(faktor, i));
  }
}

void drawBodyTopRight(final float POS_X, final float POS_Y, float DELTA_X, final float DELTA_Y, boolean dark) {
  float pos_x_end = POS_X - DELTA_X;
  float pos_y_end = POS_Y + DELTA_Y;
  int faktor = 2;

  for (int i = 1; i<5; i++) {
    fill(getColor(dark));
    quad(POS_X, POS_Y, pos_x_end, POS_Y, pos_x_end, pos_y_end, POS_X, pos_y_end);
    dark = !dark;
    pos_x_end = POS_X - (DELTA_X/pow(faktor, i));
    pos_y_end = POS_Y + (DELTA_Y/pow(faktor, i));
  }
}
