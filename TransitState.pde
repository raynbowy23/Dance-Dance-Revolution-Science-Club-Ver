//transit display
class TransitState extends State{
  void drawState(){
    fill(0);
    text("Loading...", width*0.5,height*0.5);
  }
  State decideState(){
    if(t>3){
      switch(stateflag){
        case 1:
          return new MusicState();
        case 2:
          return new GameState();
        case 3:
          return new TitleState();
        case 4:
          return new EndingState();
      }
    }
  return this;
  }
}