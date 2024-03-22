import 'package:flutter/material.dart';

class MessageFiledBox extends StatelessWidget {
  const MessageFiledBox({super.key, required this.onValue});

  final ValueChanged<String> onValue;

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();
    final focusNode = FocusNode();
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide( color: Colors.transparent),
      borderRadius: BorderRadius.circular(20)
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: InputDecoration(
        hintText: 'Escribe tu mensaje',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          onPressed: () {
            final textValue = textController.value.text;
            textController.clear();
            onValue(textValue);
          }, 
          icon: const Icon( Icons.send_rounded)
        )
      ),
      onFieldSubmitted: (value) {

        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}