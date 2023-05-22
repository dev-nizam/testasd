import 'package:flutter/material.dart';
import 'package:testasd/ui/Search.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          SizedBox(
            height: 100,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                    const EdgeInsetsDirectional.fromSTEB(
                        20.0, 0.0, 20.0, 0.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Search()));
                      },
                      child: TextFormField(
                        enabled: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Search ',
                          hintText: 'Search ',




                        ))
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
