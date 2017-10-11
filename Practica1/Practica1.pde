float dt = 0.2;
PVector target;
ArrayList<Boid> l_boids;
World a;
void setup() {
  l_boids = new ArrayList<Boid>();
  size(1000,500);
  a = new World();
}

void draw() {
  background(55);
  target = new PVector(mouseX,mouseY);
  fill(10);
  ellipse(target.x,target.y,30,30);
  a.update();
  a.display();
}

void mouseDragged() {
  a.add_boid();
}