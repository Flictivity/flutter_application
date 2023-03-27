import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/auth/model.dart';
import 'package:flutter_application/pages/authPage.dart';
import 'package:flutter_application/pages/home.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel? model = Provider.of<UserModel?>(context);
    final bool check = model != null;
    return check ? const Home() : const AuthPage();
  }
}