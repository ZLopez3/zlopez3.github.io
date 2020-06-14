/*
  Quinn Terry & Zac Lopez-Ibanez
 Title: Gunslinger
 4/30/18
 CSCI 182
 
 Our version of a classic western shoot em up game. 
 players move up and down trying to shoot eachother.
 They each have 6 rounds at a given time and 6 lives before the game ends.
 
 
 */
int GSY = -150;
PFont font, titleFont;
PImage img1, img2, gunman, gunman2, titleScreen, GunSlingerTitle, heart, gameBackground;
PImage bulletLeft, bulletRight;
import processing.sound.*;
SoundFile file, shot, yeeHaw;

int numberOfBullets = 6;
int numhearts = 6;
int warpOn;
int warpX, warpY;

// player 1  vars
int player1heath =  6;
int player1X, player1Y;
int P1bulletSpeed = 12;
boolean [] P1bullets = new boolean [numberOfBullets];
int [] P1bulletPOSx= new int [numberOfBullets];
int [] P1bulletPOSy= new int [numberOfBullets];
boolean [] P1b = new boolean [6];
int [] P1bulletX = new int [6];
int [] P1bulletY = new int [6]; 
boolean [] P1heart = new boolean [numhearts];
int [] P1heartX = new int [numhearts];
int [] P1heartY = new int [numhearts];
boolean p1shake;

// player 2 vars
int player2heath =  6;
int player2X, player2Y;
int P2bulletSpeed = 12;
boolean [] P2bullets = new boolean [numberOfBullets];
int [] P2bulletPOSx= new int [numberOfBullets];
int [] P2bulletPOSy= new int [numberOfBullets];
boolean [] P2b = new boolean [6];
int [] P2bulletX = new int [6];
int [] P2bulletY = new int [6]; 
boolean [] P2heart = new boolean [numhearts];
int [] P2heartX = new int [numhearts];
int [] P2heartY = new int [numhearts];
boolean p2shake;

//screen numbers
int screenNum;

int rectX, rectY;



boolean player1Alive, player2Alive;


void setup() {
  file = new SoundFile (this, "01_Track 01 - Conker's Pocket Tales.mp3");
  shot = new SoundFile (this, "Gun+Luger.mp3");
  yeeHaw= new SoundFile (this, "yeeHaw.mp3");
  file.play();
  titleFont=loadFont("MesquiteStd-34.vlw");
  font= loadFont ("BlackoakStd-24.vlw");
  textFont(font);
  size(1000, 600);
  titleScreen = loadImage ("GunslingerTitleCopy.png");
  GunSlingerTitle = loadImage ("TitleCopy.png");
  img1 = loadImage("bullet.png");
  heart= loadImage("heart.png");
  gunman = loadImage("gunman1.png");
  gunman2 = loadImage("gunman2.png");
  bulletLeft = loadImage("BulletLeft.png");
  bulletRight = loadImage("BulletRight copy.png");
  gameBackground = loadImage( "West.png");

  warpOn=0;
  warpX= width/2;
  warpY= height/3-50;
  player1X=150;
  player1Y=300;
  player2X=width-150;
  player2Y =300;

  rectX=0;
  rectY=0;
  screenNum=0; 
  player1Alive=true;
  player2Alive=true;

  p1shake= false;
  p2shake= false;

  // P1heart init
  for (int i = 0; i < numhearts; i++) {
    P1heart[i]= false;
  }
  for (int i = 0; i < numhearts; i++) {
    P2heart[i]= false;
  }
  P1heartX [0] = 30;
  P1heartX [1] = 65;
  P1heartX [2] = 100;
  P1heartX [3] = 135;
  P1heartX [4] = 170;
  P1heartX [5] = 205;
  for (int i = 0; i < numhearts; i++) {
    P1heartY[i]=50;
  }
  // P2heart init
  P2heartX [0] = width-60;
  P2heartX [1] = width-95;
  P2heartX [2] = width-130;
  P2heartX [3] = width-165;
  P2heartX [4] = width-200;
  P2heartX [5] = width-235;

  for (int i = 0; i < numhearts; i++) {
    P2heartY[i]=50;
  }
  //P1bullets intit
  for (int i = 0; i < 6; i++) {
    P1b[i]=false;
  }
  P1bulletX[0]=60;
  P1bulletX[1]=75;
  P1bulletX[2]=90;
  P1bulletX[3]=105;
  P1bulletX[4]=120;
  P1bulletX[5]=135;


  for (int i = 0; i < 6; i++) {
    P1bulletY[i]=height-40;
  }
  for (int i = 0; i < 6; i++) {
    P2b[i]=false;
  }
  P2bulletX[0]=width-60;
  P2bulletX[1]=width-75;
  P2bulletX[2]=width-90;
  P2bulletX[3]=width-105;
  P2bulletX[4]=width-120;
  P2bulletX[5]=width-135;


  for (int i = 0; i < 6; i++) {
    P2bulletY[i]=height-40;
  }

  for (int i=0; i < P1bullets.length; i++) {
    P1bullets[i] =false;
  }
  for (int i=0; i < P2bullets.length; i++) {
    P2bullets[i] =false;
  }
  for (int i=0; i < P1bulletPOSx.length; i++) {
    P1bulletPOSx[i]= player1X;
  }
  for (int i=0; i < P1bulletPOSy.length; i++) {
    P1bulletPOSy[i]= player1Y;
  }
  for (int i=0; i < P2bulletPOSx.length; i++) {
    P2bulletPOSx[i]= player2X;
  }
  for (int i=0; i < P2bulletPOSy.length; i++) {
    P2bulletPOSy[i]= player2Y;
  }
}// void setup close bracket



void keyPressed() {
  if (screenNum == 3 && keyCode == ENTER ) {

    // ALL globals get set back to init values (ALL OF THEM)

    player1heath =  6;
    player2heath =  6;

    screenNum = 0;
    file.play();
    player1Alive = true;
    player2Alive = true;
    P1bulletSpeed = 8;
    P2bulletSpeed = 8;
    player1X=150;
    player1Y=300;
    player2X=width-150;
    player2Y =300;

    for (int i = 0; i < 6; i++) {
      P1b[i]=false;
    }
    P1bulletX[0]=60;
    P1bulletX[1]=75;
    P1bulletX[2]=90;
    P1bulletX[3]=105;
    P1bulletX[4]=120;
    P1bulletX[5]=135;


    for (int i = 0; i < 6; i++) {
      P1bulletY[i]=height-40;
    }
    for (int i = 0; i < 6; i++) {
      P2b[i]=false;
    }
    P2bulletX[0]=width-60;
    P2bulletX[1]=width-75;
    P2bulletX[2]=width-90;
    P2bulletX[3]=width-105;
    P2bulletX[4]=width-120;
    P2bulletX[5]=width-135;


    for (int i = 0; i < 6; i++) {
      P2bulletY[i]=height-40;
    }

    for (int i=0; i < P1bullets.length; i++) {
      P1bullets[i] =false;
    }
    for (int i=0; i < P2bullets.length; i++) {
      P2bullets[i] =false;
    }
    for (int i=0; i < P1bulletPOSx.length; i++) {
      P1bulletPOSx[i]= player1X;
    }
    for (int i=0; i < P1bulletPOSy.length; i++) {
      P1bulletPOSy[i]= player1Y;
    }
    for (int i=0; i < P2bulletPOSx.length; i++) {
      P2bulletPOSx[i]= player2X;
    }
    for (int i=0; i < P2bulletPOSy.length; i++) {
      P2bulletPOSy[i]= player2Y;
    }
  }
  if (screenNum == 2 && keyCode == ENTER ) {
    // ALL globals get set back to init values (ALL OF THEM)

    player1heath =  6;
    player2heath =  6;

    file.play();
    screenNum = 0;
    player1X=150;
    player1Y=300;
    player2X=width-150;
    player2Y =300;
    for (int i = 0; i < 6; i++) {
      P1b[i]=false;
    }
    P1bulletX[0]=60;
    P1bulletX[1]=75;
    P1bulletX[2]=90;
    P1bulletX[3]=105;
    P1bulletX[4]=120;
    P1bulletX[5]=135;


    for (int i = 0; i < 6; i++) {
      P1bulletY[i]=height-40;
    }
    for (int i = 0; i < 6; i++) {
      P2b[i]=false;
    }
    P2bulletX[0]=width-60;
    P2bulletX[1]=width-75;
    P2bulletX[2]=width-90;
    P2bulletX[3]=width-105;
    P2bulletX[4]=width-120;
    P2bulletX[5]=width-135;


    for (int i = 0; i < 6; i++) {
      P2bulletY[i]=height-40;
    }
    player1Alive = true;
    player2Alive = true;
    P1bulletSpeed = 8;
    P2bulletSpeed = 8;
    for (int i=0; i < P1bullets.length; i++) {
      P1bullets[i] =false;
    }
    for (int i=0; i < P2bullets.length; i++) {
      P2bullets[i] =false;
    }
    for (int i=0; i < P1bulletPOSx.length; i++) {
      P1bulletPOSx[i]= player1X;
    }
    for (int i=0; i < P1bulletPOSy.length; i++) {
      P1bulletPOSy[i]= player1Y;
    }
    for (int i=0; i < P2bulletPOSx.length; i++) {
      P2bulletPOSx[i]= player2X;
    }
    for (int i=0; i < P2bulletPOSy.length; i++) {
      P2bulletPOSy[i]= player2Y;
    }
  }
  if (screenNum == 0 && keyCode == ENTER ) {
    screenNum=1;
    yeeHaw.play();
  }
}// keyPressed close bracket
void keyReleased() {
  //player 1 movement

  if ((key == 's' || key == 'S')&& player1Y >= 150 && player1Y<= 450) {
    player1Y+=150;
  } else if ((key == 'w' || key == 'W')&& player1Y >= 150 && player1Y <= 450) {
    player1Y-=150;
  } else if (key == 'd' || key == 'D') {
    //<body>   // player 1 firing a bullet

    // makes the gun shot sound when d is pressed 
    for ( int i=0; i< 6; i++) {
      if (key == 'd' && P1b[i] ==false && screenNum==1 ) {
        shot.play();
      }
    }

    // find an unfired bullet (with boolean currently false) and fire it (turn its boolean true)
    for (int i = 0; i < numberOfBullets; i++) {
      if (P1bullets[i] == false) { // we found an unfired bullet
        P1bullets[i] = true; // make that bullet fired now
        P1bulletPOSx[i] = player1X; // set the bullet's current coordinates to the player's X position
        P1bulletPOSy[i] = player1Y;// set the bullet's current coordinates to the player's Y position
        break; // stops the loop
      }
    }
    // find a bullet in the holster and make it disappear if a bullet is drawn
    for (int i = 0; i < 6; i++) {
      if (P1b[i] == false) { // we found an unfired bullet
        P1b[i] = true; // make that bullet fired now
        break;// stops the loop
      }
    }
  }

  //player 2 movement
  if (keyCode == UP && player2Y >= 150 && player2Y <= 450) {
    player2Y-=150;
  } else if (keyCode == DOWN && player2Y >= 150 && player2Y <= 450) {
    player2Y+=150;
  } else if (keyCode == LEFT) {

    // plays gunshot sound when LEFT is pressed.
    for ( int i=0; i< 6; i++) {
      if (keyCode == LEFT && P2b[i] ==false&& screenNum==1 ) {
        shot.play();
      }
    }
    // find an unfired bullet (with boolean currently false) and fire it (turn its boolean true)
    for (int i = 0; i < numberOfBullets; i++) {
      if (P2bullets[i] == false) { // we found an unfired bullet
        P2bullets[i] = true; // make that bullet fired now
        P2bulletPOSx[i] = player2X; // set the bullet's current coordinates to the player's X position
        P2bulletPOSy[i] = player2Y;// set the bullet's current coordinates to the player's Y position
        break;// stops the loop
      }
    }
    // find a bullet in the holster and make it disappear if a bullet is drawn
    for (int i = 0; i < 6; i++) {
      if (P2b[i] == false) { // we found an unfired bullet
        P2b[i] = true; // make that bullet fired now
        break;// stops the loop
      }
    }
  }
}// keyReleased close bracket



// background function
void westernTheme(int x, int y) {
  //main background color
  x=0;
  y=0;
  fill(147, 101, 40);
  rect(x, y, width, height);


  //the three shooting lanes
  fill(232, 184, 122);
  rect(rectX+100, height/3-100, 800, 100, 50);
  rect(rectX+100, height/3+50, 800, 100, 50);
  rect(rectX+100, height/3+200, 800, 100, 50);
}// void westerntheme close bracket


void draw() {
  //background(204);
  image(gameBackground, 0, 0, 1000, 625);
  println(screenNum);

  //player 1 doesn't go past the highest and lowest lanes
  if ( player1Y <150) {
    player1Y=150;
  }
  if (player1Y>450) {
    player1Y=450;
  }
  // playr 2 doesn't go past highest and lowest lanes
  if ( player2Y <150) {
    player2Y=150;
  }
  if (player2Y>450) {
    player2Y=450;
  }



  //westernTheme(0, 0);
  // the actual background


  // makes the gunshot sound at the begining of the game.
  if ( screenNum == 0 && frameCount == 250) {
    shot.play();
  }



  //current player1 and 2
  if (player1Alive==true) {
    fill(230, 50, 50);
    image(gunman, player1X-25, player1Y-25, 50, 50);
    //ellipse(player1X, player1Y, 20, 20);
  }
  if (player2Alive==true) {
    fill(88, 214, 234);
    image(gunman2, player2X-25, player2Y-25, 50, 50);
    // ellipse(player2X, player2Y, 20, 20);
  }

  //player 1 hearts are drawn
  for (int i=0; i< player1heath; i++) {

    image(heart, P1heartX[i], P1heartY[i], 30, 30);
  }

  //player 2 hearts are drawn
  for (int i=0; i< player2heath; i++) {

    image(heart, P2heartX[i], P2heartY[i], 30, 30);
  }


  //6 bullets in the holster for Player1
  for (int i=0; i< 6; i++) {
    if (P1b[i]==false) {
      image(img1, P1bulletX [i], P1bulletY[i], 15, 41);
    }
  }

  //6 bullets in the holster for Player2
  for (int i=0; i< 6; i++) {
    if (P2b[i]==false) {
      image(img1, P2bulletX [i], P2bulletY[i], 15, 41);
    }
  }
  // player 1 bullets are drawn and they move
  for (int i = 0; i < numberOfBullets; i++) {
    if (P1bullets[i]==true ) {
      image(bulletLeft, P1bulletPOSx[i]+15, P1bulletPOSy [i]-5, 20, 15);
      // rectMode(CENTER);
      //fill(255);
      //rect(P1bulletPOSx[i]+5, P1bulletPOSy [i], 10, 10, 8);
      //fill(0);
      //rect(P1bulletPOSx[i], P1bulletPOSy [i], 10, 10);
      P1bulletPOSx[i] +=P1bulletSpeed;
    }
  }

  // player 2 bullets are drawn and they move
  for (int i = 0; i < numberOfBullets; i++) {
    if (P2bullets[i]==true ) {
      image(bulletRight, P2bulletPOSx[i]-30, P2bulletPOSy [i]-5, 20, 15);
      // rectMode(CENTER);
      // fill(255);
      // rect(P2bulletPOSx[i]-5, P2bulletPOSy [i], 10, 10, 8);
      // fill(0);
      // rect(P2bulletPOSx[i], P2bulletPOSy [i], 10, 10);
      P2bulletPOSx[i] -=P2bulletSpeed;
    }
  }


  //If player1 bullets go past player2 it disappears and returns to its starting position 
  for (int i=0; i<numberOfBullets; i++) {
    if (P1bulletPOSx[i] > player2X) {
      P1bullets[i]=false;
      P1b[i]=false; // holster bullets reappear
      // P1bulletX[0]=60;// holster X pos are reset
      //P1bulletX[1]=75;
      //P1bulletX[2]=90;
      //P1bulletX[3]=105;
      //P1bulletX[4]=120;
      //P1bulletX[5]=135;
      //P1bulletY[i]=height-40; // holster bullets are reset in Y pos
      P1bulletPOSx [i] = player1X;
      P1bulletPOSy [i] = player1Y;
    }
  }
  //If player2 bullets go past player1 it disappears and returns to its starting position 
  for ( int i=0; i<numberOfBullets; i++) {
    if (P2bulletPOSx[i] < player1X) {
      P2bullets[i]=false;
      P2b[i]=false; // holster bullets reappear
      // P2bulletX[0]=width-60;// holster X pos are reset
      //P2bulletX[1]=width-75;
      //P2bulletX[2]=width-90;
      //P2bulletX[3]=width-105;
      //P2bulletX[4]=width-120;
      //P2bulletX[5]=width-135;
      // P2bulletY[i]=height-40; // holster bullets are reset in Y pos
      P2bulletPOSx [i] = player2X;
      P2bulletPOSy [i] = player2Y;
    }
  }

  //if any of the P2 bullets hits player 1, player 1 losses a life
  for (int i=0; i<numberOfBullets; i++) {
    if ( dist(P2bulletPOSx[i], P2bulletPOSy [i], player1X, player1Y) < 5 && player1heath>0) {
      //P1heart [i]=true;
      player1heath --;
    }
  }


  //if any of the P1 bullets hits player 2, player 2 losses a life
  for (int i=0; i<numberOfBullets; i++) {
    if ( dist(P1bulletPOSx[i], P1bulletPOSy[i], player2X, player2Y) < 5 && player2heath> 0  ) {
      //P2heart [i] =  true;
      player2heath --;
    }
  }




  // if player 1 hits player 2 six times

  for (int i=0; i<numberOfBullets; i++) {
    if ( player2heath<1) {
      P1bullets [i]= false;
      P1bulletPOSx [i] = player1X;
      P1bulletPOSy [i] = player1Y;
      player2Alive=false;
      P2bulletSpeed = 0;
      screenNum=3;
      shot.stop();
    }
  }
  // if player 2 hits player 1 six times
  for (int i=0; i<numberOfBullets; i++) {
    if (  player1heath<1) {
      P1bullets [i]= false;
      P2bulletPOSx [i] = player2X;
      P2bulletPOSy [i] = player2Y;
      player1Alive=false;
      P2bulletSpeed = 0;
      screenNum=2;
      shot.stop();
    }
  }








  rectMode(CORNER);

  /*
  //warp 
   if (frameCount%120 ==1) {
   fill(0);
   if ((int)random(0, 5)==0) {
   warpOn=0;
   } else if ((int)random(0, 5)==1) {
   warpOn=1;
   } else if ((int)random(0, 5)==2) {
   warpOn=2;
   } else { 
   warpOn=3;
   }
   }
   switch (warpOn) {
   case 0:
   fill(0);
   ellipse(warpX, warpY, 10, 100);
   
   break;
   case 1:
   fill(0);
   ellipse(warpX, warpY+150, 10, 100);
   
   break;
   case 2:
   fill(0);
   ellipse(warpX, warpY+300, 10, 100);
   
   break;
   case 3:
   
   break;
   }// switch warpOn close bracket
   
   */


  switch (screenNum) {

  case 0:
    shot.stop();
    image(titleScreen, 0, 0);

    image(GunSlingerTitle, 117, GSY);

    GSY+=2;

    if (GSY>50) {
      GSY=51;
    }
    fill(0);
    textFont(titleFont);
    textAlign(CENTER);
    text("Welcome! \n Press Enter to Start", width/2, height-250); 
    text("player1: Up=W , Down=S, Fire=D", width/2, height-185);
    text("player2: Up=UP, Down=DOWN, Fire=LEFT", width/2, height-155);

    break;

  case 1:
/*
    fill(255, 0, 0);

    for (int i=0; i< 6; i++){
      if ( screenNum==1 &&  (P2bulletPOSx[i]< player2X-40 || P1bulletPOSx[i]>player1X+40) ) {
        text("FIGHT!", width/2, height/2);
      }
    }
*/
    break;

  case 2:
    textFont(font);
    fill(0);
    rect(0, 0, width, height);
    fill(255);
    textAlign (CENTER);
    text( "Player 2 Wins! \n Winner Winner Chicken Dinner! \n Press Enter to Play Again", width/2, height/2);
    file.stop();
    break;

  case 3:// player 2 loses payer 1 wins
    fill(0);
    rect(0, 0, width, height);
    fill(255);
    textAlign (CENTER);
    text( "Player 1 Wins \n Winner Winner Chicken Dinner! \n Press Enter to Play Again", width/2, height/2);
    file.stop();
    break;
  }
}// void draw close bracket