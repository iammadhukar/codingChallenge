import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'UserName',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
              ),
              validator: (String? value) {
                if (value?.isEmpty ?? true) {
                  return "Enter username";
                } else {
                  return null;
                }
              },
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Search"),
            ),
          ],
        ),
      ],
    );
  }
}
