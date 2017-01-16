abstract class Game {
  protected PApplet _applet;
  protected long _millis = 0;
  protected int frames = 0;
  
  /**
   * The background color of the game window
   */
  public color bgcolor = color(55);
  
  ArrayList<GameObject> _objects = new ArrayList<GameObject>();
  HashMap<Integer, Boolean> _keyVector = new HashMap<Integer, Boolean>();
  
  void init(PApplet applet) {
    this._applet = applet;
  }
  
  /**
   * Adds a GameObject to this Game
   */
  public void add(GameObject o) {
    o.game = this; 
    _objects.add(o);
  }
  
  /**
   * Removes a GameObject from this Game
   */
  public void remove(GameObject o) {
    o.game = null;
    _objects.remove(o);
  }
  
  void registerKeyPress(int keyCode) {
    _keyVector.put(keyCode, true);

  }
  
  void registerKeyRelease(int keyCode) {
    if (_keyVector.containsKey(keyCode)) {
      _keyVector.remove(keyCode);
    }
  }
  
  /**
   * Returns true if the current keyCode is being pressed down
   */
  public boolean isKeyPressed(int keyCode) {
    return _keyVector.containsKey(keyCode);
  }
  
  /**
   * Returns true if the current character is being pressed down. 
   * @param   key    a lowerchase char
   */
  public boolean isKeyPressed(char key) {
    return _keyVector.containsKey(Character.getNumericValue(key));
  }
  
  /**
   * Implement this method so that the Game does something once every
   * frame. The game runs at a maximum of 30 frames per second. Game Objects
   * will update, then the game will update, then everything will be drawn.
   */
  protected abstract void update();
  
  void draw() {
    long current = millis();
    if (current - _millis > 33) {
      frames++;
      _millis = current;
      _applet.background(bgcolor);
      println("Frame: " + frames);
      for (GameObject o : _objects) {
        o.update();
      }
      
      this.update();
      
      for (GameObject o : _objects) {
        pushMatrix();
        translate(o.x, o.y);
        if (o.graphics == null) {
          o.graphics = createGraphics(o._width, o._height);
          o.draw();
        }
        _applet.image(o.graphics, 0, 0);
        popMatrix();
      }
    }
  }
}