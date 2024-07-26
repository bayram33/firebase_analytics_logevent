import "package:flutter/material.dart";

class BussinesPage extends StatelessWidget {
  const BussinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.business_rounded,
              size: 50,
            ),
            Text("Bussines Page")
          ],
        ),
      ),
    );
  }
}
