// make ranking
//Ending display
class EndingState extends State{
  void drawState(){
    text("Finished", width*0.5, height*0.5);
    if(t>5){
      text("Score:"+score, width*0.5, height*0.3);
      //text("Press 'a' to restart.", width*0.5, height*0.7);
      /*
      textFont(font, 40);
      text("もう一度", width-100, height*0.5);       //right
      text("タイトルへ", 100, height*0.5);       //left
      fill(200,200,200,100);
      rect(width-200, height*0.3, 200, height*0.4);  //right
      rect(0, height*0.3, 200, height*0.4);          //left
      try{
        Runtime r = Runtime.getRuntime();
        Process process = r.exec("processing-java --run --sketch=DDRSVer.pde --output=DDRSVer.pde --force");
      }catch(Exception e){
        println(e);
      }
     
      if(mp==1){
        player1=minim.loadFile("Angel.mp3");
      }else if(mp==2){
        player2=minim.loadFile("youkai.mp3");
      }else if(mp==3){
        player3=minim.loadFile("ultrasoul.mp3");
      }
      */
    }
  }
  
  State decideState(){
    //if(t>5 && keyPressed && key=='a'){
    /*
    if(t>5 && ((xr>width-200 && xr<width && yr>height*0.3 && yr<height*0.7) || (xl>width-200 && xl<width && yl>height*0.3 && yl<height*0.7))){
      stateflag = 2; //GameState
      score=0;
      return new TransitState();
    }
    if(t>5 && ((xr>0 && xr<200 && yr>height*0.3 && yr<height*0.7) || (xl>0 && xl<200 && yl>height*0.3 && yl<height*0.7))){
      stateflag = 3;  //Back to Title
      musicflag = 1;  //reset musicflag もう一回最初の曲選択から
      score=0;
      return new TransitState();
    }
    */
    if(t>15){
      kinect.dispose();
      exit();
    }
    
    return this;
  }
}