float dt = 0.1;boolean debug;
PVector target_a;
PVector target_b;
ArrayList<Boid> l_boids_a;
ArrayList<Boid> l_boids_b;
ArrayList<Boid> l_boids_c;

enum Mode {
  SEEK, FLEE, PURSUE, EVADE, ARRIVE, FLOCK_SIMPLE, FLOCK_OBJECTIVES, FLOCK_CORRIDOR
};
Mode mode;
World a;

void setup() {
  size(1200, 600);
  mode = Mode.SEEK;
  debug = false;
  a = new World();
}

void draw() {
  background(55);
  a.update();
  a.display();
  textSize(20);
}

void keyPressed() {
  switch(key) {
  case '1':
    mode = Mode.SEEK;
    
    break;
  case '2':
    mode = Mode.FLEE;
    
    break;
  case '3':
    mode = Mode.PURSUE;
    break;
  case '4':
    mode = Mode.EVADE;
    break;
  case '5':
    mode = Mode.ARRIVE;
    break;
  case '6':
    l_boids_c.clear();
    mode = Mode.FLOCK_SIMPLE;
    break;
  case '7':
    mode = Mode.FLOCK_OBJECTIVES;


    l_boids_a.clear();
    l_boids_b.clear();

    for (int i = 0; i < 40; i++)
      a.add_boid(l_boids_a, target_b);

    for (int i = 0; i < 40; i++)
      a.add_boid(l_boids_b, target_a);

    break;
  case '8':
    mode = Mode.FLOCK_CORRIDOR;

    l_boids_a.clear();
    l_boids_b.clear();

    for (int i = 0; i < 40; i++)
      a.add_boid(l_boids_a, target_b);

    for (int i = 0; i < 40; i++)
      a.add_boid(l_boids_b, target_a);

    break;
   case '9':
     if (debug)
       debug = false;
     else
       debug = true;
   break;
  }
}

void mouseDragged() {
  a.add_boid(l_boids_c);
}