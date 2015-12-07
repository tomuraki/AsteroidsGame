//your variable declarations here
SpaceShip tom=new SpaceShip();
Star[] sar;
Asteroids[] ash;
ArrayList <Asteroids> theList;
boolean leftIsPressed=false;
boolean rightIsPressed=false;
boolean upIsPressed=false;
boolean spaceIsPressed=false;

public void setup() 
{
  size(400,400);
  sar=new Star[100];
  for(int s=0; s<sar.length; s++)
  {
    sar[s]=new Star();
  }
  theList=new ArrayList <Asteroids>();
  for(int i=0; i<7; i++)
  {
    theList.add(new Asteroids());
  }
}
public void draw() 
{
  background(0);
  for(int s=0; s<sar.length; s++)
  {
    sar[s].show();
  }
  tom.show();
  tom.move();
  if(leftIsPressed==true)
  {
    tom.rotate(-2);
  }
  if(rightIsPressed==true)
  {
    tom.rotate(2);
  }
  if(upIsPressed==true)
  {
    tom.accelerate(.05);
  }
  if(spaceIsPressed==true)
  {
    tom.setX((int)(Math.random()*401));
    tom.getX();
    tom.setY((int)(Math.random()*401));
    tom.getY();
    tom.setDirectionX(0);
    tom.getDirectionX();
    tom.setDirectionY(0);
    tom.getDirectionY();
    tom.setPointDirection((int)(Math.random()*360)+1);
    tom.getPointDirection();
  }

  
  for(int i=0; i<theList.size(); i++)
  {
    theList.get(i).show();
    theList.get(i).move();
  }

  for(int i=0; i<theList.size(); i++)
    if(dist(theList.get(i).getX(),theList.get(i).getY(),tom.getX(),tom.getY())<20)
    {
      theList.remove(i);
    }

}
public void keyPressed()
  {
    if(keyCode==65) //a;turn left
      {
        leftIsPressed=true;
      }
    else if(keyCode==68) //d;turn right
      {
        rightIsPressed=true;
      }
    else if(keyCode==87) //w; accelerate foward
      {
        upIsPressed=true;
      }
    else if(keyCode==32)
    {
      spaceIsPressed=true;
    }  
  }
  public void keyReleased()
  {
    if(keyCode==65)
    {
      leftIsPressed=false;
    }
    else if(keyCode==68) 
    {
      rightIsPressed=false;
    }
    else if(keyCode==87) 
    {
      upIsPressed=false;
    }
    else if(keyCode==32)
    {
      spaceIsPressed=false;

    }
  }
  class Star
  {
    int x;
    int y;
    Star()
    {
      x=(int)(Math.random()*401);
      y=(int)(Math.random()*401);
    }
    public void show()
    {
      stroke(0);
      fill(255,255,0);
      ellipse(x,y,4,4);
    }
  }
class SpaceShip extends Floater  
{   
  public SpaceShip()
  {
    corners=4;   
    int[] xS={-8,16,-8,-2};
    int[] yS={-8,0,8,0};
    xCorners=xS;
    yCorners=yS; 
    myColor=255; 
    myCenterX=200;
    myCenterY=200;  
    myDirectionX=0;
    myDirectionY=0; 
    myPointDirection=-50; 
  }
    public void setX(int x) {myCenterX=x;}
    public int getX() {return (int)myCenterX;}
    public void setY(int y) {myCenterY=y;}
    public int getY() {return (int)myCenterY;}
    public void setDirectionX(double x) {myDirectionX=x;}
    public double getDirectionX() {return myDirectionX;}
    public void setDirectionY(double y) {myDirectionY=y;}
    public double getDirectionY() {return myDirectionY;}
    public void setPointDirection(int degrees) {myPointDirection=degrees;}
    public double getPointDirection() {return myPointDirection;}
}
class Asteroids extends Floater
{
  public Asteroids()
  {
    corners=4;
    int[] xS={-6,-4,7,-12};
    int[] yS={-5,-5,4,4};
    xCorners=xS;
    yCorners=yS;
    myColor=100;
    myCenterX=(int)(Math.random()*400)+1;
    myCenterY=(int)(Math.random()*400)+1;
    myDirectionX=(int)(Math.random()*10)-5;
    myDirectionY=(int)(Math.random()*10)-5;
    rotspeed=(int)(Math.random()*10)+1;
  }  
    public void setX(int x) {myCenterX=x;}
    public int getX() {return (int)myCenterX;}
    public void setY(int y) {myCenterY=y;}
    public int getY() {return (int)myCenterY;}
    public void setDirectionX(double x) {myDirectionX=x;}
    public double getDirectionX() {return myDirectionX;}
    public void setDirectionY(double y) {myDirectionY=y;}
    public double getDirectionY() {return myDirectionY;}
    public void setPointDirection(int degrees) {myPointDirection=degrees;}
    public double getPointDirection() {return myPointDirection;}
    private int rotspeed;
  public void move()
  {
    super.move();
    myPointDirection+=rotspeed;
  }  

}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees
      myPointDirection+=nDegreesOfRotation; 
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }  
}

  

