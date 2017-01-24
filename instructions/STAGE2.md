# Stage 2: Diagrams

In the previous stage, we completed some diagrams that:

- Describe from a Top-Down design process what we want to put into the game
- A description of each class of object in the game
- A UML diagram showing the object-oriented relationships where Ball, Paddle and Edge have the *is-a* relationship with a generic GameObject

Object Oriented concepts:

- Ball, Paddle and Edge have the *is-a* relationship with GameObject
- Therefore Ball, Paddle and Edge *inherit* features from GameObject
- Later on, *polymorphism* allows us to substitute a Ball, Paddle or Edge for any part of our program that requires a generic GameObject
- The update methods of Ball and Paddle *override* the parent GameObject update method (which does nothing)
