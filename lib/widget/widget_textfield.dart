import 'package:flutter/material.dart';
import 'dart:async';

class BorderWidth {
  double top = 0;
  double bottom = 0;
  double left = 0;
  double right = 0;
  BorderWidth.only({
    this.top = 0,
    this.bottom = 0,
    this.left = 0,
    this.right = 0,
  });
  BorderWidth.all(double value) {
    top = bottom = left = right = value;
  }
}

class ModelWidgetTextFieldOutlined {
  bool isObsecure;
  ModelWidgetTextFieldOutlined({
    this.isObsecure = false,
  });
}

class TextFieldOutlined extends StatefulWidget {
  final String hint;
  final String? label;
  final String obsecureChar;
  final TextEditingController controller;
  final TextInputType? inputType;
  final Function? onChange;
  final bool floatingText;
  final bool enabled;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;
  final BorderWidth? borderWidth;
  final Color? outlineBorder;
  final Color? colorBackground;
  final Widget? childAsset;
  final Function? functionChildAsset;
  final bool isObsecure;

  const TextFieldOutlined({
    required this.controller,
    Key? key,
    this.hint = "",
    this.inputType,
    this.onChange,
    this.floatingText = true,
    this.label,
    this.enabled = true,
    this.textInputAction,
    this.onSubmitted,
    this.isObsecure = false,
    this.obsecureChar = "*",
    this.borderWidth,
    this.outlineBorder,
    this.colorBackground,
    this.childAsset,
    this.functionChildAsset,
  }) : super(key: key);

  @override
  State<TextFieldOutlined> createState() => _TextFieldOutlinedState();
}

class _TextFieldOutlinedState extends State<TextFieldOutlined> {
  late final StreamController<ModelWidgetTextFieldOutlined> _streamController;

  @override
  void initState() {
    super.initState();
    _streamController = StreamController();
    _streamController.add(ModelWidgetTextFieldOutlined(
      isObsecure: widget.isObsecure,
    ));
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ModelWidgetTextFieldOutlined>(
        stream: _streamController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final ModelWidgetTextFieldOutlined model = snapshot.data!;
            return Container(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                border: customBorder(
                  borderColor: widget.outlineBorder ?? Colors.white,
                  borderWidth: widget.borderWidth,
                ),
                color: widget.colorBackground,
                borderRadius: BorderRadius.circular(
                  5,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: textFieldCustom(model),
                  ),
                  if (widget.isObsecure)
                    Expanded(
                      flex: 1,
                      child: textFieldOutlined(model),
                    )
                  else if (widget.childAsset != null)
                    GestureDetector(
                      onTap: () {
                        if (widget.functionChildAsset != null) {
                          widget.functionChildAsset!();
                        }
                      },
                      child: widget.childAsset,
                    )
                  else
                    Container(),
                ],
              ),
            );
          } else {
            return Container();
          }
        });
  }

  Widget textFieldOutlined(ModelWidgetTextFieldOutlined model) {
    return GestureDetector(
      onTap: () {
        model.isObsecure = !model.isObsecure;
        _streamController.add(model);
      },
      child: Icon(
        model.isObsecure ? Icons.visibility_off : Icons.visibility,
      ),
    );
  }

  TextField textFieldCustom(ModelWidgetTextFieldOutlined model) {
    return TextField(
      enabled: widget.enabled,
      keyboardType: widget.inputType,
      controller: widget.controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: widget.hint,
        label: Text(widget.label ?? ""),
        floatingLabelBehavior: widget.floatingText
            ? FloatingLabelBehavior.always
            : FloatingLabelBehavior.never,
      ),
      obscureText: model.isObsecure,
      obscuringCharacter: widget.obsecureChar,
      onChanged: (value) {
        if (widget.onChange != null) {
          widget.onChange!(value);
        }
      },
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      textInputAction: widget.textInputAction,
      onSubmitted: widget.onSubmitted,
    );
  }

  Border customBorder({
    BorderWidth? borderWidth,
    Color borderColor = Colors.white,
  }) {
    return borderWidth == null
        ? const Border()
        : Border(
            top: borderWidth.top == 0
                ? BorderSide.none
                : BorderSide(
                    color: borderColor,
                    width: borderWidth.top,
                  ),
            bottom: borderWidth.bottom == 0
                ? BorderSide.none
                : BorderSide(
                    color: borderColor,
                    width: borderWidth.bottom,
                  ),
            right: borderWidth.right == 0
                ? BorderSide.none
                : BorderSide(
                    color: borderColor,
                    width: borderWidth.right,
                  ),
            left: borderWidth.left == 0
                ? BorderSide.none
                : BorderSide(
                    color: borderColor,
                    width: borderWidth.left,
                  ),
          );
  }
}
