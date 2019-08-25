import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: "Tabs and Bottom nav",
    theme: ThemeData(
      primaryColor: Colors.lightGreen[700],
    ),
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  );
}

class HomePage extends StatefulWidget {
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // List<Step> _steps = [
  //   Step(
  //     title: Text('Step 1'),
  //     content: Text('Content 1'),
  //     isActive: true,
  //   ),        
  //   Step(
  //     title: Text('Step 2'),
  //     content: Text('Content 2'),
  //     isActive: false,
  //   ),
  //   Step(
  //     title: Text('Step 3'),
  //     content: Text('Content 3'),
  //     isActive: false
  //   ),
  // ];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Home page"),
    ),
    // body: Body(),
    // body: Stepper(
    //   steps: _steps,
    //   currentStep: 0,
    //   type: StepperType.horizontal,
    // ),
    body: TabBarView(
      children: <Widget>[
        NewPage("First page"),
        NewPage("Second page"),
      ],
      controller: _controller,
    ),
    bottomNavigationBar: Material(
      color: Colors.lightGreen[200],
      child: TabBar(
        labelColor: Colors.lightGreen[900],
        indicatorColor: Colors.lightGreen[900],
        unselectedLabelColor: Colors.black87,
        controller: _controller,
        tabs: <Widget>[
          Tab(
            icon: Icon(Icons.favorite),
            text: 'Favorites',
          ),
          Tab(
            icon: Icon(Icons.file_download),
            text: 'Save',
          ),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.photo_camera),
      backgroundColor: Colors.lightGreen[900],
      onPressed: () => print('FAB pressed!'),
    ),
  );
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            showSnackBarBtn(context),
            showAlert(context),
          ],
        ),
      ),
    );

  Widget showSnackBarBtn(BuildContext context) => RaisedButton(
    padding: const EdgeInsets.only(top: 12.0, bottom: 12.0, left: 12.0, right: 12.0),
    onPressed: () => Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text("I was pressed"),
        duration: Duration(
          seconds: 3,
        ),
      )
    ),
    child: Text("Open snackBar", style: TextStyle(color: Colors.white, fontSize: 18.0)),
    color: Colors.lightGreen[900],
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
  );

  AlertDialog alert = new AlertDialog(
    content: Text("Dialog is up", style: TextStyle(fontSize: 30)),
  );

  Widget showAlert(BuildContext context) => RaisedButton(
    padding: const EdgeInsets.only(top: 12.0, bottom: 12.0, left: 12.0, right: 12.0),
    onPressed: () => showDialog(context: context, child: alert),
    child: Text("Open alert", style: TextStyle(color: Colors.blue[900], fontSize: 18.0)),
    color: Colors.lightBlue[200],
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
  );
}

class NewPage extends StatelessWidget {
  final String title;

  NewPage(this.title);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Text(title),
    )
  );
}