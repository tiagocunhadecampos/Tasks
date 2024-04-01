import 'package:flutter/material.dart';
import 'package:tasks_flutter/utils/theme.utils.dart';

void erroMessage(BuildContext context, {required String message}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Padding(
                padding: EdgeInsets.only(left: 14),
                child: Text(
                  'Erro inesperado',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Text(
              message,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK', style: buttonMessageStyle),
          ),
        ],
      );
    },
  );
}
