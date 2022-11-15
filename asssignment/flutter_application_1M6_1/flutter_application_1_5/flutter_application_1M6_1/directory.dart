Future<String> getStorageDirectory() async {

     if (Platform.isAndroid) {

       return (await getExternalStorageDirectory()).path;  
         } else {

           return (await getApplicationDocumentsDirectory()).path;
         }
       }