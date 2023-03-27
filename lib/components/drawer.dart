import 'package:flutter/material.dart';

class DrawerHomeMenu extends StatelessWidget {
  const DrawerHomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    const catUrl =
        'https://i.pinimg.com/originals/59/54/b4/5954b408c66525ad932faa693a647e3f.jpg';
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              accountName: const Text("Аккаунт"),
              accountEmail: const Text("Почта"),
              otherAccountsPictures: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.exit_to_app))
              ],
              currentAccountPicture:
                  const CircleAvatar(backgroundImage: NetworkImage(catUrl))),
          ListTile(
            title: const Text("Настройки"),
            trailing: const Icon(Icons.arrow_right),
            leading: const Icon(
              Icons.settings,
              color: Colors.blueGrey,
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Магазин"),
            trailing: const Icon(Icons.arrow_right),
            leading: const Icon(
              Icons.shop,
              color: Colors.green,
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Помощь"),
            trailing: const Icon(Icons.arrow_right),
            leading: const Icon(
              Icons.help,
              color: Colors.lightBlue,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}