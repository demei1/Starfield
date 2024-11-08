class Stars {
  double myX, myY, myColor,mySize, myAngle, mySpeed;
  Stars(){
  myAngle = (Math.random()*2)*Math.PI;
  myX = width/2;
  myY = height/2; 
  mySize =  (int)(Math.random()*3)+10;
  myColor = (int)(Math.random()*255)+1;
  mySpeed = (int)(Math.random()*5);
}
  void move(){
  
  myX = myX + Math.cos(myAngle)*mySpeed;
  myY = myY + Math.sin(myAngle)* mySpeed;
  if (myX > width || myY > height || myX <0 || myY < 0){
    myX = width/2;
    myY = height/2;
  }
  }
  void show(){
  stroke((int)myColor);
  fill((int)myColor);
  ellipse((int)myX, (int)myY, (int) mySize, (int)mySize);
  }

}


class coolStars extends Stars{
  coolStars(){
  myAngle = (Math.random()*2)*Math.PI;
  myX = width/2;
  myY = height/2; 
  mySize =  (int)(Math.random()*3)+50;
  myColor = color((int)(Math.random()*25)+151, (int)(Math.random()*25)+151, (int)(Math.random()*206));
  mySpeed = (int)(Math.random()*5)+1;
  }
    void show(){
    noFill();
    stroke((int)myColor);
    arc ((float)myX, (float)myY, (float)mySize, (float)mySize, (float)(myAngle), (float)(myAngle + Math.random()*PI));
    
    }
    void move(){
    mySize = mySize + mySpeed;
    if (mySize > 700){
      mySize = 0;
    }
    }
    
  }

class ship{
    double myX, myY, myAngle, radius;
    ship(){
    myX = 300;
    myY = 300;
    radius = 150;
    myAngle = Math.random()*PI;
    }
    
    
    void move(){
      
    myAngle += .01;
    
    }
    
    void show(){
      
    stroke(131, 130, 125);
    strokeWeight(5);
    //bottom
    line ((float) myX, (float) myY, (float)(myX + cos((float)myAngle) *radius), (float)(myY + sin((float)myAngle) * radius));
    // top
    line ((float) myX, (float) myY, (float)(myX + cos((float)myAngle) *radius), (float)(myY - 25 +sin((float)myAngle) * radius));
    //left side
    line ((float) myX, (float) myY, (float)(myX - 25 + cos((float)myAngle) *radius), (float)(myY - 25 +sin((float)myAngle) * radius));
    //right side
    line ((float) myX, (float) myY, (float)(myX + 25 + cos((float)myAngle) *radius), (float)(myY - 25 +sin((float)myAngle) * radius));
    //left side dip
    line ((float)(myX - 25 + cos((float)myAngle) *radius), (float)(myY - 25 +sin((float)myAngle) * radius), (float)(myX - 15 + cos((float)myAngle) *radius), (float)(myY - 15 +sin((float)myAngle) * radius));
    // right side dip
    line ((float)(myX + 25 + cos((float)myAngle) *radius), (float)(myY - 25 +sin((float)myAngle) * radius), (float)(myX + 15 + cos((float)myAngle) *radius), (float)(myY - 15 +sin((float)myAngle) * radius));
    //connect the dips
    line ((float)(myX - 15 + cos((float)myAngle) *radius), (float)(myY - 15 +sin((float)myAngle) * radius), (float)(myX + 15 + cos((float)myAngle) *radius), (float)(myY - 15 +sin((float)myAngle) * radius));
    //connect top and bottom
    line ((float)(myX  + cos((float)myAngle) *radius), (float)(myY -25 +sin((float)myAngle) * radius), (float)(myX  +cos((float)myAngle) *radius), (float)(myY + sin((float)myAngle) * radius));

    
    }
    
  }
  
  
  
  
ship coolShip = new ship();
Stars [] army = new Stars[100];
void setup (){
  size (600,600);
  noStroke();
  for (int i = 0; i < 10; i ++){
  army[i] = new coolStars();
  }
  for (int i = 10; i< army.length; i++){
  army[i] = new Stars();
  }
}
void draw(){
  background(#786C93);
  for (int i = 0 ; i < army.length; i++){
  army[i].move();
  army[i].show();
  
  }
  coolShip.show();
  coolShip.move();
}
