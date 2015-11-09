# The Set Game Simulator

We've all played Set before and if you haven't the rules are simple:

A group of players try to identify a "set" of cards from those placed face-up on a table.

Each card has an image on it with 4 orthogonal attributes:

* Color (red, green, or purple)

* Shape (diamond, squiggle, or oval)

* Shading (solid, empty, or striped)

* Number (one, two, or three)

Three cards are a part of a set if, for each property, the values are all the same or all different.

For example:

* The cards "two red solid squiggles", "one green solid diamond", "three purple solid ovals" would make up a set. (number, shape, and color are different, shading is the same)

* The cards "two red solid squiggles", "one green solid squiggles", "three purple solid ovals" would not make up a set, because shape is the same on two cards, but different on the third.

* A game of Set starts by dealing 12 cards, face-up. When a player sees three cards that make up a set, they yell "Set!" and grab the cards. New cards are dealt from the deck to replace them.

* If no player can find a set, three more cards are dealt (to make 15, then 18, then 21...)

* The game is over when there are no cards left in the deck, and no sets left on the table. The player with the most sets wins.

### About the challenge

When I received this coding challenge, I was asked to implement 3 methods:

* A method that takes three cards, and determines whether the three cards make a set

* A method that given a "board" of cards, will either find a set, or determine if there are no sets on the table

* A method that will play an entire game of Set, from beginning to end, and return a list of each valid sets you removed from the board.

#### Reasonings

After reviewing the rules and reading the requirements, I figured I would also extend the challenge a bit more that includes a full UI for the game. My reasoning behind this was that not only will you see how I implemented the methods, but also have something a little bit more friendly for the eyes then `output.txt`

I also wanted to take this opportunity to learn. Normally, I would do coding challenges in either Java or JavaScript and specifically this coding challenge I would consider doing in Node.js. However, after reading that Avvo is primarily a Ruby on Rails shop, I thought I would take this as a chance to refine my Ruby on Rails skills that I recently gained at Apple, and also learn CoffeeScript, something I've never quite dove in to.

With that said, you might find that my work on this project to not be as great as the Ruby on Rails master, but I'm learning, which is something that I truly enjoy doing.

#### Approach

There's a couple things that I did differently in this challenge. For starters, I decided to keep all of the cards in a database (sqlite3). Since there are a bunch of cards, and I was using Rails, I figured it was a valid approach. Although, a `cards.json` would have also worked.

Secondly, for styling, I used Google's [Material Design Light](http://getmdl.io). It's a new 'bootstrap-like' framework that allows you to use some pretty handy tools like the 'grid', and really awesome looking inputs and nav bars and such.

If there are any other clarifications you would like, please don't hesitate to react out.

### Setup

Since I used Ruby on Rails for this project, we need to do a couple of steps to get it all running:

1. First go ahead and unzip the package.
2. `cd /path/to/package/Set-Game-Simulator`
3. run `bundle`
4. run `rake db:migrate`
5. run `rake db:seed`
6. run `rails s`

You are now ready to open up a browser and head over to `localhost:3000`!

### Usage

The UI allows you to do a few things. For starters, you are presented with 12 cards, a scoreboard, a 'next phase' floating action button, and an 'Autoplay' toggle switch.

The cards are the currently face-up cards in the game.

If you click on the button, you'll step through each phase of the game. Alternatively, since the game can last long at times, there is a toggle for you to play out the simulation automatically. Once there are no cards in the deck and no more sets face-up, the winner will be revealed!
