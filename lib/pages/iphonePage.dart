import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IphonePage extends StatelessWidget {
  const IphonePage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: generateRow(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: generateRow(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: generateRow(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: generateRow(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: generateRow(context),
                ),
              ]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: const Color.fromARGB(90, 218, 218, 218),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: generateRow(context)),
        ),
      ),
    );
  }

  List<Widget> generateRow(BuildContext context) {
    return List.generate(4, (index) {
      return SizedBox(
        height: MediaQuery.of(context).size.width * 0.22,
        width: MediaQuery.of(context).size.width * 0.22,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
              child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
              elevation: 0,
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset("images/vkontakte.png"),
            ),
            onPressed: () {},
          )),
        ),
      );
    });
  }
}
