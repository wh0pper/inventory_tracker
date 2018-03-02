<!--Your documentation is complete when someone can use your module without ever having to look at its code. This is very important. This makes it possible for you to separate your module's documented interface from its internal implementation (guts). This is good because it means that you are free to change the module's internals as long as the interface remains the same.

Remember: the documentation, not the code, defines what a module does. -- Ken Williams-->

# Inventory Tracker

###[Jared Clemmensen](http://github.com/wh0pper) wrote this app.

#User Stories
As a user, I want to be able to add, update, delete and list shoe stores.
As a user, I want to be able to add and list new shoe brands. Shoe brands should include price.
* As a user, I want to be able to add shoe brands in the application (don't worry about updating, listing or destroying shoe brands).
* As a user, I want to be able to add existing shoe brands to a store to show where they are sold.
* As a user, I want to be able to associate the same brand of shoes with multiple stores.
* As a user, I want to be able to see all of the brands a store sells on the individual store page.
As a user, I want store names and shoe brands to be saved with a capital letter no matter how I enter them.
As a user, I want the price to be in currency format even if I just inputted a number. (In other words, typing in 50 should be updated to $50.00.)
* As a user, I do not want stores and/or shoe brands to be saved if I enter a blank name.
* As a user, I want all stores and brands to be unique. There shouldn't be two entries in the database for Blundstone.
* As a user, I want store and brand names to have a maximum of one hundred characters.

## Setup

Clone to your Desktop.
In terminal, navigate to the root directory of the project and run:

```
$ ruby app.rb
```

Open your browser and go to localhost:4567


## License

*Licensed under MIT license*

Copyright (c) 2018 **_Jared Clemmensen_**
