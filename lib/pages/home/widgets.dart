import 'package:flutter/material.dart';
import 'package:pokards/core/game_objects.dart';

class DealModeSelector extends StatelessWidget {
  final DealMode dealMode;
  final Function(DealMode) onChanged;

  const DealModeSelector({
    Key? key,
    required this.dealMode,
    required this.onChanged,
  }) : super(key: key);

  Widget buildMode(Color color, String text, DealMode _dealMode) => Expanded(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: dealMode == _dealMode
                ? color.withOpacity(0.2)
                : color.withOpacity(0),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Material(
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onChanged(_dealMode),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: color),
                ),
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildMode(Colors.red, 'Player', DealMode.player),
        Switch(
          value: dealMode == DealMode.table,
          activeColor: Colors.green,
          overlayColor:
              MaterialStateProperty.all(Colors.black.withOpacity(0.1)),
          activeTrackColor: Colors.green[400],
          inactiveThumbColor: Colors.red,
          inactiveTrackColor: Colors.red[400],
          onChanged: (value) =>
              onChanged(value ? DealMode.table : DealMode.player),
        ),
        buildMode(Colors.green, 'Table', DealMode.table),
      ],
    );
  }
}

class PlayerIndexEditor extends StatefulWidget {
  final String initialValue;
  final Function(String value) onChanged;
  final bool isValid;
  final bool isShown;

  const PlayerIndexEditor({
    Key? key,
    required this.isValid,
    required this.isShown,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _PlayerIndexEditorState createState() => _PlayerIndexEditorState();
}

class _PlayerIndexEditorState extends State<PlayerIndexEditor>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      child: widget.isShown
          ? Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Player number:'),
                        const SizedBox(width: 8),
                        Container(
                          width: 56,
                          height: 40,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            initialValue: widget.initialValue,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.zero,
                            ),
                            onChanged: widget.onChanged,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (!widget.isValid)
                    const Flexible(
                      child: Text(
                        'Must be a number between 1 and 10',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                        ),
                      ),
                    ),
                ],
              ),
            )
          : const SizedBox(),
    );
  }
}

class BottomBar extends StatelessWidget {
  final Function() onHelpPressed;
  final Function() onAboutPressed;

  const BottomBar({
    Key? key,
    required this.onHelpPressed,
    required this.onAboutPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButtonTheme(
      data: TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Colors.black.withOpacity(0.1)),
          overlayColor:
              MaterialStateProperty.all(Colors.black.withOpacity(0.1)),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 24,
          )),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: onHelpPressed,
            child: const Text('HELP'),
          ),
          DefaultTextStyle(
            style: const TextStyle(color: Colors.white),
            child: Container(
              width: 120,
              child: Column(
                children: const [
                  Text('Version 1.0.1'),
                  Text('By tidann dev'),
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: onAboutPressed,
            child: const Text('ABOUT'),
          ),
        ],
      ),
    );
  }
}
