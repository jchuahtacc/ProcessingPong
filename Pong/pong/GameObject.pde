import java.awt.Rectangle;

class GameObject {
  Game game = null;
  protected long _lastMillis = 0;
  protected PGraphics graphics;
  protected int _width = 50, _height = 50;
  
  public int x = 0, y = 0;
  public color bgcolor = color(255);
  
  GameObject() {
    _lastMillis = millis();
  }
  
  public int getWidth() {
    return _width;
  }
  
  public int getHeight() {
    return _height;
  }
  
  public void setSize(int width, int height) {
    _width = width;
    _height = height;
    if (game != null) {
      graphics = createGraphics(_width, _height);
    }
  }
  
  public boolean collidesWith(GameObject other) {
    Rectangle r1 = new Rectangle(x, y, _width, _height);
    Rectangle r2 = new Rectangle(other.x, other.y, other._width, other._height);
    return r1.intersects(r2);
  }
  
  public boolean isKeyPressed(int keyCode) {
    if (game != null && game.isKeyPressed(keyCode)) {
      return true;
    }
    return false;
  }
  
  public boolean isKeyPressed(char key) {
    if (game != null && game.isKeyPressed(Character.getNumericValue(key))) {
      return true;
    }
    return false;
  }
  
  public void update() {
  }
  
  public void draw() {
    if (graphics != null) {
      graphics.beginDraw();
      graphics.clear();
      graphics.background(bgcolor);    
      graphics.endDraw();
    }
  }
}