int musicflag = 1;
//Select Musics
class MusicState extends State{
  void drawState(){
    
    textFont(font, 40);
    text("次の曲", width-100, height*0.5);        //right
    text("前の曲", 100, height*0.5);        //left
    text("決定", width*0.5, 100);            //top
    fill(200,200,200,100);
    rect(width-200, height*0.3, 200, height*0.4);  //right
    rect(0, height*0.3, 200, height*0.4);    //left
    rect(width*0.3, 0, width*0.4, 200);      //top

    textSize(60);
    fill(80,41,211);
    for(int i=0;i<songs.length;i++){
      if(musicflag==i+1){
        text(i+1 + " of " + songs.length, width*0.5, height*0.3);
        text(title[i], width*0.5, height*0.5);
        text("--"+author[i], width*0.6, height*0.6);
        text("(" + int(mills[i]/60) + "分" + int(mills[i]%60) + "秒" + ")", width*0.6, height*0.7);
      }
    }
  }
  
  State decideState(){
    //if push top "Decide"
    if((xr>width*0.3 && xr<width*0.7 && yr>0 && yr<200) || (xl>width*0.3 && xl<width*0.7 && yl>0 && yl<200)){
      for(int i=0;i<songs.length;i++){
        if(musicflag==i+1){
          continue;
        }else{
          player[i].close();
        }
      }
      mp = musicflag; //その時の画面の曲を選択
      stateflag = 2;  //go to GameState
      return new TransitState();
    }
    //if push right button
    if((xr>width-200 && xr<width && yr>width*0.3 && yr<width*0.7) || (xl>width-200 && xl<width && yl>width*0.3 && yl<width*0.7)){
      if(musicflag==songs.length){
        musicflag = 1;
      }else{
        musicflag++;
      }
      stateflag = 1;  //back to MusicState
      return new TransitState();
    }
    //if push left button
    if((xr>0 && xr<200 && yr>width*0.3 && yr<width*0.7) || (xl>0 && xl<200 && yl>width*0.3 && yl<width*0.7)){
      if(musicflag==1){
        musicflag = songs.length;
      }else{
        musicflag--;
      }
      stateflag = 1;  //back to MusicState
      return new TransitState();
    }
    return this;
  }
}