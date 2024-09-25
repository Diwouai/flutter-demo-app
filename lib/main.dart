import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/home_screen.dart';
import 'store/movie_provider.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
