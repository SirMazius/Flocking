class Boid {
  PVector pos,vel,acc;
  float mass, max_vel, max_force, r;
  Boid(float x, float y, PVector _vel, float _max_vel,float _max_force) {
    pos = new PVector(x, y);
    vel = _vel;
    acc = new PVector(0,0);
    
    max_vel = _max_vel;
    max_force = _max_force;
    mass = 5.5;
    r = 6;
  }
  
  void seek(PVector target) {
    PVector desired = PVector.sub(target,pos);
    //if (desired.mag() < 100)
    //  desired.setMag(map(desired.mag(), 0, 300, 0, max_vel));
    //else
    //  desired.setMag(max_vel);
    desired.setMag(max_vel);
    PVector seek = PVector.sub(desired, vel);
    seek.limit(max_force);
    add_force(seek);
  }
  
  void flee(PVector target) {
    //seek(PVector.sub(pos,target));
    if (PVector.dist(pos,target) < 350) {
      PVector desired = PVector.sub(pos, target);
      desired.setMag(max_vel);
      PVector seek = PVector.sub(desired, vel);
      seek.limit(max_force);
      add_force(seek);
    }
  }
  
  void add_force(PVector f) {
    acc.add(PVector.div(f,mass));
  }
  
  void update() {
    vel = PVector.add(vel, PVector.mult(acc,dt));
    vel.limit(max_vel);
    pos = PVector.add(pos, PVector.mult(vel,dt));
    acc.set(0,0,0);
  }
  void display() {
    float theta = vel.heading() + PI/2;
    //fill(170, 0, 162);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
  }
}