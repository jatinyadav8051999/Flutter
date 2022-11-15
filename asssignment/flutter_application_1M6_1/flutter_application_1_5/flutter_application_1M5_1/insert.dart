Future<int> addItem(MemoModel item) async{ //returns number of items inserted as an integer
    
    final db = await init(); //open database
    
    return db.insert("Memos", item.toMap(), //toMap() function from MemoModel
    conflictAlgorithm: ConflictAlgorithm.ignore, //ignores conflicts due to duplicate entries
    );
 }