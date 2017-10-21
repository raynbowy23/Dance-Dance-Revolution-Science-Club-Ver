class GameState extends State{
  void drawState(){    
    moveBall();
  }

  State decideState(){
    //set each songs' length from MetaData
    for(int i=0;i<songs.length;i++){
      if(mp==i+1 && t>mills[i]){
        stateflag = 4;
        return new TransitState();
      }
    }
    return this;
  }
}
void moveBall(){
  
    float y0_speed=random(10,20);  //ball falling speed
    //play music
    for(int i=0;i<songs.length;i++){
      if(mp==i+1){
        player[i].play();
      }
    }
      
    println(specSize[mp]);
    //loadPixels();
    y0 += y0_speed;
  
    smooth();
    noStroke();
  
    fill(col, 100);
    ellipse(x0,y0,100,100);        

    //display good
    //if(mouseX>x0-25 && mouseX<x0+25 && mouseY>y0-25 && mouseY<y0+25){
    if(xr>x0-75 && xr<x0+75 && yr>y0-75 && yr<y0+75){
      good=20;
      goodx=xr;
      goody=yr;
      
      reset();
      score+=10;
    }else if(xl>x0-75 && xl<x0+75 && yl>y0-75 && yl<y0+75){
      good=20;
      goodx=xl;
      goodx=yl;
      
      reset();
      score+=10;
    }
      
    if(good>0){
      fill(0);
      text("good!", goodx, goody);
      good-=1;
    }

    //display miss
    if(y0>height){
      miss=10;
      missx=x0;
      missy=height-50;
      reset();
    }
    if(miss>0){
      //missed.play();
      fill(0);
      text("miss!", missx, missy);
      miss-=1;
     // missed = minim.loadFile("miss.mp3");
    }
    
}