import java.awt.Rectangle;

abstract class GameObject {
  Game game = null;
  protected long _lastMillis = 0;
  protected PGraphics graphics = null;
  protected int _width = 50, _height = 50;
  
  public int x = 0, y = 0;
  public color bgcolor = color(255);
  
  GameObject() {
    _lastMillis = millis();
  }
  
  /**
   * Returns the width of this GameObject
   */
  public int getWidth() {
    return _width;
  }
  
  /**
   * Returns the height of this GameObject
   */
  public int getHeight() {
    return _height;
  }
  
  /**
   * Sets the size of this game object. It will also resize the
   * drawing area of this object, if available
   */
  public void setSize(int width, int height) {
    _width = width;
    _height = height;
    if (game != null) {
      graphics = createGraphics(_width, _height);
    }
  }
  
  /**
   * Returns true if this GameObject collides with another
   */
  public boolean collidesWith(GameObject other) {
    Rectangle r1 = new Rectangle(x, y, _width, _height);
    Rectangle r2 = new Rectangle(other.x, other.y, other._width, other._height);
    return r1.intersects(r2);
  }
  
  /**
   * Returns true if the key specified by the keyCode is being pressed
   */
  public boolean isKeyPressed(int keyCode) {
    if (game != null && game.isKeyPressed(keyCode)) {
      return true;
    }
    return false;
  }
  
  /**
   * Returns true if the key specified by the specified character is being
   * pressed
   * @param     key    lowercase character
   */
  public boolean isKeyPressed(char key) {
    if (game != null && game.isKeyPressed(Character.getNumericValue(key))) {
      return true;
    }
    return false;
  }
  
  /**
   * Implement this method to update this GameObject's state. Updates happen at
   * a rate of 30 frames per second
   */
  abstract void update();
  
  /**
   * Override this method if you wish to change how the object is drawn.
   * This method is called once when the screen first becomes available
   * for drawing.
   */
  public void draw() {
    if (graphics != null) {
      graphics.beginDraw();
      graphics.clear();
      graphics.background(bgcolor);    
      graphics.endDraw();
    }
  }
}