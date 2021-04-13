import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:pokards/core/extensions.dart';
import 'package:pokards/core/game_objects.dart';
import 'package:pokards/core/widgets.dart';

class PlayingCardWidget extends StatelessWidget {
  final double width;
  final PlayingCard playingCard;
  final bool isHidden;
  final double? hideOpacity;

  const PlayingCardWidget({
    Key? key,
    required this.width,
    required this.playingCard,
    this.isHidden = false,
    this.hideOpacity,
  }) : super(key: key);

  Color _getColor() =>
      playingCard.suit == Suit.heart || playingCard.suit == Suit.diamond
          ? Colors.red
          : Colors.black;

  IconData _getSuit() {
    switch (playingCard.suit) {
      case Suit.spade:
        return RpgAwesome.spades;
      case Suit.club:
        return RpgAwesome.clovers;
      case Suit.diamond:
        return RpgAwesome.diamonds;
      case Suit.heart:
        return RpgAwesome.hearts;
    }
  }

  String _getRank() {
    switch (playingCard.rank) {
      case Rank.ace:
        return "A";

      case Rank.two:
        return "2";

      case Rank.three:
        return "3";

      case Rank.four:
        return "4";

      case Rank.five:
        return "5";

      case Rank.six:
        return "6";

      case Rank.seven:
        return "7";

      case Rank.eight:
        return "8";

      case Rank.nine:
        return "9";

      case Rank.ten:
        return "10";

      case Rank.jack:
        return "J";

      case Rank.queen:
        return "Q";

      case Rank.king:
        return "K";
    }
  }

  List<Widget> _rankIcons() => rankIconPositions[playingCard.rank]!
      .map((pos) => Align(
            alignment: Alignment(pos.x, pos.y),
            child: Icon(
              _getSuit(),
              color: _getColor(),
              size: 40,
            ),
          ))
      .toList();

  Widget _corner(bool isReversed) {
    final children = [
      Icon(
        _getSuit(),
        color: _getColor(),
        size: 22,
      ),
      Text(
        _getRank(),
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: _getColor(),
          height: 1.1,
          fontSize: 20,
        ),
      ),
    ];
    return Padding(
      padding: EdgeInsets.all(width / 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: isReversed ? children.reversed.toList() : children,
      ),
    );
  }

  List<Widget> _specialRanksIcon() {
    switch (playingCard.rank) {
      case Rank.king:
        return const [
          Align(
            alignment: Alignment(-0.45, 0.2),
            child: Text('🕺'),
          ),
        ];
      case Rank.queen:
        return const [
          Align(
            alignment: Alignment(-0.3, 0.15),
            child: Text('💃'),
          ),
        ];
      case Rank.jack:
        return const [
          Align(
            alignment: Alignment(0, -0.25),
            child: Text('🕴'),
          ),
        ];
      default:
        return [];
    }
  }

  Widget _visibleContents(BuildContext context) => Container(
        color: Theme.of(context).isDark ? Colors.grey[400] : Colors.white,
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 72),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: _corner(false),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: _corner(true),
              ),
              ..._specialRanksIcon(),
              ..._rankIcons(),
            ],
          ),
        ),
      );
  Widget _isHiddenContents(BuildContext context) => Container(
        color: Theme.of(context).isDark ? Colors.grey[600]! : Colors.red,
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).isDark
                    ? Colors.grey[700]!
                    : Colors.red[700]!,
                width: 4),
            borderRadius: BorderRadius.circular(width / 12),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: width,
      height: 1.4 * width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width / 10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 7,
            spreadRadius: .1,
          )
        ],
      ),
      child: Stack(
        children: [
          _isHiddenContents(context),
          if (hideOpacity == null)
            AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: isHidden ? 0.0 : 1.0,
              child: _visibleContents(context),
            )
          else
            Opacity(
              opacity: hideOpacity!,
              child: _visibleContents(context),
            ),
        ],
      ),
    );
  }
}

class Boardcards extends StatelessWidget {
  final List<PlayingCard> cards;
  final Street street;

  const Boardcards({
    Key? key,
    required this.cards,
    required this.street,
  })   : assert(cards.length == 5),
        super(key: key);

  bool _isPlayingCardHidden(int index) {
    switch (street) {
      case Street.preflop:
        return true;
      case Street.flop:
        return index > 2;
      case Street.turn:
        return index > 3;
      case Street.river:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        reverse: true,
        itemCount: 5,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Center(
            child: PlayingCardWidget(
              isHidden: _isPlayingCardHidden(index),
              width: 140,
              playingCard: cards[index],
            ),
          ),
        ),
      ),
    );
  }
}

class PlayerHand extends StatefulWidget {
  final List<PlayingCard> cards;
  final ValueNotifier<bool> showPlayerHand;
  const PlayerHand({
    Key? key,
    required this.cards,
    required this.showPlayerHand,
  })   : assert(cards.length == 2),
        super(key: key);

  @override
  _PlayerHandState createState() => _PlayerHandState();
}

class _PlayerHandState extends State<PlayerHand>
    with SingleTickerProviderStateMixin {
  static const baseAlignment = Alignment(0, 0);
  static const limit = 1;
  static const cardSize = Size(170, 170 * 1.4);
  bool reversed = false;

  late AnimationController _controller;
  Alignment _dragAlignment = baseAlignment;

  late Animation<Alignment> _animation;

  Future<void> _runShowHandAnimation() async {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: _dragAlignment + const Alignment(0, -1),
      ),
    );
    const spring = SpringDescription(
      mass: 40,
      stiffness: 1,
      damping: 1,
    );

    final simulation = SpringSimulation(spring, 0, 1, 0);

    await _controller.animateWith(simulation);
  }

  void _runReturnAnimation(Offset pixelsPerSecond, Size size) {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: baseAlignment,
      ),
    );
    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1,
    );

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

    _controller.animateWith(simulation);
  }

  Future<void> _runBounceAnimation() async {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: _dragAlignment + const Alignment(0, -1),
      ),
    );
    const spring = SpringDescription(
      mass: 40,
      stiffness: 1,
      damping: 1,
    );

    final simulation = SpringSimulation(spring, 0, 1, 0);

    await _controller.animateWith(simulation);
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: baseAlignment,
      ),
    );
    _controller.animateWith(simulation);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    _controller.addListener(() {
      setState(() {
        _dragAlignment = _animation.value;
      });
    });

    widget.showPlayerHand.addListener(() {
      if (widget.showPlayerHand.value) {
        _runShowHandAnimation();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final interpolatedY =
        (_dragAlignment.y) / ((_dragAlignment.y).abs() + limit);
    final hideOpacity = min(1.0, max(0.0, -_dragAlignment.y));
    final angle = (widget.showPlayerHand.value ? 2 : 1) * interpolatedY * 0.1;

    return GestureDetector(
      onPanDown: (details) {
        _controller.stop();
      },
      onPanUpdate: (details) {
        if (!widget.showPlayerHand.value) {
          setState(() {
            _dragAlignment += Alignment(
              0,
              details.delta.dy / (size.height / 6),
            );
          });
        }
      },
      onPanEnd: (details) {
        if (!widget.showPlayerHand.value) {
          _runReturnAnimation(details.velocity.pixelsPerSecond, size);
        }
      },
      onTap: () {
        setState(() => reversed = !reversed);
        if (!widget.showPlayerHand.value) _runBounceAnimation();
      },
      child: Align(
        alignment: Alignment(
            0,
            (widget.showPlayerHand.value ? 0.2 : 1) *
                    interpolatedY *
                    ((cardSize.height * 7) /
                        MediaQuery.of(context).size.height) +
                1),
        child: Stack(
          children: [
            Transform.translate(
              offset: Offset(interpolatedY * 40, 140),
              child: Transform.rotate(
                angle: angle,
                child: PlayingCardWidget(
                  playingCard: widget.cards[reversed ? 1 : 0],
                  width: cardSize.width,
                  hideOpacity: hideOpacity,
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(-interpolatedY * 40, 140),
              child: Transform.rotate(
                angle: -angle,
                child: PlayingCardWidget(
                  playingCard: widget.cards[reversed ? 0 : 1],
                  width: cardSize.width,
                  hideOpacity: hideOpacity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionsBar extends StatelessWidget {
  final String mainActionLabel;
  final Function() onMainActionPressed;
  final Function() onLeavePressed;
  final Function() onHelpPressed;

  const ActionsBar({
    Key? key,
    required this.onMainActionPressed,
    required this.onLeavePressed,
    required this.onHelpPressed,
    required this.mainActionLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      right: 0,
      left: 0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: onLeavePressed,
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  )),
                ),
                onPressed: onMainActionPressed,
                child: Text(
                  mainActionLabel,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              IconButton(
                onPressed: onHelpPressed,
                icon: const Icon(
                  Icons.help_outline,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Labels extends StatelessWidget {
  final String gameId;

  const Labels({Key? key, required this.gameId}) : super(key: key);

  Widget _appLogo(double fontSize) => AppLogo(
        fontSize: fontSize,
        color: Colors.white,
      );
  Widget _gameId(double fontSize) => Text(
        'Game ID: $gameId',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: fontSize, color: Colors.white),
      );

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.height > 500
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [_appLogo(25), const SizedBox(), _gameId(18)],
          )
        : Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              children: [
                Expanded(child: _appLogo(22)),
                const SizedBox(width: 175),
                Expanded(child: _gameId(18))
              ],
            ),
          );
  }
}
