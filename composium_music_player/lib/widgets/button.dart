import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:composium_music_player/constants.dart';

class ButtonWidget extends StatefulWidget {
  final IconData icon;
  final double size;
  final NeumorphicBoxShape shape;
  Function onPressed;
  ButtonWidget({this.icon, this.shape, this.size, this.onPressed});
  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Listener(
        onPointerDown: (event) {
          setState(() {
            isPressed = true;
          });
        },
        onPointerUp: (event) {
          setState(() {
            isPressed = false;
          });
        },
        child: Neumorphic(
          padding: EdgeInsets.all(10),
          // margin: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(
            widget.icon,
            size: widget.size,
            color: Colors.black,
          ),
          style: isPressed ? buttonStyleDown() : buttonStyleUp(),
        ),
      ),
    );
  }

  NeumorphicStyle buttonStyleUp() {
    return NeumorphicStyle(
      // border: NeumorphicBorder(width: 2, color: Colors.black),
      depth: 3,
      intensity: 2,
      color: mainbuttonColorUp,
      shape: NeumorphicShape.convex,
      shadowLightColor: shadowLightUp,
      shadowLightColorEmboss: shadowLightEmbossUp,
      shadowDarkColor: shadowDarkUp,
      shadowDarkColorEmboss: shadowDarkEmbossUp,
      boxShape: widget.shape,
    );
  }

  buttonStyleDown() {
    return NeumorphicStyle(
      depth: -3,
      intensity: 5,
      color: mainbuttonColorUp,
      shape: NeumorphicShape.concave,
      shadowLightColor: shadowLightDown,
      shadowLightColorEmboss: shadowLightEmbossDown,
      shadowDarkColor: shadowDarkDown,
      shadowDarkColorEmboss: shadowDarkEmbossDown,
      boxShape: widget.shape,
    );
  }
}
