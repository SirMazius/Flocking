class Boid {
  PVector pos,vel,acc;
  float mass, max_vel, max_force, r;
  Boid() {
    pos = new PVector(width/2, height/2);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    max_force = 20;
    max_vel = 40;
    mass = 1.5;
    r = 6;
  }
  
  void steer(PVector target) {
    PVector desired = PVector.sub(target,pos);
    if (desired.mag() < 100) {
      float v = map(desired.mag(), 0, 300, 0, max_vel);
      desired.setMag(v);
    } else {
      desired.setMag(max_vel);
    }
    PVector steer = PVector.sub(desired, vel);
    steer.limit(max_force);
    add_force(steer);
  } 
  
  void add_force(PVector f) {
    acc.add(PVector.div(f,mass));
  }
  
  void update() {
    vel = PVector.add(vel, PVector.mult(acc,dt));
    pos = PVector.add(pos, PVector.mult(vel,dt));
    acc.set(0,0,0);
  }
  void display() {
    float theta = vel.heading() + PI/2;
    fill(170, 0, 162);
    stroke(0);
    strokeWeight(1);
    translate(pos.x, pos.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
  }
}