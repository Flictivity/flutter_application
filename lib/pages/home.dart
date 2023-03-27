//import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/auth/service.dart';
import 'package:flutter_application/pages/calendar.dart';
import 'package:flutter_application/pages/deals.dart';
import 'package:flutter_application/pages/cards.dart';
import 'package:flutter_application/components/drawer.dart';

import '../components/deal_edit.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String searchText = "";
  int index = 0;
  bool _showButton = true;
  TextEditingController searchController = TextEditingController();
  String title = "Список дел";
  bool titleAppBar = false;

  @override
  Widget build(BuildContext context) {
    final listPages = [
      Deals(searchText: searchText),
      const Calendar(),
      const Cards(),
    ];
    AppBar appBarSearch = AppBar(
      centerTitle: true,
      title: TextField(
          decoration: const InputDecoration(label: Text("Название")),
          controller: searchController,
          onChanged: (value) {
            setState(() {
              searchText = value;
            });
          }),
      actions: [
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            setState(() {
              searchController.clear();
              searchText = "";
              titleAppBar = false;
            });
          },
        )
      ],
    );
    AppBar appBar = AppBar(
      title: Text(title),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              setState(() {
                titleAppBar = true;
              });
            },
            icon: const Icon(Icons.search)),
            IconButton(
            onPressed: () async {
              await AuthService().logOut();
              // Navigator.popAndPushNamed(context, '/');
            },
            icon: const Icon(Icons.exit_to_app),
          ),
      ],
    );
    return Scaffold(
      appBar: titleAppBar ? appBarSearch : appBar,
      // appBar: AppBar(
      //   title: Text(title),
      //   centerTitle: true,
      //   backgroundColor: const Color(0xFFFFDF4A),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         Navigator.popAndPushNamed(context, '/');
      //       },
      //       icon: const Icon(Icons.exit_to_app),
      //     ),
      //   ],
      // ),
      body: listPages.elementAt(index),
      drawer: const DrawerHomeMenu(),
            floatingActionButton: AnimatedOpacity(
        duration: const Duration(milliseconds: 400),
        opacity: _showButton ? 1 : 0,
        child: FloatingActionButton(
            backgroundColor: Colors.amber,
            onPressed: () {
              if(index == 0)
              {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) {
                      var deal = Deal("","","","");
                      return EditDeal('Изменить/удалить', deal, false);
                    } 
                  ),
                );
              }
            },
            child: const Icon(
              Icons.add,
            )
            ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        backgroundColor: Colors.amber,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Список дел",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Календарь",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            label: "Карточки",
          )
        ],
        onTap: (value) {
          setState(() {
            index = value;
            if (index == 1) {
              _showButton = false;
              title = "Календарь";
            } else if (index == 0) {
              _showButton = true;
              title = "Список дел";
            }else{
              _showButton = false;
              title = "Карточки";
            }
          });
        },
      ),
    );
  }
}
