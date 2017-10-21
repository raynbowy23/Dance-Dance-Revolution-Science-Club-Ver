/*
  Code written by raynbowy23
*/

State state;

PFont font;

import ddf.minim.analysis.*;
import ddf.minim.*;
import KinectPV2.KJoint;
import KinectPV2.*;
KinectPV2 kinect;

//set music for the number of music
//String[] songs = {"\"Angel.mp3\"", "\"youkai.mp3\"", "\"ultrasoul.mp3\"", "\"sakuranbo\"", "\"onenight\""};
String[] songs = new String[10];

Minim minim;
AudioPlayer[] player = new AudioPlayer[songs.length];
AudioPlayer missed;
AudioMetaData[] meta = new AudioMetaData[songs.length];//get audio meta data

float mills[] = new float[songs.length];    //initialize song's length
String title[] = new String[songs.length];  //initialize song's title
String author[] = new String[songs.length]; //initialize song's author
int specSize[] = new int[songs.length];     //initialize song's spectle size

int mp=0; //if(mp==1); player1 else if(mp==2); player2...

float x0=960;
float y0=0;
int score=0;
int good=0;
float goodx=0;
float goody=0;
int miss=0;
float missx=0;
float missy=0;

color[] colarray={#ff0000,#00ff00,#0000ff}; //colarray[0]=KinectPV2.HandState_Closed, colarray[1]=KinectPV2.HandState_Open, colarray[2]=KinectPV2.HandState_Lasso
int col=colarray[(int)random(0,3)];
int stop=0;

int stateflag=0;

void setup()
{
  size(1920,1080,P3D);
  minim = new Minim(this); //Initialize

  //set music
  player[0] = minim.loadFile("Angel.mp3");
  player[1] = minim.loadFile("youkai.mp3");
  player[2] = minim.loadFile("ultrasoul.mp3");
  player[3] = minim.loadFile("sakuranbo.mp3");
  player[4] = minim.loadFile("onenight.mp3");
  player[5] = minim.loadFile("paradise.mp3");
  player[6] = minim.loadFile("fortune.mp3");
  player[7] = minim.loadFile("tt.mp3");
  player[8] = minim.loadFile("ryusei.mp3");
  player[9] = minim.loadFile("perfecthuman.mp3");
  
  missed = minim.loadFile("miss.mp3");
     
  font = loadFont("MS-Mincho-48.vlw");
  
  // get meta data
  
  
  for(int i=0;i<songs.length;i++){
    meta[i] = player[i].getMetaData(); 
    mills[i] = meta[i].length() / 1000;
    title[i] = meta[i].title();
    author[i] = meta[i].author();
  }
  
  textSize(50);
  textAlign(CENTER);
  strokeWeight(1);
  fill(80,41,211);
  state = new TitleState();
  
  kinect = new KinectPV2(this);
  
  kinect.enableSkeletonColorMap(true);
  kinect.enableColorImg(true);
  //kinect.enableDepthImg(true);
  
  kinect.init();
  
  //img = loadImage(pmg, a, b, b);
}

void draw()
{

  pushMatrix();
  
  background(0);
  
  //Coloring
  image(kinect.getColorImage(),0,0,width,height);
  //image(kinect.getDepthImage(),0,0,width,height);
  
  ArrayList<KSkeleton> skeletonArray = kinect.getSkeletonColorMap();
  
  //inidividual JOINTS
  for(int i=0;i<skeletonArray.size();i++){
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
    if(skeleton.isTracked()){
      KJoint[] joints = skeleton.getJoints();

      //draw different color for each hand state
      drawHandStateL(joints[KinectPV2.JointType_HandLeft]);
      drawHandStateR(joints[KinectPV2.JointType_HandRight]);
    }
  }
 
  popMatrix();
  state = state.doState();
  fill(80,41,211);
  text("Score:"+score,200,100);

}

//BodyTracking
float xr, yr, zr, xl, yl, zl; //right and left hands' coordinate

void drawHandStateR(KJoint joint){
  noStroke();
  handState(joint.getState());
  pushMatrix();
  translate(joint.getX(), joint.getY(), joint.getZ());
  xr = joint.getX();
  yr = joint.getY();
  zr = joint.getZ();
  ellipse(0,0,10,10);
  popMatrix();
}

void drawHandStateL(KJoint joint){
  noStroke();
  handState(joint.getState());
  pushMatrix();
  translate(joint.getX(), joint.getY(), joint.getZ());
  xl = joint.getX();
  yl = joint.getY();
  zl = joint.getZ();
  ellipse(0,0,10,10);
  popMatrix();
}

void handState(int handState){
  /*switch(handState){
    case KinectPV2.HandState_Open:
      fill(0,255,0);
      break;
    case KinectPV2.HandState_Closed:
      fill(255,0,0);
      break;
    case KinectPV2.HandState_Lasso:
      fill(0,0,255);
      break;
    case KinectPV2.HandState_NotTracked:
      fill(255,255,255);
      break;
   }*/
}

void reset(){
  col=colarray[(int)random(0,3)];
  y0=-50;
  x0=random(500,1420);
}

//stop player
void stop()
{
  for(int i=0;i<songs.length;i++){
    if(mp==i+1){
      player[i].close();
    }
  }
  //missed.close();

  minim.stop();
  minim.dispose();
  super.stop();
}


//3秒以上タッチでスタート
//背景作る
//ランキング作る
//音楽に合わせてボールが落ちてくる