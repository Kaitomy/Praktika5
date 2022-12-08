import 'package:flutter/material.dart';
import 'package:flutter_app_5/screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;

 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key}); 
   
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      
      home: const MyHomePage(title: 'Практика 5'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
void _setscreen(){

              if (_counter != 0)
    {
    Navigator.push(
            context, MaterialPageRoute(builder: (context) => Screen(count: _counter)));
            }

}
  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    sharedPreferences!.setInt('counter', _counter);

 
  }

  @override
  void initState() {
    _counter = sharedPreferences!.getInt('counter') ?? 0;

    super.initState();
  Future(_setscreen);
  }

  @override
  Widget build(BuildContext context) {
  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);
 return ValueListenableBuilder<ThemeMode>(
      valueListenable: _notifier,
      builder: (_, mode, __) {
        return MaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.dark, // Decides which theme to show, light or dark.

     home: Scaffold(
      
      appBar: AppBar(
        title: Text(widget.title),
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Цифра для передачи на другой экран:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
//              ElevatedButton(
// child: Text("Смена темы"),
//                 onPressed: () { 
//                   String f = sharedPreferences!.getString('theme').toString();
//                   if (f.contains("White") == true){
//                   _notifier.value = mode == ThemeMode.dark ? ThemeMode.dark: ThemeMode.dark;
//                   sharedPreferences!.setString('theme', "Black");
//                   }
//                   if (f.contains("Black") == true){
//                   _notifier.value = mode == ThemeMode.light ? ThemeMode.light: ThemeMode.light;
//                   sharedPreferences!.setString('theme', "White");
//                   }
//                 }
                
//               ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Screen(count: _counter)),
                  );
                },
                child: Text("Передача данных между экранами"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    ),
     );
      },
    );
  }
}

