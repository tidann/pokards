import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:pokards/core/game_objects.dart';

GameProperties createGame({
  required DealMode dealMode,
  required String gameId,
  int? playerIndex,
}) {
  late Role role;
  final digest = sha256.convert(utf8.encode(gameId)).bytes;
  final seed = digest.take(5).reduce((value, element) => value * element);
  final random = Random(seed);

  final List<PlayingCard> deck = [];
  for (final Suit s in Suit.values) {
    for (final Rank r in Rank.values) {
      deck.add(PlayingCard(rank: r, suit: s));
    }
  }
  deck.shuffle(random);

  final boardCards = List.generate(
    5,
    (_) => deck.removeAt(random.nextInt(deck.length)),
  );

  switch (dealMode) {
    case DealMode.player:
      if (playerIndex == null) {
        throw Exception('As Role is Player, playerIndex must not be null.');
      }

      for (int i = 0; i < playerIndex; i++) {
        deck.removeAt(random.nextInt(deck.length));
        deck.removeAt(random.nextInt(deck.length));
      }

      final cards = List.generate(
        2,
        (_) => deck.removeAt(random.nextInt(deck.length)),
      );

      role = Role.player(index: playerIndex, cards: cards);
      break;
    case DealMode.table:
      role = const Role.table();
      break;
  }

  return GameProperties(
    role: role,
    gameId: gameId,
    boardCards: boardCards,
  );
}
