Widget _getTasks() {
    return StreamBuilder(
        stream: Firestore.instance
            .collection('tasks')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemBuilder: (BuildContext context, int index) =>
                Text(snapshot.data.documents[index]['content']),
              itemCount: snapshot.data.documents.length,
            );
          } else {
            return Container();
          }
        });
  }