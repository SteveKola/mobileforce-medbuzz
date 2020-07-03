import 'package:MedBuzz/ui/size_config/config.dart';
import 'package:flutter/material.dart';

import '../home_page.dart';


class DeleteSuccess extends StatelessWidget {
  Color color;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: color = Color(0xffFAFAFA),
          leading: IconButton(
              icon: Icon(Icons.keyboard_backspace,
                  color: Theme.of(context).primaryColorDark
              ),

              onPressed: () {
                //Function to navigate to Fitness screen page here.
              }),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment:  MainAxisAlignment.center,
            children: [
              Image.asset('images/check.png'),
              SizedBox(
                height: Config.yMargin(context, 5),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Successfully Deleted',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Segoe',
                  ),
                  ),
                  Text('"Running"',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Segoe',
                    ),),
                ],
              ),
            ],
          ),
        )
    );
  }
}
