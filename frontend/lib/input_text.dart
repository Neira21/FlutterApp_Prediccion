// Create an nice input text with a label, controller as input, and a validator

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputText extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextEditingController controller;
  final int width;
  final bool enabled;

  const InputText({
    Key? key,
    required this.label,
    this.placeholder = '',
    required this.controller,
    required this.width,
    required this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.toDouble(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 55,
            child: TextField(
              enabled: enabled,
              controller: controller,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                labelText: placeholder,
                labelStyle: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: enabled ? Colors.white : Colors.grey[300],
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              maxLength: 1,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
