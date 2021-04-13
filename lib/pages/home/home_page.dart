import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:pokards/core/game_objects.dart';
import 'package:pokards/core/widgets.dart';
import 'package:pokards/logic/game_creator.dart';
import 'package:pokards/logic/game_id_generator.dart';
import 'package:pokards/pages/home/widgets.dart';
import 'package:pokards/routes/app_router.gr.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController gameIdController = TextEditingController();
  FocusNode gameIdFocus = FocusNode();
  DealMode dealMode = DealMode.player;
  int playerIndex = 1;
  bool isPlayerIndexValid = true;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _onCreateGamePressed() async {
    final properties = createGame(
      dealMode: dealMode,
      gameId: gameIdController.text,
      playerIndex: playerIndex,
    );

    setState(() {
      gameIdController.text = generateGameId();
    });

    AutoRouter.of(context).push(GamePageRoute(
      properties: properties,
      onPlayAgainPressed: _onPlayAgainPressed,
    ));
  }

  void _onPlayAgainPressed() {
    gameIdFocus.requestFocus();
  }

  void _onPlayerIndexChanged(String value) {
    setState(() {
      isPlayerIndexValid =
          value.isNotEmpty && int.tryParse(value) != null && int.parse(value) <= 10 && int.parse(value) >= 1;
      if (isPlayerIndexValid) playerIndex = int.parse(value);
    });
  }

  Widget _buildBody() => CenteredBodyCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AppLogo(),
            const SizedBox(height: 8),
            TextField(
              controller: gameIdController,
              textAlign: TextAlign.center,
              focusNode: gameIdFocus,
              decoration: const InputDecoration(labelText: 'Game ID'),
              onChanged: (value) => setState(() {}),
            ),
            const SizedBox(height: 8),
            DealModeSelector(
              dealMode: dealMode,
              onChanged: (d) => setState(() => dealMode = d),
            ),
            PlayerIndexEditor(
              initialValue: playerIndex.toString(),
              isShown: dealMode == DealMode.player,
              isValid: isPlayerIndexValid,
              onChanged: _onPlayerIndexChanged,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: gameIdController.text.isNotEmpty &&
                      (isPlayerIndexValid || dealMode == DealMode.table)
                  ? _onCreateGamePressed
                  : null,
              child: const Text(
                'Deal cards !',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      );

  Widget _buildBottomBar() => Positioned(
        bottom: 4,
        right: 8,
        left: 8,
        child: BottomBar(
          onHelpPressed: () =>
              AutoRouter.of(context).push(const HelpPageRoute()),
          onAboutPressed: () =>
              AutoRouter.of(context).push(const AboutPageRoute()),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KeyboardDismisser(
        child: Stack(
          children: [
            _buildBody(),
            _buildBottomBar(),
          ],
        ),
      ),
    );
  }
}
