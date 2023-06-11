import 'package:flutter/material.dart';

enum ButtonVariant {
  primary,
  secondary,
  light,
  link,
}

class Button extends StatefulWidget {
  const Button(
      {super.key,
      required this.onPressed,
      required this.text,
      this.variant = ButtonVariant.primary,
      this.size = const Size(287, 50),
      this.textStyle =
          const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)});

  final VoidCallback onPressed;
  final String text;
  final ButtonVariant variant;
  final Size size;
  final TextStyle textStyle;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  Color getBackgroundColor() {
    switch (widget.variant) {
      case ButtonVariant.primary:
        return const Color(0xFF92A8D1);
      case ButtonVariant.secondary:
        return const Color(0xFFC3D4E3);
      default:
        return const Color(0xFFFFFFFF);
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.variant) {
      case ButtonVariant.light:
        return OutlinedButton(
            onPressed: widget.onPressed,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              minimumSize: widget.size,
              side: const BorderSide(color: Color(0xFF99A3B2)),
            ),
            child: Text(widget.text, style: widget.textStyle));

      case ButtonVariant.link:
        return OutlinedButton(
            onPressed: widget.onPressed,
            style: OutlinedButton.styleFrom(
              foregroundColor: Color(0xFF448BFA),
              minimumSize: widget.size,
              side: const BorderSide(color: Color(0xFF99A3B2)),
            ),
            child: Text(widget.text, style: widget.textStyle));

      default:
        return ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: getBackgroundColor(),
            foregroundColor: Colors.white,
            minimumSize: widget.size,
          ),
          child: Text(widget.text, style: widget.textStyle),
        );
    }
  }
}
