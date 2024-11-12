// import 'dart:io';
// import 'dart:math';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image/image.dart' as img;
//
//
// class RegistrationScreen extends StatefulWidget {
//   const RegistrationScreen({Key? key}) : super(key: key);
//
//   @override
//   State<RegistrationScreen> createState() => _HomePageState();
// }
// class _HomePageState extends State<RegistrationScreen> {
//   //TODO declare variables
//   late ImagePicker imagePicker;
//   File? _image;
//
//   //TODO declare detector
//   late FaceDetector faceDetector;
//
//   //TODO declare face recognizer
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     imagePicker = ImagePicker();
//
//     //TODO initialize face detector
//
//     final options = FaceDetectorOptions(performanceMode: FaceDetectorMode.accurate);
//     faceDetector = FaceDetector(options: options);
//
//     //TODO initialize face recognizer
//
//   }
//
//   //TODO capture image using camera
//   _imgFromCamera() async {
//     XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
//     if (pickedFile != null) {
//       setState((){
//         _image = File(pickedFile.path);
//         doFaceDetection();
//       });
//     }
//   }
//
//   //TODO choose image using gallery
//   _imgFromGallery() async {
//     XFile? pickedFile =
//         await imagePicker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState((){
//         _image = File(pickedFile.path);
//         doFaceDetection();
//       });
//     }
//   }
//
//   //TODO face detection code here
//
//   doFaceDetection() async {
//     //TODO remove rotation of camera images
//
//     InputImage inputImage = InputImage.fromFile(_image!);
//     //TODO passing input to face detector and getting detected faces
//     final List<Face> faces = await faceDetector.processImage(inputImage);
//
//     for (Face face in faces) {
//       final Rect boundingBox = face.boundingBox;
//
//       // final double? rotX = face.headEulerAngleX; // Head is tilted up and down rotX degrees
//       // final double? rotY = face.headEulerAngleY; // Head is rotated to the right rotY degrees
//       // final double? rotZ = face.headEulerAngleZ; // Head is tilted sideways rotZ degrees
//       //
//       // // If landmark detection was enabled with FaceDetectorOptions (mouth, ears,
//       // // eyes, cheeks, and nose available):
//       // final FaceLandmark? leftEar = face.landmarks[FaceLandmarkType.leftEar];
//       // if (leftEar != null) {
//       //   final Point<int> leftEarPos = leftEar.position;
//       // }
//       //
//       // // If classification was enabled with FaceDetectorOptions:
//       // if (face.smilingProbability != null) {
//       //   final double? smileProb = face.smilingProbability;
//       // }
//       //
//       // // If face tracking was enabled with FaceDetectorOptions:
//       // if (face.trackingId != null) {
//       //   final int? id = face.trackingId;
//       // }
//     // }
//     print("Rect = "+boundingBox.toString());
//     //TODO call the method to perform face recognition on detected faces
//   }
//
//   //TODO remove rotation of camera images
//   removeRotation(File inputImage) async {
//     final img.Image? capturedImage = img.decodeImage(await File(inputImage!.path).readAsBytes());
//     final img.Image orientedImage = img.bakeOrientation(capturedImage!);
//     return await File(_image!.path).writeAsBytes(img.encodeJpg(orientedImage));
//   }
//
//   //TODO perform Face Recognition
//
//   //TODO Face Registration Dialogue
//   // TextEditingController textEditingController = TextEditingController();
//   // showFaceRegistrationDialogue(Uint8List cropedFace, Recognition recognition){
//   //   showDialog(
//   //     context: context,
//   //     builder: (ctx) => AlertDialog(
//   //       title: const Text("Face Registration",textAlign: TextAlign.center),alignment: Alignment.center,
//   //       content: SizedBox(
//   //         height: 340,
//   //         child: Column(
//   //           crossAxisAlignment: CrossAxisAlignment.center,
//   //           children: [
//   //             const SizedBox(height: 20,),
//   //             Image.memory(
//   //               cropedFace,
//   //               width: 200,
//   //               height: 200,
//   //             ),
//   //             SizedBox(
//   //               width: 200,
//   //               child: TextField(
//   //                 controller: textEditingController,
//   //                   decoration: const InputDecoration( fillColor: Colors.white, filled: true,hintText: "Enter Name")
//   //               ),
//   //             ),
//   //             const SizedBox(height: 10,),
//   //             ElevatedButton(
//   //                 onPressed: () {
//   //                   recognizer.registerFaceInDB(textEditingController.text, recognition.embeddings);
//   //                   textEditingController.text = "";
//   //                   Navigator.pop(context);
//   //                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//   //                     content: Text("Face Registered"),
//   //                   ));
//   //                 },style: ElevatedButton.styleFrom(primary:Colors.blue,minimumSize: const Size(200,40)),
//   //                 child: const Text("Register"))
//   //           ],
//   //         ),
//   //       ),contentPadding: EdgeInsets.zero,
//   //     ),
//   //   );
//   // }
//   //TODO draw rectangles
//   // var image;
//   // drawRectangleAroundFaces() async {
//   //   image = await _image?.readAsBytes();
//   //   image = await decodeImageFromList(image);
//   //   print("${image.width}   ${image.height}");
//   //   setState(() {
//   //     image;
//   //     faces;
//   //   });
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           _image != null
//               ?
//           // Container(
//           //         margin: const EdgeInsets.only(top: 100),
//           //         width: screenWidth - 50,
//           //         height: screenWidth - 50,
//           //         child: Image.file(_image!),
//           //       )
//               Container(
//                 margin: const EdgeInsets.only(
//                     top: 60, left: 30, right: 30, bottom: 0),
//                 child: FittedBox(
//                   child: SizedBox(
//                     width: image.width.toDouble(),
//                     height: image.width.toDouble(),
//                     child: CustomPaint(
//                       painter: FacePainter(
//                           facesList: faces, imageFile: image),
//                     ),
//                   ),
//                 ),
//               )
//               : Container(
//                   margin: const EdgeInsets.only(top: 100),
//                   child: Image.asset(
//                     "images/logo.png",
//                     width: screenWidth - 100,
//                     height: screenWidth - 100,
//                   ),
//                 ),
//
//           Container(
//             height: 50,
//           ),
//
//           //TODO section which displays buttons for choosing and capturing images
//           Container(
//             margin: const EdgeInsets.only(bottom: 50),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Card(
//                   shape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(200))),
//                   child: InkWell(
//                     onTap: () {
//                       _imgFromGallery();
//                     },
//                     child: SizedBox(
//                       width: screenWidth / 2 - 70,
//                       height: screenWidth / 2 - 70,
//                       child: Icon(Icons.image,
//                           color: Colors.blue, size: screenWidth / 7),
//                     ),
//                   ),
//                 ),
//                 Card(
//                   shape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(200))),
//                   child: InkWell(
//                     onTap: () {
//                       _imgFromCamera();
//                     },
//                     child: SizedBox(
//                       width: screenWidth / 2 - 70,
//                       height: screenWidth / 2 - 70,
//                       child: Icon(Icons.camera,
//                           color: Colors.blue, size: screenWidth / 7),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class FacePainter extends CustomPainter {
//   List<Face> facesList;
//   dynamic imageFile;
//   FacePainter({required this.facesList, @required this.imageFile});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     if (imageFile != null) {
//       canvas.drawImage(imageFile, Offset.zero, Paint());
//     }
//
//     Paint p = Paint();
//     p.color = Colors.red;
//     p.style = PaintingStyle.stroke;
//     p.strokeWidth = 3;
//
//     for (Face face in facesList) {
//       canvas.drawRect(face.boundingBox, p);
//     }
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }
// ___________________________________________________________________________________________________

import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:face_recognition_with_images/ML/Recognizer.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'dart:ui' as ui;

import 'ML/Recognition.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _HomePageState();
}

class _HomePageState extends State<RegistrationScreen> {
  //TODO declare variables
  late ImagePicker imagePicker;
  File? _image;

  //TODO declare detector
  late FaceDetector faceDetector;

  //TODO declare face recognizer

  late Recognizer recognizer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = ImagePicker();

    //TODO initialize face detector
    final options = FaceDetectorOptions(performanceMode: FaceDetectorMode.accurate);
    faceDetector = FaceDetector(options: options);

    //TODO initialize face recognizer
    recognizer = Recognizer();

  }

  //TODO capture image using camera
  _imgFromCamera() async {
    XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState((){
        _image = File(pickedFile.path);
        doFaceDetection();
      });
    }
  }

  //TODO choose image using gallery
  _imgFromGallery() async {
    XFile? pickedFile =
    await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState((){
        _image = File(pickedFile.path);
        doFaceDetection();
      });
    }
  }

  //TODO face detection code here
  List<Face> faces = [];
  doFaceDetection() async {
    //TODO remove rotation of camera images
    InputImage inputImage = InputImage.fromFile(_image!);

    // image = await _image?.readAsBytes();
    image = await decodeImageFromList(_image!.readAsBytesSync());

    //TODO passing input to face detector and getting detected faces
    faces = await faceDetector.processImage(inputImage);
    // Hàm tiền xử lý hình ảnh
    img.Image preprocessImage(img.Image original) {
      // Chuyển đổi sang ảnh xám
      img.Image grayImage = img.grayscale(original);

      // Điều chỉnh kích thước (ví dụ: 128x128)
      img.Image resizedImage = img.copyResize(grayImage, width: 128, height: 128);

      // Tăng cường độ sáng (tăng lên 30%)
      for (int y = 0; y < resizedImage.height; y++) {
        for (int x = 0; x < resizedImage.width; x++) {
          int pixel = resizedImage.getPixel(x, y);
          int r = img.getRed(pixel);
          int g = img.getGreen(pixel);
          int b = img.getBlue(pixel);

          // Tăng cường độ sáng bằng cách nhân với 1.3
          r = (r * 1.3).clamp(0, 255).toInt();
          g = (g * 1.3).clamp(0, 255).toInt();
          b = (b * 1.3).clamp(0, 255).toInt();

          // Thiết lập lại pixel với giá trị mới
          resizedImage.setPixel(x, y, img.getColor(r, g, b));
        }
      }

      return resizedImage;
    }
    for (Face face in faces) {
      final Rect boundingBox = face.boundingBox;

      final double? rotX = face.headEulerAngleX; // Head is tilted up and down rotX degrees
      final double? rotY = face.headEulerAngleY; // Head is rotated to the right rotY degrees
      final double? rotZ = face.headEulerAngleZ; // Head is tilted sideways rotZ degrees

      // If landmark detection was enabled with FaceDetectorOptions (mouth, ears,
      // eyes, cheeks, and nose available):
      // Nếu phát hiện các đặc điểm (miệng, tai, mắt, má, mũi)
      final FaceLandmark? leftEar = face.landmarks[FaceLandmarkType.leftEar];
      if (leftEar != null) {
        final Point<int> leftEarPos = leftEar.position;
        print("Vị trí tai trái: $leftEarPos");
      }

      final FaceLandmark? rightEar = face.landmarks[FaceLandmarkType.rightEar];
      if (rightEar != null) {
        final Point<int> rightEarPos = rightEar.position;
        print("Vị trí tai phải: $rightEarPos");
      }

      final FaceLandmark? leftEye = face.landmarks[FaceLandmarkType.leftEye];
      if (leftEye != null) {
        final Point<int> leftEyePos = leftEye.position;
        print("Vị trí mắt trái: $leftEyePos");
      }

      final FaceLandmark? rightEye = face.landmarks[FaceLandmarkType.rightEye];
      if (rightEye != null) {
        final Point<int> rightEyePos = rightEye.position;
        print("Vị trí mắt phải: $rightEyePos");
      }

      final FaceLandmark? nose = face.landmarks[FaceLandmarkType.noseBase];
      if (nose != null) {
        final Point<int> nosePos = nose.position;
        print("Vị trí mũi: $nosePos");
      }

      final FaceLandmark? leftCheek = face.landmarks[FaceLandmarkType.leftCheek];
      if (leftCheek != null) {
        final Point<int> leftCheekPos = leftCheek.position;
        print("Vị trí má trái: $leftCheekPos");
      }

      final FaceLandmark? rightCheek = face.landmarks[FaceLandmarkType.rightCheek];
      if (rightCheek != null) {
        final Point<int> rightCheekPos = rightCheek.position;
        print("Vị trí má phải: $rightCheekPos");
      }

      final FaceLandmark? leftmouth = face.landmarks[FaceLandmarkType.leftMouth];
      if (leftmouth != null) {
        final Point<int> mouthPos = leftmouth.position;
        print("Vị trí miệng trái: $mouthPos");
      }
      final FaceLandmark? rightmouth = face.landmarks[FaceLandmarkType.rightMouth];
      if (rightmouth != null) {
        final Point<int> mouthPos = rightmouth.position;
        print("Vị trí miệng phải: $mouthPos");
      }

      // If classification was enabled with FaceDetectorOptions:
      if (face.smilingProbability != null) {
        final double? smileProb = face.smilingProbability;
      }

      // If face tracking was enabled with FaceDetectorOptions:
      if (face.trackingId != null) {
        final int? id = face.trackingId;
      }
      print("Rect = " +boundingBox.toString());

      num left = boundingBox.left<0?0:boundingBox.left;
      num top = boundingBox.top<0?0:boundingBox.top;
      num right = boundingBox.right>image.width?image.width-1:boundingBox.right;
      num bottom = boundingBox.bottom>image.height?image.height-1:boundingBox.bottom;
      num width = right - left;
      num height = bottom - top;
      final bytes = _image!.readAsBytesSync();
      img.Image? faceImg = img.decodeImage(bytes!);
      img.Image processedFaceImg = preprocessImage(faceImg!);
      img.Image croppedFace = img.copyCrop(faceImg!, left.toInt(), top.toInt(), width.toInt(), height.toInt());
      Recognition recognition = recognizer.recognize(croppedFace, boundingBox);
      showFaceRegistrationDialogue(Uint8List.fromList(img.encodeBmp(croppedFace)), recognition);

    }
    drawRectangleAroundFaces();
    //TODO call the method to perform face recognition on detected faces

  }

  //TODO remove rotation of camera images
  removeRotation(File inputImage) async {
    final img.Image? capturedImage = img.decodeImage(await File(inputImage!.path).readAsBytes());
    final img.Image orientedImage = img.bakeOrientation(capturedImage!);
    return await File(_image!.path).writeAsBytes(img.encodeJpg(orientedImage));
  }

  //TODO perform Face Recognition

  //TODO Face Registration Dialogue
  TextEditingController textEditingController = TextEditingController();
        showFaceRegistrationDialogue(Uint8List cropedFace, Recognition recognition){
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Face Registration",textAlign: TextAlign.center),alignment: Alignment.center,
          content: SizedBox(
            height: 340,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20,),
                Image.memory(
                  cropedFace,
                  width: 200,
                  height: 200,
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                      controller: textEditingController,
                      decoration: const InputDecoration( fillColor: Colors.white, filled: true,hintText: "Enter Name")
                  ),
                ),
                const SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: () {
                      recognizer.registerFaceInDB(textEditingController.text, recognition.embeddings);
                      textEditingController.text = "";
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Face Registered"),
                      ));
                    },style: ElevatedButton.styleFrom(backgroundColor:Colors.blue,minimumSize: const Size(200,40)),
                    child: const Text("Register"))
              ],
            ),
          ),contentPadding: EdgeInsets.zero,
      ),
    );
  }
  //TODO draw rectangles
  var image;
  drawRectangleAroundFaces() async {

    print("${image.width}   ${image.height}");
    setState(() {
      image;
      faces;
    });
  }
  // ui.Image? image; // Định nghĩa kiểu dữ liệu rõ ràng
  // drawRectangleAroundFaces() async {
  //   if (_image != null) {
  //     // Đọc dữ liệu ảnh dưới dạng byte
  //     var imageBytes = await _image!.readAsBytes();
  //
  //     // Giải mã ảnh thành ui.Image
  //     image = await decodeImageFromList(imageBytes);
  //
  //     // Kiểm tra xem image có phải null không
  //     if (image != null) {
  //       print("${image!.width}   ${image!.height}");
  //
  //       // Cập nhật trạng thái khi ảnh đã được giải mã
  //       setState(() {
  //         // Cập nhật trạng thái nếu cần thiết
  //       });
  //     } else {
  //       print("Failed to decode image");
  //     }
  //   } else {
  //     print("Image is null");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          image != null
              ?
          // Container(
          //   margin: const EdgeInsets.only(top: 100),
          //   width: screenWidth - 50,
          //   height: screenWidth - 50,
          //   child: Image.file(_image!),
          // )
          Container(
            margin: const EdgeInsets.only(
                top: 100, left: 30, right: 30, bottom: 0),
            child: FittedBox(
              child: SizedBox(
                width: image?.width.toDouble(),
                height: image?.height.toDouble(),
                child: CustomPaint(
                  painter: FacePainter(
                      facesList: faces, imageFile: image),
                ),
              ),
            ),
          )
              : Container(
                margin: const EdgeInsets.only(top: 100),
                child: Image.asset(
                "images/logo.png",
                width: screenWidth - 100,
                height: screenWidth - 100,
            ),
          ),

          Container(
            height: 50,
          ),

          //TODO section which displays buttons for choosing and capturing images
          Container(
            margin: const EdgeInsets.only(bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(200))),
                  child: InkWell(
                    onTap: () {
                      _imgFromGallery();
                    },
                    child: SizedBox(
                      width: screenWidth / 2 - 70,
                      height: screenWidth / 2 - 70,
                      child: Icon(Icons.image,
                          color: Colors.blue, size: screenWidth / 7),
                    ),
                  ),
                ),
                Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(200))),
                  child: InkWell(
                    onTap: () {
                      _imgFromCamera();
                    },
                    child: SizedBox(
                      width: screenWidth / 2 - 70,
                      height: screenWidth / 2 - 70,
                      child: Icon(Icons.camera,
                          color: Colors.blue, size: screenWidth / 7),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FacePainter extends CustomPainter {
  List<Face> facesList;
  dynamic imageFile;
  FacePainter({required this.facesList, @required this.imageFile});

  @override
  void paint(Canvas canvas, Size size) {
    if (imageFile != null) {
      canvas.drawImage(imageFile, Offset.zero, Paint());
    }

    Paint p = Paint();
    p.color = Colors.red;
    p.style = PaintingStyle.stroke;
    p.strokeWidth = 4;

    for (Face face in facesList) {
      canvas.drawRect(face.boundingBox, p);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
