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
              itemBuilder: (BuildContext context, int index) => Task(
                  content: snapshot.data.documents[index]['content'],
                  id: snapshot.data.documents[index].documentID,
                  update: _updateTask,
                  delete: _deleteTask),
              itemCount: snapshot.data.documents.length,
            );
          } else {
            return Container();
          }
        });
  }void _updateTask(String updatedValue, String id) {
    var task = <String, dynamic>{
      'content': updatedValue,
      'timestamp': DateTime.now().millisecondsSinceEpoch
    };
    Database.updateTask(id, task);
  }

  void _deleteTask(String id) {
    Database.deleteTask(id);
  }