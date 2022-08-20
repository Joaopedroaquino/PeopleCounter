import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Pode entrar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            '0',
            style: TextStyle(
              color: Colors.white,
              fontSize: 100,
              fontWeight: FontWeight.w300,
            ),
          ),
          Row(
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'data',
                  )),
              TextButton(
                onPressed: () {},
                child: Text('data2'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
