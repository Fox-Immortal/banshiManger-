import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:panshimanager/business_logic_layer/authentication/data/providers/user_provider.dart';
import 'package:panshimanager/flurorouter.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const PanshiManagerApp());
}


class PanshiManagerApp extends StatefulWidget {
  const PanshiManagerApp({Key? key}) : super(key: key);

  @override
  _PanshiManagerAppState createState() => _PanshiManagerAppState();
}

class _PanshiManagerAppState extends State<PanshiManagerApp> {

  @override
  void initState() {
    Flurorouter.setupRouter();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
     return MultiProvider(
       providers: [
         ChangeNotifierProvider<UserProvider>(
           create: (_)=> UserProvider(),
         ),
       ],
       child: MaterialApp(
         debugShowCheckedModeBanner: false,
         initialRoute: '/',
         onGenerateRoute: Flurorouter.router.generator,
       ),
     );
  }
}
