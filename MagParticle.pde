class MagParticle extends Particle {
  float magnitude;
  
  MagParticle() {
    super();
    colour = color(210, 100, 100, 100);
    magnitude = 1.0f;
  }
  
  void update() {
    magnitude = 0.01*radius;
  }
  
  void draw() {
    noStroke();
    fill(colour);
    ellipse(position.x, position.y, radius*2, radius*2);
  }
}
