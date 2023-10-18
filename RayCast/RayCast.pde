//init
int anzahlRays = 2500;

//work

ArrayList<Line> lines = new ArrayList<Line>();
ArrayList<Ray> rays = new ArrayList<Ray>();
ArrayList<Drawer> drawers = new ArrayList<Drawer>();
ArrayList<Point> rayPoints = new ArrayList<Point>();


void setup(){
  size(500, 500);
  background(0);
  lines.add(new Line(170, 400, 245, 400));
  lines.add(new Line(265, 400, 400, 400));
  
  lines.add(new Line(100, 100, 400, 100));
  lines.add(new Line(100, 120, 400, 400));
  lines.add(new Line(50, 400, 50, 470));
  lines.add(new Line(50, 470, 100, 470));
  lines.add(new Line(50, 400, 100, 400));
  lines.add(new Line(400, 30, 400, 90));
  lines.add(new Line(0, 0, 0, 500));
  lines.add(new Line(0, 0, 500, 0));
  lines.add(new Line(500, 500, 500, 0));
  lines.add(new Line(500, 500, 0, 500));
  
  for(int i = 0; i < 10;i++){
    float rot1 = i * ((1 * PI) / 10) + 0.25 * PI;
    float rot2 = (i + 1) * ((1 * PI) / 10) + 0.25 * PI;
    lines.add(new Line((int) (150 + cos(rot1) * 100), (int) (250 + sin(rot1) * 100), (int) (150 + cos(rot2) * 100), (int) (250 + sin(rot2) * 100)));
  }
  
  for(int i = 0; i < anzahlRays;i++){
    rays.add(new Ray(250, 250,i * ((2 * PI) / anzahlRays)));
  }

}

void draw() {
  background(0);
  renderGeo(); 
  //renderRays(); 
  rayPoints.clear();
  for(int r = 0; r < rays.size();r++){
    rays.get(r).calc();
    rays.get(r).render();
  }
  /*for(int i = 0; i < rayPoints.size();i++){
      noStroke();
      fill(255, 0, 0);
      ellipse(rayPoints.get(i).x, 500 - rayPoints.get(i).y, 6, 6);
      println(rayPoints.get(i).x);
  }*/
  //println(rayPoints);
}

void mouseMoved(){
  for(int i = 0; i < rays.size();i++){
    rays.get(i).x = mouseX;
    rays.get(i).y = height - mouseY;
  }
}

private void renderGeo(){
  stroke(255);
  strokeWeight(2);
  for(int i = 0; i < lines.size();i++){
    line(lines.get(i).x1, height - lines.get(i).y1, lines.get(i).x2, height - lines.get(i).y2);
  }
}

private void renderRays(){
  stroke(255);
  strokeWeight(2);
  for(int i = 0; i < rays.size();i++){
    line(rays.get(i).x, height - rays.get(i).y, cos(rays.get(i).dir) * 1000 + rays.get(i).x, height
    - (sin(rays.get(i).dir) * 1000 + rays.get(i).y));
    //ellipse(rays.get(i).x, rays.get(i).y, 100, 100);
  }
}
