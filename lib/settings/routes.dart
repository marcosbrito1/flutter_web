import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:top_professor/view/Home.dart';
import 'package:top_professor/view/Login.dart';

final routes = GoRouter(
  routes: [
    GoRoute(
      name: 'login',
      path: '/',
      builder: (context, state) => loginPage(),
    ),
    GoRoute(
      name: 'home',
      path: '/home',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: homePage(),
      ),
    ),

  ],
  redirect: (context, state) async{
    if(await SessionManager().get("token")==null){
      return '/';
    }
    return null;
  },
);