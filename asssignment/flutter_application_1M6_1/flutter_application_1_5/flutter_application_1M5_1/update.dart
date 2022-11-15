Future<int> updateMemo(int id, MemoModel item) async{ // returns the number of rows updated
  
    final db = await init();
  
    int result = await db.update(
      "Memos", 
      item.toMap(),
      where: "id = ?",
      whereArgs: [id]
      );
      return result;
 }