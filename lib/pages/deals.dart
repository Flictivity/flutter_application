import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/deal_edit.dart';

class Deals extends StatefulWidget {
  final String searchText;
  const Deals({super.key, required this.searchText});

  @override
  State<Deals> createState() => _DealsState();
}

class _DealsState extends State<Deals> {
  // List<Deal> newDealsList = List.from(dealsList);
  @override
  Widget build(BuildContext context) {
    // newDealsList = dealsList
    //     .where((element) => element.title.toLowerCase().contains(widget.searchText.toLowerCase()))
    //     .toList();
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("deals").snapshots(),
      builder: (context, AsyncSnapshot<dynamic> snapshot){
        if(!snapshot.hasData)
        {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
            )
          );
        }
        else{
          var list = snapshot.data.docs.where((x) => x['title'].toLowerCase().contains(widget.searchText) ? true : false).toList();

          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (context, index) => buildList(context, list[index]),
          );
        }
      },
    );
  }

  // Widget generateListTile(BuildContext context, int index) {
  //   var deal = newDealsList[index];
  //   return Card(
  //     child: ListTile(
  //       tileColor: Colors.blueGrey[100],
  //       title: Text(deal.title),
  //       subtitle: Text(deal.description),
  //       leading: Text(deal.id.toString()),
  //       onTap: () {},
  //       trailing: const Icon(
  //         Icons.arrow_right,
  //         color: Colors.black,
  //       ),
  //     ),
  //   );
  // }

  Widget buildList(context, docs){
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(docs['title']),
        subtitle: Text(docs['description']),
        leading: docs['image'] == null || docs['image'] == "" ? const Icon(Icons.closed_caption_disabled_sharp) : Image.network(docs['image']),
        trailing: const Icon(Icons.arrow_right),

        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
               builder: (context) {
                var deal = Deal(docs.id,docs['title'], docs['description'], docs['image']);
                return EditDeal('Изменить/удалить', deal, true);
               } 
            ),
          );
        },          
      ),
    );
  }
}

class Deal {
  String id;
  String title;
  String description;
  String image;
  Deal(this.id, this.title, this.description, this.image);
}

// List<Deal> dealsList = [
//   Deal(1, "Сходить в магазин", "Купить молоко, хлеб, сыр"),
//   Deal(2, "Flutter", "Прописать Flutter upgrade"),
//   Deal(3, "Поиграть Dota 2", "Выиграть в турнире"),
// ];


