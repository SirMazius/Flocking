float dt = 0.1;
PVector target;
ArrayList<Boid> l_boids;
ArrayList<Boid> l_boids_b;

World a;

void setup() {
  l_boids = new ArrayList<Boid>();
  l_boids_b = new ArrayList<Boid>();
  size(1200, 600);
  a = new World();
}

void draw() {
  background(55);
  target = new PVector(width/2, height/2);
  fill(10);
  ellipse(target.x, target.y, 30, 30);
  a.update();
  a.display();
}

void mouseDragged() {
  a.add_boid();
}