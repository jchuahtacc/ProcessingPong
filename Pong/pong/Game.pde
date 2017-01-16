class Game {
  protected PApplet _applet;
  protected long _millis = 0;
  protected int frames = 0;
  
  public color bgcolor = color(55);
  
  ArrayList<GameObject> _objects = new ArrayList<GameObject>();
  HashMap<Integer, Boolean> _keyVector = new HashMap<Integer, Boolean>();
  
  void init(PApplet applet) {
    this._applet = applet;
  }
  
  void add(GameObject o) {
    o.game = this; 
    _objects.add(o);
  }
  
  void remove(GameObject o) {
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
  
  boolean isKeyPressed(int keyCode) {
    return _keyVector.containsKey(keyCode);
  }
  
  boolean isKeyPressed(char key) {
    return _keyVector.containsKey(Character.getNumericValue(key));
  }
  
  void update() {
  }
  
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