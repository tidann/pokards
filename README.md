## ♠ ❤️ Pokards ♦ ♣
A mobile/web/desktop app built with [Flutter](https://flutter.dev) to play the role of the *dealer* in a *Poker Texas hold'em game*.
Made by Timothée Danneels - [See project source on GitHub](https://github.com/tidanneels/pokards)

## Motivation
I am fond of playing Poker, however having to distribute the cards all the time is a long and repetitive task. This is why I imagined *Pokards* to do the job for me :\)

## Builds and downloads
[![Download in the App Store](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Download_on_the_App_Store_Badge.svg/200px-Download_on_the_App_Store_Badge.svg.png)](https://apps.apple.com/us/app/pokards/id1562852147) [![Get it on Google Play](https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Google_Play_Store_badge_EN.svg/200px-Google_Play_Store_badge_EN.svg.png)](https://play.google.com/store/apps/details?id=com.tidann.pokards)

Web and Desktop versions will be available soon!

## Tech used
Pokards is written in [Dart](https://dart.dev) with the [Flutter](https://flutter.dev) framework.
[![style: lint](https://img.shields.io/badge/style-lint-4BC0F5.svg)](https://pub.dev/packages/lint)

## Screenshots
![Home screen](https://i.ibb.co/y0T1TxZ/Home-screen.png) ![Player mode](https://i.ibb.co/BBKRYzj/Player-mode.png) ![Dark theme](https://i.ibb.co/8zCXyht/Dark-theme.png) ![Table mode](https://i.ibb.co/LgCT59F/Table-mode.png)

## Features
- ♦ All 4 Texas Hold'em *streets*: *Prehold, Hold, Turn and River*
- 🎲 Player mode (show the board cards + the player's hand)
- ♟ Table mode (only show the board cards)
- ✅ Doesn't need Internet connection (except for the Web version obviously)
- ⚫ Dark theme
- 💪 Null safety

## How to use?
To start a game, choose a *Game ID*: it can be any caracter string you want (emojis allowed !), but it is important that every player use the same.
Then, each player choose the *Player* mode and attribute themselves a number that they enter in the *Player number* field.
You can also use another device with the *Table* mode selected, which you can put in the center of the table, just like with real cards.

To see your hand, swipe up from the card at the bottom of the screen. Be sure not to show it to your opponents!
Players play according to the game's rules, and when it's done, they press *Deal*.

Example :
> Peter, Mary and John all use their phone and choose the Game ID 'poker-game'.
> They select Player mode, Peter chooses the number 1, Mary 2 and John 3.
> They also take a tablet in Table mode.
> Everyone see their cards, they bet (small blind, big blind, etc.) and then they press Deal.
> They repeat the process until the game is finished, and eventually press New game.

## Contribute
Any contribution is welcome !

## License
MIT License

Copyright (c) 2021 Timothée Danneels

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.