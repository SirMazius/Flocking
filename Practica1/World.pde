class World {
  ArrayList<Boid> l_boids;

  Boid a,b;
  World() {
    l_boids = new ArrayList<Boid>();
    a = new Boid(500,500, new PVector(0,0),10,40);
    b = new Boid(750,100, new PVector(0,0),15,20);
  }
  
  void update() {
    a.pursue(b);
    //a.pred_pos(b);
    b.seek(target);
    bounders(b);
    b.update();
    a.update();
  }
  
  void display() {
    fill(0);
    a.display();
    fill(255);
    b.display();
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
}