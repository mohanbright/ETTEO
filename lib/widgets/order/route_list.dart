// import 'package:etteo_demo/bloc/bloc.dart';
// import 'package:etteo_demo/model/models_class/models.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class RoutingList extends StatelessWidget {
//   final List<RouteModel> routes;

//   RoutingList({@required this.routes});

//   @override
//   Widget build(BuildContext context) {
//     // return _buildList(context);
//     return ListView.builder(
//       itemCount: routes.length,
//       itemBuilder: (context, int) {
//         return Container(
//           margin: EdgeInsets.only(top: 10),
//           child: BlocProvider.value(
//               value: BlocProvider.of<LandingBloc>(context),
//               child: Routing(routeModel: routes[int])),
//         );
//       },
//     );
//   }
// }
