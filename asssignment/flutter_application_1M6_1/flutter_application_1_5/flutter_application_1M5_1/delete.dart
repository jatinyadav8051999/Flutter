Future<int> deleteMemo(int id) async{ //returns number of items deleted
    final db = await init();
  
    int result = await db.delete(
      "Memos", //table name
      where: "id = ?",
      whereArgs: [id] // use whereArgs to avoid SQL injection
    );

    return result;
  }