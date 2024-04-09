# CS193p - Set Game

This is my version of Set Game, part of Staford's course 'CS193p - Developing Applications for iOS of Spring 2023.


https://github.com/vsaginadze/SetGame/assets/62477087/40262e08-4867-47fe-941d-a83722c61f3f



## Formal Rules

Each card contains four attributes, each of which take on three values:

    Number: each card contains either 1, 2, or 3 shapes.
    Color: the shapes on each card are either red, green, or purple.
    Shape: the shapes on each card are either ovals, diamonds, or squiggles.
    Texture: each shape is either hollow, shaded, or filled.

Each combination of attributes corresponds to exactly one card, for a total of 81 cards in the deck. At any time, 12 cards are revealed, and the fastest player to find a set within these 12 cards wins the set (depending on the players, the penalty for a false set claim can range from being unable to claim a set again that round to losing an already won set). The three cards in the set are then removed, and another three cards are revealed, with the game continuing until the deck is completed.

Additionally, if no player is able to find a set within the group of 12 cards after some time, another three cards are revealed (with the agreement of all players). The next set claimed will not be replaced, since there will already be at least 12 cards showing. As shown below, it is indeed possible (though somewhat unlikely) that a group of 12 cards contains no set; in fact, it is possible for a group of up to 20 cards to contain no set.
