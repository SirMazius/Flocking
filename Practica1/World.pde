
class World { 
  ArrayList<Boid> l_boids_a;
  ArrayList<Boid> l_boids_b;
  Boid a, b;
  World() {
    //a = new Boid(300,300, new PVector(0,0),10,40);
    //b = new Boid(width -100,100, new PVector(0,0),15,20);
    l_boids_a = new ArrayList<Boid>();
    l_boids_b = new ArrayList<Boid>();

    target_a = new PVector(200, height/2);
    target_b = new PVector(width-200, height/2);

    for (int i = 0; i < 40; i++) {
      add_boid(l_boids_a, target_b);
    }

    for (int i = 0; i < 40; i++) {
      add_boid(l_boids_b, target_a);
    }
  }

  void update() {
    //a.evade(b);
    ////a.pred_pos(b);
    //b.seek(target,1);
    //bounders(b);
    //bounders(a);
    //b.update();
    //a.update();
    for (int i = 0; i < l_boids_a.size(); i++) {
      if (l_boids_a.get(i) != null) {
        Boid a = l_boids_a.get(i);
        a.flock(l_boids_a);
        a.seek(target_a, 1.25);
        a.separate(10, l_boids_b);
        a.update();
        bounders(a);

        if (PVector.dist(a.pos, target_a) < 20) 
          l_boids_a.remove(a);
      }
    }

    for (int i = 0; i < l_boids_b.size(); i++) {
      if (l_boids_b.get(i) != null) {
        Boid b = l_boids_b.get(i);
        b.flock(l_boids_b);
        b.seek(target_b, 1.25);
        b.separate(5, l_boids_a);
        b.update();
        bounders(b);

        if (PVector.dist(b.pos, target_b) < 20) 
          l_boids_b.remove(b);
      }
    }
  }

  void display() {

    for (Boid a : l_boids_a) {
      stroke(10);
      a.display();
    }

    for (Boid b : l_boids_b) {
      fill(255);
      b.display();
    }
    //fill(0);
    //a.display();
    //fill(255);
    //b.display();
  }

  void bounders(Boid b) {
    if (b.pos.x < 0) {
      b.pos.x = width;
    } else if (b.pos.x > (width)) {
      b.pos.x = 0;
    }
    if (b.pos.y < 0) {
      b.pos.y = height;
    } else if (b.pos.y > (height)) {
      b.pos.y = 0;
    }
  }

  void add_boid(ArrayList<Boid> l_boids, PVector _pos) {
    PVector vel = new PVector(random(-5, 5), random(-5, 5));//Velocidad inicial aleatoria
    //Boid c = new Boid(mouseX, mouseY, vel, 15, 10);
    //float x = random(100, width-100);
    //float y = random(100, width-100);
    //Boid c = ;
    l_boids.add(new Boid(_pos.x, _pos.y, vel, 8, 4));
  }
}