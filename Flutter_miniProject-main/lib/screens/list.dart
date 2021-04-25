import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/action/regis.dart';
import 'package:fluttertest/screens/AddProduct.dart';

// ignore: camel_case_types
class list extends StatefulWidget {
  list({Key key}) : super(key: key);

  @override
  _listState createState() => _listState();
}

// ignore: camel_case_types
class _listState extends State<list> {
  List profiles = [];
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    ActionRegis().getAllRegis().then((result) {
      print(result);
      setState(() {
        profiles = result;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF8FCACA),
          title: Text('INFORMATION'),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF96BDC4),
                Color(0xFFC2DBDF),
                //Color(0xFF8E9B61),
              ],
              stops: [0.1, 0.4],
            ),
          ),
          child: ListView.builder(
            itemCount: profiles.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Container(
                        color: Color.fromRGBO(255, 255, 255, 0.7),
                        width: 350,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text('Name-Surname:  ${profiles[index]['Name']}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child:
                                  Text('Phone number:  ${profiles[index]['Color']}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child:
                                  Text('Gender:  ${profiles[index]['Number']}'),
                            ),

                            // Padding(
                            //   padding: const EdgeInsets.all(10),
                            //   child: Text(
                            //       'Password: ${profiles[index]['Password']}'),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: SizedBox(
                              width: 100,
                              height: 40,
                              child: RaisedButton(
                                elevation: 5.0,
                                onPressed: () {
                                  final res = ActionRegis().deleteRegis(
                                      "${profiles[index]['Name']}");

                                  print(res);
                                  print('Delete Success');
                                },
                                padding: EdgeInsets.all(15.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                color: Color(0xFF6D9773),
                                child: Text(
                                  'DELETE',
                                  style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 1.5,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: SizedBox(
                              width: 100,
                              height: 40,
                              child: RaisedButton(
                                elevation: 5.0,
                                onPressed: () async {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddProduct()));
                                },
                                padding: EdgeInsets.all(15.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                color: Color(0xFF6D9773),
                                child: Text(
                                  'BACK',
                                  style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 1.5,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}