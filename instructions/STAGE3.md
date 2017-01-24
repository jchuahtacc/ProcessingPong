# Stage 3: Implement Edges

In the previous stage, we added code that:

- Adds a ball to the screen
- Makes the ball move

## Instructions

This time, we need to add an Edge class, and create instance of the Edge class and add them to the screen. It's actually much simpler than the Ball class.

- Create an `Edge` class that extends `GameObject`
- Create an `Edge` `void update()` method which does nothing
- Add Edges to the screen

The interesting thing here about our design is that every Edge may have different x and y values, as well as a different size. This means that when we add each one to the screen, we need to change the size and position from the `PongGame` class rather than allow the Edges to set their own positions and sizes. Here's how to add one Edge to the `PongGame` class:

```
class PongGame extends Game {
  Ball b;
  Edge top;
  
  PongGame() {
    b = new Ball();
    
    add(b);
    
    top = new Edge();
    
    top.setSize(100, 10);
    top.x = 0;
    top.y = 0;
    
    add(top);
  }
  
  void update() {
  }
}
```