class TitleState extends State{
  void drawState(){
    textFont(font,40);
    fill(80,41,211);
    text("Dance Dance Revolution Science Club ver.", width*0.5, height*0.5);
    //use controlP5 or what
    text("曲選択", width-100, height*0.5);
    fill(200,200,200,100);
    rect(width-200, height*0.3, 200, height*0.4);
    //text("Press 'z' key to start", width*0.5, height*0.7);
  }
  
  State decideState(){
    //if(keyPressed && key=='z'){
    if((xr>width-200 && xr<width && yr>height*0.3 && yr<height*0.7)||(xl>width-200 && xl<width && yl>height*0.3 && yl<height*0.7)){  
        stateflag = 1;
        return new TransitState();
    }
    return this;
  }
}