import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pokards/core/game_objects.dart';
import 'package:pokards/pages/game/widgets.dart';
import 'package:pokards/routes/app_router.gr.dart';
import 'package:pokards/core/extensions.dart';

class GamePage extends StatefulWidget {
  final GameProperties? properties;
  final Function()? onPlayAgainPressed;

  const GamePage({
    Key? key,
    this.properties,
    this.onPlayAgainPressed,
  }) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  Street street = Street.preflop;
  ValueNotifier<bool> showPlayerHand = ValueNotifier(false);

  void _onMainActionPressed() {
    switch (street) {
      case Street.preflop:
        setState(() => street = Street.flop);
        break;
      case Street.flop:
        setState(() => street = Street.turn);
        break;
      case Street.turn:
        setState(() => street = Street.river);
        break;
      case Street.river:
        if (showPlayerHand.value || !_isPlayer()) {
          Navigator.pop(context);
          widget.onPlayAgainPressed!();
        } else {
          setState(() => showPlayerHand.value = true);
        }
        return;
    }
  }

  bool _isPlayer() => widget.properties!.role
      .maybeMap(player: (_) => true, orElse: () => false);

  @override
  Widget build(BuildContext context) {
    // Specific to web (when accessing '/#/game' path directly)
    if (widget.properties == null || widget.onPlayAgainPressed == null) {
      AutoRouter.of(context).navigate(const HomePageRoute());
      return const Center(child: CircularProgressIndicator());
    }

    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          child: Material(
            color:
                Theme.of(context).isDark ? Colors.grey[800] : Colors.green[700],
            child: Stack(
              children: [
                Labels(
                  gameId: widget.properties!.gameId,
                ),
                Boardcards(
                  cards: widget.properties!.boardCards,
                  street: street,
                ),
                ActionsBar(
                  mainActionLabel: street != Street.river
                      ? 'Deal'
                      : !showPlayerHand.value && _isPlayer()
                          ? 'Show hand'
                          : 'New game',
                  onMainActionPressed: _onMainActionPressed,
                  onLeavePressed: () => Navigator.pop(context),
                  onHelpPressed: () =>
                      AutoRouter.of(context).push(const HelpPageRoute()),
                ),
                widget.properties!.role.map(
                  player: (role) => PlayerHand(
                    cards: role.cards,
                    showPlayerHand: showPlayerHand,
                  ),
                  table: (_) => const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
