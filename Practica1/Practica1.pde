float dt = 0.1;
PVector target;
Boid a;
void setup() {
  size(900,600);
  a = new Boid();
}

void draw() {
  background(55);
  target = new PVector(mouseX,mouseY);
  a.steer(target);
  a.update();
  a.display();
}