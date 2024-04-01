import 'package:flutter/material.dart';
import 'package:tasks_flutter/utils/theme.utils.dart';

void messageConfirm(
  BuildContext context, {
  required String text,
  required void Function() onPressed,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Center(
                child: Text(
              'Atenção!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: blackColor,
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: blackColor,
                ),
              ),
            )
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                child: const Text(
                  "CANCELAR",
                  style: buttonMessageStyle,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  onPressed();
                },
                child: const Text(
                  "CONFIRMAR",
                  style: buttonMessageStyle,
                ),
              ),
            ],
          )
        ],
      );
    },
  );
}
