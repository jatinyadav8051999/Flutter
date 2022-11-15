Future<List<MemoModel>> fetchMemos() async{ //returns the memos as a list (array)
    
    final db = await init();
    final maps = await db.query("Memos"); //query all the rows in a table as an array of maps

    return List.generate(maps.length, (i) { //create a list of memos
      return MemoModel(              
        id: maps[i]['id'],
        title: maps[i]['title'],
        content: maps[i]['content'],
      );
  });
  }