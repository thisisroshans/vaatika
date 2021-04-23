import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vrksh_vaatika/provider/auth_provider.dart';

import 'home.dart';

class LoginPage extends StatelessWidget {
  AuthProvider provider;
  TextEditingController _phone = TextEditingController();
  TextEditingController _otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AuthProvider>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Vrksh - Vaatika',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.green.shade900)),
                Text('Gardeners Community by plantsmen',
                    style: TextStyle(fontSize: 14, color: Color(0xFF383838))),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 20),
                  height: MediaQuery.of(context).size.height * .65,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Wrap(
                          children: <Widget>[
                            Text('Get Started with Vaatika  ',
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xFF383838))),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(4),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              child: TextFormField(
                                controller: _phone,
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                    hintText: 'Phone No.',
                                    border: InputBorder.none),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Visibility(
                              visible: provider.vId != null,
                              child: Container(
                                padding: EdgeInsets.all(4),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                child: TextFormField(
                                  controller: _otp,
                                  obscureText: true,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                      hintText: 'OTP',
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (provider.vId == null) {
                            provider.submitPhoneNumber(
                                _phone.text.toString().trim());
                          } else {
                            provider
                                .submitOTP(_otp.text.toString().trim())
                                .then((value) => Navigator.pushReplacement(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (c) => HomePage())));
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 68,
                          color: Colors.green,
                          padding: EdgeInsets.all(16),
                          alignment: Alignment.topLeft,
                          child: Text(
                            (provider.vId == null) ? 'Continue\n' : 'Enter OTP',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter:
                      ColorFilter.mode(Colors.blueGrey, BlendMode.overlay),
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1526381805515-3fec2d69e7cc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=608&q=80')),
            ),
          )),
    );
  }
}
