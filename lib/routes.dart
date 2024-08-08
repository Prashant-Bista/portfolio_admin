import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_admin/blog_post.dart';
import 'package:portfolio_admin/read_messages.dart';

import 'home.dart';

class Routes{
  Route<dynamic>? routeGenerator(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(settings: settings, builder: (_) => Home());
    }
    else if (settings.name=='/blog') {
      return MaterialPageRoute(settings: settings, builder: (_) => BlogPost());
    }
     else if (settings.name == '/messages')
       return MaterialPageRoute(settings:settings, builder:(_)=> ReadMessages());
    }
  }