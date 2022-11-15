import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString("email");
  print(email);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: email == null ? Login() : Home(),
  ));
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.green,
          onPressed: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.setString("email", "useremail@gmail.com");
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
              return Home();
            }));
          },
          child: const Text(
            "Login",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: Center(
        child: RaisedButton(
          color: Colors.red,
          onPressed: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.remove("email");
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
              return Login();
            }));
          },
          child: Text("Logout",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        ),
      ),
    );
  }
}
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: Center(
        child: RaisedButton(
          color: Colors.red,
          onPressed: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.remove("email");
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
              return Login();
            }));
          },
          child: Text("Logout",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        ),
      ),
    );
  }
}class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: Center(
        child: RaisedButton(
          color: Colors.red,
          onPressed: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.remove("email");
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
              return Login();
            }));
          },
          child: Text("Logout",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        ),
      ),
    );
  }
}

