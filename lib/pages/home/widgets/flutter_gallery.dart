import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';

class FlutterGallery extends StatefulWidget {
  const FlutterGallery({super.key});

  @override
  State<FlutterGallery> createState() => _FlutterGalleryState();
}

class _FlutterGalleryState extends State<FlutterGallery> {
  List tv = [];
  List imgPaths = [
    "assets/0.jpg",
    "assets/1.jpg",
    "assets/2.jpg",
    "assets/3.jpg",
    "assets/4.jpg",
    "assets/5.jpg",
    "assets/6.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
      child: Gallery3D(
          controller: Gallery3DController(itemCount: imgPaths.length),
          width: MediaQuery.of(context).size.width,
          // height: 500,
          isClip: true,
          onItemChanged: (index) {},
          itemConfig: const GalleryItemConfig(
            width: 350,
            height: 450,
            radius: 40,
            isShowTransformMask: false,
          ),
          itemBuilder: (context, index) {
            return Image.asset(
              imgPaths[index],
              fit: BoxFit.fill,
            );
          }),
    );
  }
}
