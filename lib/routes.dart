import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_admin/blog_post.dart';
import 'package:portfolio_admin/blog_view.dart';
import 'package:portfolio_admin/project_upload.dart';
import 'package:portfolio_admin/read_messages.dart';

import 'home.dart';

class Routes {
  Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/post':
        return MaterialPageRoute(builder: (_) => BlogPost());
      case '/messages':
        return MaterialPageRoute(builder: (_) => ReadMessages());
      case '/view':
        return MaterialPageRoute(builder: (_) => BlogView());
      case '/projects':
        return MaterialPageRoute(builder: (_)=> ProjectsUpload());

    }
  }
}