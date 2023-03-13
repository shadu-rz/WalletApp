  import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wallet_app/models/category/category_model.dart';
import 'package:wallet_app/models/transactions/transaction_model.dart';
import 'package:wallet_app/screens/home/widgets/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)) {
    Hive.registerAdapter(CategoryTypeAdapter());
  }
  if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
    Hive.registerAdapter(CategoryModelAdapter());
  }
  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    Hive.registerAdapter(TransactionModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: const Color.fromARGB(255, 0, 7, 72),
        useMaterial3: true,
        // primarySwatch: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      home: const SpalshScreen(),
    );
  }
}
