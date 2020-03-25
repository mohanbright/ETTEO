// import 'package:etteo_mobile/bloc/bloc.dart';
// import 'package:etteo_mobile/bloc/network_connectivity_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class NetworkStatusIndicator extends StatefulWidget {
//   const NetworkStatusIndicator();

//   @override
//   _NetworkStatusColorIndicatorState createState() =>
//       _NetworkStatusColorIndicatorState();
// }

// class _NetworkStatusColorIndicatorState extends State<NetworkStatusIndicator> {
//   NetworkConnectivityBloc _networkConnectivityBloc;
//   @override
//   void initState() {
//     _networkConnectivityBloc =
//         BlocProvider.of<NetworkConnectivityBloc>(context);
//     _networkConnectivityBloc.dispatch(InitNetworkConnectivity());
//     _networkConnectivityBloc.dispatch(ListenNetworkConnectivity());

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder(
//       bloc: _networkConnectivityBloc,
//       builder: (BuildContext context, NetworkConnectivityState state) {
//         if (state is NetworkOnline) {
//           return showNetworkStatus(Colors.green);
//         }
//         if (state is NetworkOffline) {
//           return showNetworkStatus(Colors.red);
//         }
//         return showNetworkStatus(Colors.grey);
//       },
//     );
//   }
// }

// Widget showNetworkStatus(MaterialColor color) {
//   return IconButton(
//     icon: Icon(
//       Icons.fiber_manual_record,
//       color: color,
//       size: 15,
//     ),
//     onPressed: () {},
//   );
// }
