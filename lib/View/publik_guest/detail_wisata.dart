import 'package:flutter/material.dart';
import 'package:jember_wisataku/View/publik_guest/rating.dart';
import 'package:jember_wisataku/View/publik_guest/maps.dart';
import 'package:jember_wisataku/widget/widget_support.dart';

class detail_wisata extends StatefulWidget {
  final Map<String, dynamic> attraction;

  const detail_wisata({Key? key, required this.attraction}) : super(key: key);

  @override
  State<detail_wisata> createState() => _detail_wisataState();
}

class _detail_wisataState extends State<detail_wisata> {
  List<int> ratings = [5, 4, 5, 3, 4]; // Contoh rating dari pengguna

  double get averageRating {
    if (ratings.isEmpty) return 0.0;
    return ratings.reduce((a, b) => a + b) / ratings.length;
  }

  @override
  Widget build(BuildContext context) {
    final attraction = widget.attraction;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios_new_outlined,
                    color: Colors.black),
              ),
              SizedBox(height: 20.0),
              Center(
                child: Image.network(
                  attraction['gambar'],
                  height: 200,
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                margin: EdgeInsets.only(top: 10.0, left: 18.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Rating(rating: averageRating.round(), size: 20),
                        SizedBox(height: 5.0),
                        Text(
                          averageRating.toStringAsFixed(1),
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    // IconButton(
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => MapsPage(
                    //           destinationLatitude:
                    //               double.parse(attraction['latitude']),
                    //           destinationLongitude:
                    //               double.parse(attraction['longitude']),
                    //         ),
                    //       ),
                    //     );
                    //   },
                    //   icon: Icon(Icons.location_on,
                    //       color: Colors.red), // Assuming Maps icon is red
                    // ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                margin: EdgeInsets.only(top: 10.0, left: 18.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      attraction['nama_wisata'],
                      style: AppWidget.bold2TextFieldStyle(),
                    ),
                    SizedBox(height: 10),
                    Text(
                      attraction['deskripsi'],
                      style: AppWidget.leghtTextFieldStyle(),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      "Informasi Tiket Masuk dan Biaya Parkir:",
                      style: AppWidget.bold2TextFieldStyle(),
                    ),
                    SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        style: AppWidget.leghtTextFieldStyle(),
                        children: [
                          TextSpan(
                            text:
                                "• Tiket masuk Pantai Papuma di weekdays sebesar Rp. 18.000,- per orang.\n",
                          ),
                          TextSpan(
                            text:
                                "• Tiket masuk Pantai Papuma di weekend sebesar Rp. 25.000,- per orang.\n",
                          ),
                          TextSpan(
                            text:
                                "• Biaya parkir mobil sebesar Rp. 10.000,- per unit.\n",
                          ),
                          TextSpan(
                            text:
                                "• Biaya parkir motor sebesar Rp. 5.000,- per unit.\n",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
