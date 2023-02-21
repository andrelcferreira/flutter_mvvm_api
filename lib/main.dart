import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../src/repositories/user_repository.dart';
import '../src/viewmodels/user_viewmodel.dart';
import '../src/views/user_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserViewModel(UserRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter API Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const UserListPage(),
      ),
    );
  }
}
//Aqui, a classe MyApp agora é um StatelessWidget que envolve a UserListPage em um MultiProvider, fornecendo o UserViewModel ao aplicativo e definindo-o como a página inicial do aplicativo. Note que a importação do UserListPage agora vem do arquivo user_view.dart.




