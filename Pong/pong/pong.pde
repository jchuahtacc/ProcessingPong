Game pong = new PongGame();

void setup() {
  size(800, 600);
  pong.init(this);
}

void keyPressed() {
  pong.registerKeyPress(Character.getNumericValue(key));
  pong.registerKeyPress(keyCode);
}

void keyReleased() {
  pong.registerKeyRelease(Character.getNumericValue(key));
  pong.registerKeyRelease(keyCode);
}

void draw() {
  pong.update();
  pong.draw();
}