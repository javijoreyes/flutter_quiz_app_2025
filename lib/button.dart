import 'package:flutter/material.dart';

class OutlinedButtonExample extends StatefulWidget {
  const OutlinedButtonExample(
    this.text,
    this.action,
    this.selectedIcon, {
    super.key,
    this.iconPosition = IconPosition.leading,
  });

  final void Function() action;
  final String text;
  final Icon selectedIcon;
  final IconPosition
  iconPosition; // Nueva opción para elegir posición del ícono

  @override
  State<OutlinedButtonExample> createState() => _OutlinedButtonExampleState();
}

enum IconPosition { leading, trailing }

class _OutlinedButtonExampleState extends State<OutlinedButtonExample> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      side: const BorderSide(width: 1.2, color: Colors.blueAccent),
      foregroundColor: Colors.blueAccent,
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    );

    final label = Text(widget.text);
    final icon = widget.selectedIcon;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton.icon(
          style: style,
          onPressed: widget.action,
          icon:
              widget.iconPosition == IconPosition.leading
                  ? icon
                  : const SizedBox.shrink(),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.iconPosition == IconPosition.trailing) ...[
                Text(widget.text),
                const SizedBox(width: 8),
                icon,
              ] else
                Text(widget.text),
            ],
          ),
        ),
      ),
    );
  }
}
