import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertest/action/regis.dart';
import 'package:fluttertest/screens/list.dart';

import 'package:fluttertest/screens/login_screen.dart';
import 'package:fluttertest/utilities/constants.dart';

class AddProduct extends StatefulWidget {
  List regis = [];
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    ActionRegis().getAllRegis().then((result) {
      print(result);
      setstate() {
        regis = result;
      }
    });
  }

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController nameController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController numController = TextEditingController();

  Widget _buildName() {
    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Name - Surname',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            controller: nameController,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.adjust,
                color: Colors.white,
              ),
              hintText: 'Enter your full name',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
    return column;
  }

  Widget _buildColor() {
    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Phone number',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            //email controller
            controller: colorController,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.adjust,
                color: Colors.white,
              ),
              hintText: 'Enter your phone number',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
    return column;
  }

  Widget _buildNum() {
    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Gender',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            controller: numController,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.adjust,
                color: Colors.white,
              ),
              hintText: 'Enter your gender',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
    return column;
  }

//botton
  Widget _buildAddBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: SizedBox(
        height: 50,
        child: RaisedButton(
          elevation: 5.0,
          onPressed: () async {
            ActionRegis().addNewRegis({
              "Name": nameController.text.trim(),
              "Color": colorController.text.trim(),
              "Number": numController.text.trim(),
            });
            print('to show');
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => list()));
          },
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Color(0xFF6D9773),
          child: Text(
            'NEXT',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: SizedBox(
        height: 50,
        child: RaisedButton(
          elevation: 5.0,
          onPressed: () async {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
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
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF96BDC4),
                      Color(0xFFC2DBDF),
                      //Color(0xFF8E9B61),
                      //  Color(0xFFFA9E46),
                      //  Color(0xFFF98F2A),
                    ],
                    stops: [0.4, 0.7],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'BOOKING CLINIC  AT HOME',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildName(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildColor(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildNum(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildBackBtn(),
                      _buildAddBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}