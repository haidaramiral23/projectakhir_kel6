// import 'package:bcdx_11312136/app/modules/event/controllers/event_controller.dart';
// import 'package:bcdx_11312136/main.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// class DescriptionView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Deskripsi dari Firebase'),
//       ),
//       body: FutureBuilder(
//         future: fetchDataFromFirebase(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else {
//             return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 snapshot.data as String,
//                 style: TextStyle(
//                   fontSize: 16.0,
//                 ),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }