import 'package:flutter/material.dart';
import 'package:flutter_application/auth/model.dart';
import 'package:flutter_application/auth/service.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

    bool _isRegister = false;
    final AuthService service = AuthService();
   

    Future signIn() async{
       UserModel? user = await service.signIn(emailController.text, passwordController.text);
    }

    Future signUp() async{
       UserModel? user = await service.registrate(emailController.text, passwordController.text);
    }

    @override
  void dispose()
  {
    super.dispose(); 
    emailController.dispose();
    passwordController.dispose();
  } 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "MonkeyApp",
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xFFFFDF4A),
                    ),
                  ),
                  Image.asset("images/monkey.png")
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.05),
              AuthInput(
                emailController,
                  icon: const Icon(
                    Icons.email,
                    color: Color(0xFFFFDF4A),
                  ),
                  text: const Text("Email"),),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              AuthInput(passwordController,
                  icon: const Icon(
                    Icons.password,
                    color: Color(0xFFFFDF4A),
                  ),
                  text: const Text("Password"),),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                    backgroundColor: MaterialStatePropertyAll(Colors.amber),
                  ),
                  onPressed: () async {
                    _isRegister ? signUp() : signIn();
                      const AlertDialog(
                        title: Text(
                          "Выполнен переход",
                        ),
                        backgroundColor: Colors.grey,
                      );
                      // Navigator.popAndPushNamed(context, '/');
                    },
                  child: Text( _isRegister ? "Registrate": "Sign In"),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              InkWell(
                child: Text( _isRegister ? "Sign In": "Registrate", style: const TextStyle(color: Colors.black54)),
                onTap: () {
                  setState(() {
                      _isRegister = !_isRegister;
                    });
                },
                ),
                ElevatedButton(onPressed: (){
                  Navigator.popAndPushNamed(context, "/iphone");
                }, child: const Text("Iphone page"))
            ],
          ),
        ),
      ),
    );
  }
}

class AuthInput extends StatelessWidget {
  
  final Icon icon;
  final Text text;
  final TextEditingController? controller;

  const AuthInput(
    this.controller,{
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextField(
        controller: controller,
        cursorColor: const Color(0xFFFFDF4A),
        decoration: InputDecoration(
          label: text,
          labelStyle: const TextStyle(color: Color(0xFFFFDF4A)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xFFFFDF4A)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xFFFFDF4A)),
          ),
          prefixIcon: icon,
        ),
      ),
    );
  }
}
