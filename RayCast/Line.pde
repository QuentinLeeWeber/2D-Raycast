public class Line{
  
  public float x1, x2, y1, y2;
  
  public Line(int _x1, int _y1, int _x2, int _y2){
    
    if(x1 == x2){
      x1 = _x1;
      y1 = _y1;
      x2 = _x2 + 0.100001;
      y2 = _y2;
    } else {
      x1 = _x1;
      y1 = _y1;
      x2 = _x2;
      y2 = _y2;
    }
  }
  
  
}
