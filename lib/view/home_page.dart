import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../controller/counter_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
    print('$count');
  }

  void increment() {
    setState(() {
      count++;
    });
    print('$count');
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  final Counter counter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isFull ? Colors.red : Colors.green,
        shadowColor: Colors.red,
        centerTitle: true,
        elevation: 3,
        title: Text(isEmpty
            ? 'Sala vazia'
            : isFull
                ? 'A sala excedeu o total de $count pessoas'
                : 'Total de pessoas: $count'),
        bottomOpacity: 1,
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: isEmpty
            ? Colors.green
            : isFull
                ? Colors.red
                : Colors.green,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: isFull ? Icon(Icons.close_sharp) : Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: isFull ? Icon(Icons.close_sharp) : Icon(Icons.business),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: isFull ? Icon(Icons.close_sharp) : Icon(Icons.school),
            label: '',
          ),
        ],
        //currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        //onTap: _onItemTapped,
      ),

      //backgroundColor: Colors.deepPurple,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 119, 62, 151),
              Color.fromARGB(255, 179, 114, 223),
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.decal,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(20),
                child: Observer(
                  builder: (_) => Text(
                    isEmpty
                        ? 'A sala esta vazia'
                        : isFull
                            ? 'Lotado'
                            : 'Pode entrar!',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Observer(
                  builder: (_) => Text(
                    '${counter.count}',
                    style: TextStyle(
                      color: isFull ? Colors.red : Colors.white,
                      fontSize: 100,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.purple,
                      backgroundColor: isFull ? Colors.red : Colors.white,
                      fixedSize: const Size(100, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: isFull ? null : counter.increment,
                    child: const Text(
                      'Entrou',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    )),
                const SizedBox(
                  width: 30,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.purple,
                    backgroundColor:
                        counter.isEmpty ? Colors.grey : Colors.white,
                    fixedSize: const Size(100, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  onPressed: counter.decrement,
                  child: const Text(
                    'Saiu',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
