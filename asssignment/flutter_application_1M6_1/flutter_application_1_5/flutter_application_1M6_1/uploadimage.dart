Future uploadImage () async {


    FirebaseStorage storage = FirebaseStorage.instance;

    Reference ref = storage.ref().child(userID.toString());
    UploadTask uploadTask = ref.putFile(image!);
    uploadTask.whenComplete(() async {
      url = await ref.getDownloadURL(); }
    ).catchError((onError){
      print(onError);
    });
    return url;
  }