public class Ray{
 
  public float x, y;
  public float dir;
  public Point hit = null;
  
  public Ray(int _x, int _y, float _dir){
    x = _x;
    y = _y;
    if(_dir == 0){
      dir = 0.000001;
    } else {
      dir = _dir;
    }
  }
  
  public void render(){
    if(hit != null){;
      stroke(255, 255, 255, 20);
      strokeWeight(1);
      line(x, height - y, hit.x, height - hit.y);
    } else {
      line(x, height - y, x + cos(dir) * 100, height - (y + sin(dir) * 100));
    }
  }
  
  public void calc(){
    hit = null;
    //Point cross = new Point(10000, 10000);
    for(int l = 0; l < lines.size();l++){
      float mL = 0;
      float nL = 0;
      float mR = 0;
      float nullX = x;
      float nullY = y;
      float nullSchnittX = 0;
      //float nullSchnittY = 0;
      float X = 0;
      float Y = 0;
      try {
        mL = (lines.get(l).y1 - lines.get(l).y2) / (lines.get(l).x1 - lines.get(l).x2); 
      } catch (Exception e){ 
        mL = 1999999999;
      }
      try {
        mR = sin(dir) / cos(dir);
      } catch(Exception e){
        mR = 1999999999;
      }
      nL = -((lines.get(l).x1 - nullX) * mL - (lines.get(l).y1 - nullY));
      nullSchnittX = (nL / (mR - mL));
      //nullSchnittY = nullSchnittX * mR;
      //println("NullschnnittX:  " + nullSchnittX);
      //println("NullschnnittY:  " + nullSchnittY);
      X = nullSchnittX + nullX;
      //println("X:  " + X);
      Y = /*height - */(nullSchnittX * mR + nullY);
      //println("Y:  " + Y);
      //println("mR:  " + mR);
      if(X <= lines.get(l).x1 && X >= lines.get(l).x2 || X <= lines.get(l).x2 && X >= lines.get(l).x1){
        //println(Y);
        if(nullSchnittX * mR  >= 0 && sin(dir) >= 0 || nullSchnittX * mR  <= 0 && sin(dir) <= 0){
          //noStroke();
          //fill(255, 0, 0);
          //ellipse(X, 500 - Y, 6, 6);
          if(hit == null){
            hit = new Point(X, Y);
          } else if(sqrt(pow(X - x, 2) + pow(Y - y, 2)) < sqrt(pow(hit.x - x, 2) + pow(hit.y - y, 2))) {
            hit.x = X;
            hit.y = Y;
          }
          //println(hit.x + "   " + hit.y + "   " + x + "   " + y);
            /*if(sqrt(pow(cross.x - nullX, 2) + pow(cross.y - nullX, 2)) > sqrt(pow(X - nullX, 2) + pow(Y - nullX, 2))){
              cross.x = X;
              cross.y = Y;
            //println("yeet");
            
            }*/
        }
      } 
      //println("Ray:   " + mR + "   Line:  " + mL + "    " + nL); 
    }
    //if(cross.x != 10000){
      //hit = new Point(cross.x, cross.y);
    //}
    //rayPoints.add(new Point(cross.x, cross.y));
  }    
}
