import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: ListView.builder(
              itemCount: userList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Card(
                      child: Center(
                        child: ListTile(
                          title: Text(textAlign: TextAlign.center, userList[index].email),
                          subtitle: Text(textAlign: TextAlign.center, userList[index].name),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: ListView.builder(
              itemCount: userList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: ((context, index) {
                return Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                      child: Card( 
                      child: Center(child: ListTile(
                        leading: const Icon(Icons.people),
                        title: Text(userList[index].email),
                        subtitle: Text(userList[index].name),
                      ),)
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class User {
  String name;
  String email;
  User(this.name, this.email);
}

List<User> userList = [
  User("Bulat", "bulat_sa1@mail"),
  User("Rinat", "rinat.safiullin.05@bk.ru"),
  User("Kamil", "Wingimobile@gmail.com"),
  User("Roman", "Vamsilver145@mail.ru"),
  User("Riyaz", "riazonbin@mail.ru"),
];
