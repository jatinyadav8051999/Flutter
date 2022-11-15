Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(
          source: source);
      if (image == null) return;

      final UserImage = File(image.path);
      setState(() => this.image = UserImage );
    }on PlatformException catch (e){
      Utils.showSnackBar(e.message);
    }

  }