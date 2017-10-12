class World { 

  Boid a, b, c;

  World() {
    a = new Boid(300, 300, new PVector(0, 0), 35, 40, 8);
    b = new Boid(600, 300, new PVector(0, 0), 20, 40, 8);
    c = new Boid(300, 300, new PVector(0, 0), 25, 50, 8);

    l_boids_a = new ArrayList<Boid>();
    l_boids_b = new ArrayList<Boid>();
    l_boids_c = new ArrayList<Boid>();

    target_a = new PVector(200, height/2);
    target_b = new PVector(width-200, height/2);
  }

  void update() {
    switch (mode) {
    case SEEK:
      seek();
      break;
    case FLEE:
      flee();
      break;
    case PURSUE:
      pursue();
      break;
    case EVADE:
      evade();
      break;
    case ARRIVE:
      arrive();
      break;
    case FLOCK_SIMPLE:
      flock_simple();
      break;
    case FLOCK_OBJECTIVES:
      flock_objectives();
      break;
    case FLOCK_CORRIDOR:
      flock_corridor();
      break;
    }
    //a.evade(b);
    ////a.pred_pos(b);
    //b.seek(target,1);
    //bounders(b);
    //bounders(a);
    //b.update();
    //a.update();
    //for (int i = 0; i < l_boids_a.size(); i++) {
    //  if (l_boids_a.get(i) != null) {
    //    Boid a = l_boids_a.get(i);
    //    a.flock(l_boids_a);
    //    a.seek(target_a, 1.25);
    //    a.separate(10, l_boids_b);
    //    corridor(a);
    //    a.update();
    //    //bounders(a);

    //    if (PVector.dist(a.pos, target_a) < 20) 
    //      l_boids_a.remove(a);
    //  }
    //}

    //for (int i = 0; i < l_boids_b.size(); i++) {
    //  if (l_boids_b.get(i) != null) {
    //    Boid b = l_boids_b.get(i);
    //    b.flock(l_boids_b);
    //    b.seek(target_b, 1.25);
    //    b.separate(10, l_boids_a);
    //    corridor(b);
    //    b.update();
    //    //bounders(b);

    //    if (PVector.dist(b.pos, target_b) < 20) 
    //      l_boids_b.remove(b);
    //  }
    //}
  }

  void display() {

    //for (Boid a : l_boids_a) {
    //  stroke(10);
    //  a.display();
    //}

    //for (Boid b : l_boids_b) {
    //  fill(255);
    //  b.display();
    //}

    //Dibuja el pasillo
    //
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

  void corridor(Boid b) {

    //Borde superior
    PVector up = new PVector(b.pos.x, height/4);
    if (PVector.dist(up, b.pos) < 20)
      b.add_force(PVector.sub(b.pos, up).setMag(100));

    //Borde inferior
    PVector down = new PVector(b.pos.x, height - height/4);
    if (PVector.dist(down, b.pos) < 20)
      b.add_force(PVector.sub(b.pos, down).setMag(100));
  }

  void add_boid(ArrayList<Boid> l_boids, PVector _pos) {
    PVector vel = new PVector(random(-5, 5), random(-5, 5));//Velocidad inicial aleatoria
    l_boids.add(new Boid(_pos.x, _pos.y, vel, 8, 4, 3));
  }

  void add_boid(ArrayList<Boid> l_boids) {
    PVector vel = new PVector(random(-5, 5), random(-5, 5));//Velocidad inicial aleatoria
    l_boids.add(new Boid(mouseX, mouseY, vel, 8, 4, 3));
  }

  void seek() {
    fill(255);
    text("SEEK", 30, 40);
    a.seek(new PVector(mouseX, mouseY), 1);
    fill(100);
    ellipse(mouseX, mouseY, 30, 30);
    a.update();
    bounders(a);
    a.display();
  }

  void flee() {
    fill(255);
    text("FLEE", 30, 40);
    b.seek(new PVector(mouseX, mouseY), 1);
    a.flee(b.pos, 1);
    fill(100);
    ellipse(mouseX, mouseY, 30, 30);
    a.update();
    b.update();
    bounders(a);
    bounders(b);
    a.display();
    fill(255);
    b.display();
  }

  void pursue() {
    fill(255);
    text("PURSUE", 30, 40);
    a.seek(new PVector(mouseX, mouseY), 1);
    fill(100);
    ellipse(mouseX, mouseY, 30, 30);
    b.pursue(a);
    a.update();
    b.update();
    a.display();
    bounders(a);
    bounders(b);
    fill(255);
    b.display();
  }

  void evade() {
    fill(255);
    text("EVADE", 30, 40);
    a.seek(new PVector(mouseX, mouseY), 1);
    fill(100);
    ellipse(mouseX, mouseY, 30, 30);
    b.evade(a);
    a.update();
    b.update();
    a.display();
    bounders(a);
    bounders(b);
    fill(255);
    b.display();
  }

  void arrive() {
    fill(255);
    text("ARRIVE", 30, 40);
    c.arrive(new PVector(mouseX, mouseY));
    fill(100);
    ellipse(mouseX, mouseY, 30, 30);
    c.update();
    c.display();
  }

  void flock_simple() {
    fill(255);
    text("SIMPLE FLOCK", 30, 40);
    for (Boid b : l_boids_c) {
      b.flock(l_boids_c);
      b.update();
      fill(50);
      b.display();
    }
  }

  void flock_objectives() {
    fill(255);
    text("FLOCK OBJECTIVES", 30, 40);

    strokeWeight(10);
    noFill();
    stroke(10);
    ellipse(target_a.x, target_a.y, 30, 30);
    stroke(255);
    ellipse(target_b.x, target_b.y, 30, 30);
    strokeWeight(3);

    for (int i = 0; i < l_boids_a.size(); i++) {
      if (l_boids_a.get(i) != null) {
        Boid a = l_boids_a.get(i);
        a.flock(l_boids_a);
        a.seek(target_a, 2);
        a.separate(10, l_boids_b);
        //corridor(a);
        a.update();
        bounders(a);
        a.display();
        if (PVector.dist(a.pos, target_a) < 20) 
          l_boids_a.remove(a);
      }
    }

    for (int i = 0; i < l_boids_b.size(); i++) {
      if (l_boids_b.get(i) != null) {
        Boid b = l_boids_b.get(i);
        b.flock(l_boids_b);
        b.seek(target_b, 1.25);
        b.separate(10, l_boids_a);
        //corridor(b);
        b.update();
        bounders(b);
        noStroke();
        fill(255);
        b.display();

        if (PVector.dist(b.pos, target_b) < 20) 
          l_boids_b.remove(b);
      }
    }
  }

  void flock_corridor() {
    text("FLOCK CORRIDOR", 30, 40);
    strokeWeight(10);
    stroke(0);
    line(0, height/4, width, height/4);
    line(0, height - height/4, width, height - height/4);
    noFill();
    stroke(10);
    ellipse(target_a.x, target_a.y, 30, 30);
    stroke(255);
    ellipse(target_b.x, target_b.y, 30, 30);
    strokeWeight(3);

    for (int i = 0; i < l_boids_a.size(); i++) {
      if (l_boids_a.get(i) != null) {
        Boid a = l_boids_a.get(i);
        a.flock(l_boids_a);
        a.seek(target_a, 2);
        a.separate(10, l_boids_b);
        corridor(a);
        a.update();
        a.display();
        if (PVector.dist(a.pos, target_a) < 20) 
          l_boids_a.remove(a);
      }
    }

    for (int i = 0; i < l_boids_b.size(); i++) {
      if (l_boids_b.get(i) != null) {
        Boid b = l_boids_b.get(i);
        b.flock(l_boids_b);
        b.seek(target_b, 1.25);
        b.separate(10, l_boids_a);
        corridor(b);
        b.update();
        noStroke();
        fill(255);
        b.display();

        if (PVector.dist(b.pos, target_b) < 20) 
          l_boids_b.remove(b);
      }
    }
  }
}