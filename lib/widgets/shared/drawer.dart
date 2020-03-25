// import 'dart:async';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:etteo_mobile/helpers/string_helper.dart';
// import 'package:etteo_mobile/models/user_profile_model.dart';
// import 'package:etteo_mobile/widgets/logout.dart';
// import 'package:etteo_mobile/widgets/offline/offline_queue.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:etteo_mobile/bloc/bloc.dart';
// import 'package:etteo_mobile/widgets/settings/settings.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:package_info/package_info.dart';

// class DrawerWidget extends StatefulWidget {
//   final UserProfileModel userProfile;

//   DrawerWidget(this.userProfile);

//   @override
//   _DrawerWidgetState createState() => _DrawerWidgetState();
// }

// class _DrawerWidgetState extends State<DrawerWidget> {
//   bool enableControls = true;
//   OfflineBloc _offlineBloc;
//   int queueCount = 0;
//   StreamSubscription offlineSubscription;

//   @override
//   void initState() {
//     super.initState();
//     _offlineBloc = BlocProvider.of<OfflineBloc>(context);
//     offlineSubscription = _offlineBloc.state.listen((s) {
//       if (s is OfflineQueueDataFetched) {
//         setState(() {
//           queueCount = s.count;
//         });
//       }
//     });
//   }

//   @override
//   dispose() {
//     super.dispose();
//     offlineSubscription?.cancel();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//         child: Container(
//       child: new ListView(
//         children: <Widget>[
//           UserAccountsDrawerHeader(
//             accountName: Text(checkNull(this.widget.userProfile?.fullName),
//                 style: Theme.of(context).textTheme.headline),
//             accountEmail: Text(checkNull(this.widget.userProfile.emailAddress),
//                 style: Theme.of(context).textTheme.subhead),
//             currentAccountPicture: this.widget.userProfile.profileImage == null
//                 ? Image.asset('assets/images/account_circle.png')
//                 : SizedBox(
//                   width: 64,
//                   height: 64,
//                   child: CachedNetworkImage(
//                     imageUrl: this.widget.userProfile.profileImage,
//                     useOldImageOnUrlChange: true,
//                     // placeholder: (context, url) => CircularProgressIndicator(),
//                     errorWidget: (context, url, error) =>
//                         const Icon(Icons.error),
//                   ),
//                 ),
//             decoration: BoxDecoration(color: Color.fromARGB(200, 12, 49, 110)),
//           ),
//           new ListTile(
//             leading: Icon(Icons.settings),
//             title: Text("Settings"),
//             onTap: enableControls
//             ? () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                       builder: (context) => BlocProvider.value(
//                             value: _offlineBloc,
//                             child: Settings(),
//                           )),
//                 );
//               }
//             : () {},
//           ),
//           new Divider(),
//           new ListTile(
//               leading: Icon(FontAwesomeIcons.database),
//               // title: Text("Offline Queue (${_offlineBloc.queueCount})"),
//               title: Text("Queue"),
//               trailing: Text('$queueCount',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
//               onTap: enableControls
//                   ? () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                             builder: (context) => BlocProvider.value(
//                                   value: _offlineBloc,
//                                   child: OfflineQueue(),
//                                 )),
//                       );
//                     }
//                   : () {}),
//           new Divider(),
//           new ListTile(
//               leading: Icon(Icons.help),
//               title: Text("Help"),
//               onTap: () {
//                 _launchURL();
//               }),
//           new Divider(),
//           new ListTile(
//             leading: Icon(Icons.power_settings_new),
//             title: new Text("Sign-Out"),
//             onTap: enableControls
//                 ? () {
//                     _offlineBloc.dispatch(DeleteAllOfflineData());

//                     _offlineBloc.state.listen((state) => {
//                           if (state is DeleteAllOfflineDataCompleted)
//                             {
//                               Navigator.of(context).pushReplacement(
//                                 MaterialPageRoute(
//                                     builder: (context) => LogoutPage()),
//                               )
//                             }
//                         });
//                   }
//                 : () {},
//           ),
//           Divider(),
//           ListTile(
//             enabled: false,
//             title: Text("Version"),
//             trailing: FutureBuilder(
//               future: getVersionNumber(),
//               builder: (BuildContext context, AsyncSnapshot<String> snapshot) =>
//                   Text(
//                 snapshot.hasData ? snapshot.data : "Loading ...",
//                 style: TextStyle(color: Colors.black38),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ));
//   }
// }

// Future<String> getVersionNumber() async {
//   PackageInfo packageInfo = await PackageInfo.fromPlatform();
//   return packageInfo.version;

//   // Other data you can get:
//   //
//   // 	String appName = packageInfo.appName;
//   // 	String packageName = packageInfo.packageName;
//   //	String buildNumber = packageInfo.buildNumber;
// }

// _launchURL() async {
//   const url = 'https://portal.etteo.com/knowledge-base';
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }
