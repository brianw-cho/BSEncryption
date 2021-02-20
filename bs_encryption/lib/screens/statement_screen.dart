import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bs_encryption/constants/color_constant.dart';
import 'package:bs_encryption/models/card_model.dart';
import 'package:bs_encryption/models/transaction_model.dart';
import 'package:bs_encryption/models/statement_model.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:io';

class StatementScreen extends StatefulWidget {
  @override
  _StatementScreenState createState() => _StatementScreenState();
}

class _StatementScreenState extends State<StatementScreen>{
  final LocalAuthentication auth = LocalAuthentication();
  final FlutterSecureStorage storage = new FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child:AppBar(
          backgroundColor: Theme.of(context).accentColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10)
              )
          ),

          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Padding(
              padding: EdgeInsets.only(right: 135, bottom: 4),
              child: Text(
                  'Your Statements',
                  style: GoogleFonts.nunito(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.white
                  )
              ),
            ),
          ),
        ),
      ),

    body: Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          Container(
            height: 610,
            child: ListView.builder(
                padding: EdgeInsets.only(left:16, right: 16, top: 10),
                itemCount: statements.length,
                itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.only(bottom: 8),
                    height: 68,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x04000000),
                          blurRadius: 10,
                          spreadRadius: 10,
                          offset: Offset(0, 8)
                        )
                      ],
                      color: kBlackColor
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 8,
                          left: 10,
                          child: Text(
                            'Release Date',
                            style: GoogleFonts.nunito(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: kPurpleColor
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 12,
                          left: 10,
                          child: Text(
                            statements[index].date,
                            style: GoogleFonts.nunito(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: kWhiteColor
                            ),
                          ),
                        ),
                        Positioned(
                          top:10,
                            right:100,
                          child: Image.asset(
                              statements[index].downloaded,
                              height: 50,
                              width: 50,
                          )
                        ),
                        Positioned(
                            top: 19,
                            right: 10,
                            child: SizedBox(
                              width: 90,
                                height: 30,
                                child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states){
                                        if (states.contains(MaterialState.pressed))
                                          return kButtonPressedColor;
                                        return kAccentColor;
                                      }
                                  ),
                              ),
                              child: !statements[index].isDownloaded ? Text(
                                'Download',
                                style: GoogleFonts.nunito(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: kWhiteColor
                                )
                              ) : Text(
                                  'View',
                                  style: GoogleFonts.nunito(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: kWhiteColor
                                  )
                              ),
                              onPressed: () async {
                                if (!statements[index].isDownloaded) {
                                  bool biometricAvailable = await auth
                                      .canCheckBiometrics;
                                  if (biometricAvailable) {
                                    bool valid = await auth
                                        .authenticateWithBiometrics(
                                        localizedReason: 'Use Your Fingerprint to Download Your Statement');

                                    if (valid) {
                                      await storage.write(key: statements[index].date,
                                          value: statements[index].password);
                                      print(await storage.read(
                                          key: 'PDF password'));
                                      setState(() => statements[index].isDownloaded = true);
                                      setState(() => statements[index].downloaded = 'assets/icons/downloaded-logo.png');
                                    }
                                  }
                                }
                                else {
                                  bool biometricAvailable = await auth.canCheckBiometrics;
                                  if (biometricAvailable){
                                    bool valid = await auth.authenticateWithBiometrics(localizedReason: "Use Your Fingerprint to View Your Statement");

                                    if (valid) {
                                      // Get password
                                      String pass = await storage.read(key: statements[index].date);
                                      // Use password to load PDF into app
                                      print(pass);
                                    }
                                  }
                                  //open pdf
                                }
                                //button activation code
                              },
                            )
                            )
                        )
                      ],
                    ),
                  );
                }
            ),
          )
        ]
      ),
    ),
    );
  }
}