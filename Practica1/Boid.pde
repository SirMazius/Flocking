class Boid {
  PVector pos,vel,acc;
  float mass, max_vel, max_force, r;
  ArrayList<Boid> l_boids;
  Boid(float x, float y, PVector _vel, float _max_vel,float _max_force) {
    pos = new PVector(x, y);
    vel = _vel;
    acc = new PVector(0,0);
    
    max_vel = _max_vel;
    max_force = _max_force;
    mass = 5.5;
    r = 6;
    l_boids = new ArrayList<Boid>();
  }
  
  void pursue(Boid target) {
    seek(pred_pos(target));
  }
  
  void evade() {
  
  }
  
  PVector pred_pos(Boid b) {
    float k = 0.01;
    float t_lim = 5;
    //float t = k * PVector.dist(b.pos, pos) / (b.vel.mag() + vel.mag());
    float t = k * PVector.dist(b.pos,pos);
    //t = t < t_lim ? t : t_lim;
    if (t > t_lim) {
      print(t + "LA T \n");
    } else {print(t + "LA t_lim \n");
      t = t_lim;
      
    }
    PVector pred_pos = PVector.add(b.pos, PVector.mult(b.vel,t));
    //print(t+"\n");
    ellipse(pred_pos.x, pred_pos.y, 10, 10);
    return(pred_pos);
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
    line(target.x, target.y, pos.x,pos.y);
  }
  
  void flee(PVector target) {  
    if (PVector.dist(pos,target) < 350)
      seek(PVector.add(pos,PVector.sub(pos,target)));  
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