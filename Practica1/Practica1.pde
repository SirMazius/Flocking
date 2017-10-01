float dt = 0.2;
PVector target;
World a;
void setup() {
  size(1800,800);
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