import java.util.*;
void setup(){
  size(800,800);
  background(0);
  for(int i=0; i<3; i++)
  Arrays.fill(a[i],-1);
}
boolean chance=false,justfinished=false,finished=false,vertical=false,horizontal=false,aDiagonal=false,bDiagonal=false;
int a[][]= new int[3][3];
int c=0;
float x1,y1,x2,y2;
void draw(){
  display();
  
  if(!finished&&c>=9||matched()){
    for(int i=0; i<3; i++){
      for(int j=0; j<3; j++){
        if(a[i][j]==-1){
          a[i][j]=100;
        }
      }
    }
    //print("Game finished");
    justfinished=true;
    finished=true;
  }
  if(justfinished){
    stroke(255);
    strokeWeight(15);
    print(x1+" "+y1+"g "+x2+" "+y2+" "+horizontal+" "+vertical+" "+"\n");
    if(horizontal)
    line(20+130+x1*260-100,20+130-5+y1*260,20+130+x2*260+100,20+130-5+y2*260);
    else if(vertical)
    line(20+130+x1*260-10,20+130+y1*260-100,20+130+x2*260-10,20+130+y2*260+100);
    else if(aDiagonal){
     line(50,50,800-50,800-50);
    }else if(bDiagonal){
     line(800-50,50,50,800-50);
    }
    justfinished=false;
  }
}
boolean matched(){
  if(!finished){
  int temp=0;
  boolean match=false;
  for(int i=0; i<3; i++){
    if(a[i][0]!=-1){
     temp=a[i][0];
     match=true;
    }
    for(int j=1; j<3; j++){ 
     if(a[i][j]!=temp){
       match=false;
       break;
     }
    }
    if(match){
      horizontal=true;
      vertical=false;
      x1=0;
      y1=i;
      x2=2;
      y2=i;
      return true;
    }
  }
  match=false;
  for(int i=0; i<3; i++){
    if(a[0][i]!=-1){
     temp=a[0][i];
     match=true;
    }
    for(int j=1; j<3; j++){ 
     if(a[j][i]!=temp){
       match=false;
       break;
     }
    }
    if(match){
      vertical=true;
      horizontal=false;
      x1=i;
      y1=0;
      x2=i;
      y2=2;
      return true;
    }
  }
  if(a[0][0]!=-1){
    temp=a[0][0];
    if(a[1][1]==temp&&a[2][2]==temp){
      aDiagonal=true;
      return true;
    }
  }
  if(a[0][2]!=-1){
    temp=a[0][2];
    if(a[1][1]==temp&&a[2][0]==temp){
      bDiagonal=true;
      return true;
    }
  }
  }
  return false;
}
void keyPressed(){
  if(key==' '){
    background(0);
    display();
    for(int i=0; i<3; i++)
     Arrays.fill(a[i],-1);
    chance=false;finished=false;vertical=false;horizontal=false;aDiagonal=false;bDiagonal=false;justfinished=false;
    c=0;
    x1=0;
    x2=0;
    y1=0;
    y2=0;
  }
  //7
  if(key==55){
    
    if(a[0][0]==-1){
      c++;
    drawsign(146,146,0,0);
    }
  }//8
  if(key==56){
    if(-1==a[0][1]){
    drawsign(400,146,0,1);
    c++  ;
  }
  }//9
  if(key==57){
    if(-1==a[0][2]){
      c++;
    drawsign(253.33+400+0,146,0,2);
    }
  }//4
  if(key==52){
    if(-1==a[1][0]){
      c++;
    drawsign(146,400,1,0);
    }
  }
  //5
  if(key==53){
    if(-1==a[1][1]){
      c++;
    drawsign(400,400,1,1);
    }
  }
  //6
  if(key==54){
    if(-1==a[1][2]){
    drawsign(253.33+400+0,400,1,2);
    c++;}
  }
  //1
  if(key==49){
    if(-1==a[2][0]){
      c++;
    drawsign(146,400+266.67,2,0);
    }
  }//2
  if(key==50){
    if(-1==a[2][1]){
      c++;
    drawsign(400,400+266.67,2,1);
    }
  }//3
  if(key==51){
    if(-1==a[2][2]){
      c++;
    drawsign(253.33+400+0,400+266.67,2,2);
    }
  }
}
void drawsign(float x,float y,int x1,int y1){
  stroke(255);
  if(chance){
   line(x-75,y-75,x+75,y+75);
   line(x+75,y-75,x-75,y+75);
   a[x1][y1]=1;
   chance=false;
  }else{
    fill(0);
    circle(x,y,150);
    chance=true;
    a[x1][y1]=2;
    //stroke(0);
    //circle(400,400,140);
  }
}
void display(){
  stroke(255);
  strokeWeight(5);
  for(int i=1; i<=2; i++){
      line(i*266.6,20,i*266.6,780);
  }
  for(int j=1; j<=2; j++){
      line(20,j*266.6,780,j*266.6);

  }
}
