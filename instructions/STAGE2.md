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

### Instructions

Now we must create a Ball class that extends GameObject and implements some of the data and behavior that we talked about. 

- Create a `Ball` class that extends `GameObject`
- Add a `dx` and `dy` variable that are integers to the `Ball` class
- Override the `void update` method and make it move by changing the value of the `x` and `y` variables that were inherited from `GameObject`

We also need the ball to be on the screen

- Create a `b` variable of type `Ball` to hold the ball
- Create a `PongGame` constructor method that creates an *instance* of Ball using the `new` keyword
- Add the ball to the screen