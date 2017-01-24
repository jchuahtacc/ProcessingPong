class PongGame extends Game {
  
  Ball b;
  Paddle p1;
  Paddle p2;
  
  PongGame() {
    b = new Ball();
    
    add(b);
  }
  
  void update() {
  }
}