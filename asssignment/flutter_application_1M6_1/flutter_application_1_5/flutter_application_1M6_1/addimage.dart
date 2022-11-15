 uploadImage() async{
  String dir= getStorageDirectory();
  File directory = new File("$dir");
  if (directory.exists() != true) {
     directory.create();
  }
  final image = await ImagePicker().pickImage(
   source: source);
  if (image == null) return;

 final userImage = File(image.path);
 var newFile = await userImage.writeAsBytes(/* image bytes*/);
 await newFile.create();
 }