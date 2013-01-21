float fps;
ParticleController particleController;
PGraphics pg;

void setup() {
  fps = 30.0f;
  size(800, 600);
  frameRate(fps);
  colorMode(HSB, 360, 100, 100);
  pg = createGraphics(800, 600);
  background(0);
  
  particleController = new ParticleController((int)random(10, 100), (int)random(2, 5));
}

void update() {
  particleController.update();
}

void draw() {
  update();
  
  pg.beginDraw();
  pg.background(0, 100);
  pg.endDraw();
  image(pg, 0, 0, width, height);
  
  particleController.draw();
}
