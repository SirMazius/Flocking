
class World { 
  //ArrayList<Boid> l_boids;
  Boid a,b;
  World() {
    //l_boids = new ArrayList<Boid>();
    //a = new Boid(300,300, new PVector(0,0),10,40);
    //b = new Boid(width -100,100, new PVector(0,0),15,20);
    
    //for (int i = 0; i < 20; i++) {
    //  PVector vel = new PVector(random(-1,1),random(-1,1));
    //  Boid c = new Boid(250,250, vel,10,5);
    //  l_boids.add(c);
    //}
    
  }
  
  void update() {
    //a.evade(b);
    ////a.pred_pos(b);
    //b.seek(target,1);
    //bounders(b);
    //bounders(a);
    //b.update();
    //a.update();
    for (Boid b : l_boids) {
      b.flock();
      b.update();
      bounders(b);
    }
  }
  
  void display() {
    
    for (Boid b : l_boids) {
      b.display();
    }
    //fill(0);
    //a.display();
    //fill(255);
    //b.display();
    
  }
  
  void bounders(Boid b) {
    if(b.pos.x < 0) {
      b.pos.x = width;
    } else if(b.pos.x > (width)) {
     b.pos.x = 0;
    }
    if(b.pos.y < 0) {
       b.pos.y = height;
    } else if (b.pos.y > (height)) {
       b.pos.y = 0;
    }
  }
  
  void add_boid() {
    PVector vel = new PVector(random(-5,5),random(-5,5));
    Boid c = new Boid(mouseX, mouseY,vel,15,10);
    l_boids.add(c);
  }
  
}