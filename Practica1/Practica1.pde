float dt = 0.1;
PVector target_a;
PVector target_b;

World a;

void setup() {
  size(1200, 600);
  a = new World();
  
}

void draw() {
  background(55);
  
  //fill(10);
  noFill();
  stroke(10);
  
  ellipse(target_a.x, target_a.y, 30, 30);
  stroke(255);
  ellipse(target_b.x, target_b.y, 30, 30);
  a.update();
  a.display();
}

//void mouseDragged() {
//  a.add_boid();
//}