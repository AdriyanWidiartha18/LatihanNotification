import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
 // const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
final GlobalKey<ScaffoldState> _scafoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scafoldkey,
        appBar: AppBar(title: Text("Latihan Notification"),),
        body: Center(
          child: Builder(
          builder : (context)=> Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(onPressed: (){showToast();}, child: Text("Show Toast"),),
              MaterialButton(onPressed: (){showSnackbar();}, child: Text("Show Snackbar"),),
              MaterialButton(onPressed: (){showAlert(context);}, child: Text("Show Alert"),)
            ],
          ),
          ),
        ),
      ),
    );
 }
                                          
showToast() {
    setState(() {
          Fluttertoast.showToast(
            msg: 'This is Notification from toast',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM
          );
        });
 }
                            
                  void showSnackbar() {
                    setState(() {
          final snackBar = SnackBar(
            content: Text("This is Notification from Snackbar"),
            duration: Duration(seconds : 5),
            action: SnackBarAction(
              label: 'Undo', onPressed: (){}));
              _scafoldkey.currentState.showSnackBar(snackBar);
        });
 }
              
  void showAlert(BuildContext context) {
    setState(() {
          Widget buttonOKE = MaterialButton(
            child: Text("OKE"),
            onPressed: (){
              Navigator.of(context).pop();
            },);

            Widget buttonCancel = MaterialButton(
            child: Text("Cancel"),
            onPressed: (){
              Navigator.of(context).pop();
            },);

            AlertDialog alert = AlertDialog(
              title: Text("Simple Alert"),
              content: Text("This is alert Message"),
              actions: [
                buttonOKE,
                buttonCancel,
             ],
             );
             showDialog(
               context: context, 
               builder: (BuildContext context){
                  return alert;
               });
            
         });
  }


}