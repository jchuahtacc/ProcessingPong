class Ball extends GameObject {
  int dx = 1;
  int dy = 1;
  
  void update() {
    x = x + dx;
    y = y + dy;
  }
}