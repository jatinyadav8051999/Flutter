class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: change_color == true ? Colors.green : Colors.red,
      body: Center(
        child: RaisedButton(
          child: Text('Change Color'),
          onPressed: () {
            setState(() {
              change_color = !change_color;
            });
          },
        ),
      ),
    );
  }

  bool change_color = false;
}