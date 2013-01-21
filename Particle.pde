/**
 * A class representing a particle through a number of manipulable properties.
 */
class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float decay;
  float radius;
  color colour;
  
  /**
   * Class costructor setting some sensible default values.
   */
  Particle() {
    position = new PVector(random(width), random(height));
    velocity = new PVector(random(-1.0f, 1.0f), random(-1.0f, 1.0f));
    acceleration = new PVector(0.0f, 0.0f);
    radius = random(1.0f);
    decay = map(radius, 0.0f, 1.0f, 0.1f, 0.9f);
    colour = color(random(360), random(100), random(100));
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  /**
   * This is where the magic happens, i.e. the particle changes its own location
   * according to its parameters.
   */
  void update() {
    velocity.add(acceleration);
    
    float maxVelocity = radius + 0.0025f;
    float speed = velocity.mag() * velocity.mag() + 0.1f;
    if(speed > maxVelocity * maxVelocity) {
      velocity.normalize();
      velocity.mult(maxVelocity);
    }
    
    position.add(velocity);
    acceleration.mult(1.0f - decay);
  }
  
  /**
   * This is how the particle is drawn on screen.
   */
  void draw() {
    noStroke();
    fill(colour);
    ellipse(position.x, position.y, 2*radius, 2*radius);
  }
}
