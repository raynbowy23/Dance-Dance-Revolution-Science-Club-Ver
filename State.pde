abstract class State{
  long t_start;
  float t;
  
  State(){
    t_start = millis();
  }
  
  State doState(){
    t = (millis() - t_start) / 1000.0;
    //text(nf(t,1,3) + "sec.", width * 0.5, height * 0.9);
    drawState();
    return decideState();
  }
  
  abstract void drawState(); // explicit view response to state
  abstract State decideState(); // transit to next state
}