child: FutureBuilder(
            future: _thisMenu(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                // load the data here to display it in the list view
                print("Data is here");
                return ListView.builder(
                  padding: const EdgeInsets.only(bottom: 50),
                  itemCount: snapshot.data.menus.length,
                  itemBuilder: (context, index) {
                    Menu menuu = snapshot.data;
                    MenuElement menuItem = menuu.menus[index];
                    return menuLoadedList(menuItem, index);
                  },
                );
              }

              ///when the API cannot fetch the data properly
              /// should design some error handling mechanism, custom widget to displau "Oops! Something went wrong" with a image
              else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              /// when the data is still loading, for loading screen
              else {
                print("we are still loading");
                return ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return menuListShimmer();
                  },
                );
              }
            },
          ),Widget menuLoadedList(MenuElement menuItem, int index) {
return DefaultTextStyle(
  style: const TextStyle(color: Colors.white, fontSize: 16.0),
  child: Column(
    children: <Widget>[
      Container(
        padding: const EdgeInsets.all(4.0),
        //column for the list view to display menu name, price and displying button to add, remove and show the quantity of the order
        child: Column(
          children: <Widget>[
            //first row shows the menu name and price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // shows the menu name
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(menuItem.name),
                  ),
                ),
                //show the menu price
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Rs. " + menuItem.price.toString()),
                ),
              ],
            ),
            //second row shows the add, remove and show the quantity of the order
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //first button shows the add button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    // when the users taps the minus button
                    onTap: () {
                      print(index);
                      _addItemToOder(false, index, "Spicy", 5);
                    },
                    child: const Icon(
                      Icons.remove_circle,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text("$counter"), // this needs to be updated
                Padding(
                  padding: const EdgeInsets.all(8.0),child: GestureDetector(
                    onTap: () {
                      print(index);
                      _addItemToOder(true, index, "Spicy", 5);
                      setState(() {
                        
                      });
                    },
                    child: const Icon(
                      Icons.add_circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              child: Container(
                // height: 30,
                margin: const EdgeInsets.all(2.0),
                child: const TextField(
                  autofocus: false,
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                  //defines the charcter of test field for the remarks textfield
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.green, width: 2.0),
                    ),
                    hintText: "Add your remarks",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              visible: showRemarksField,
            ),
          ],
        ),
      ),
    ],
  ),
);
          }
          Menu menuu = snapshot.data;
    MenuElement menuItem = menuu.menus[index];
    priceChange = List.generate(snapshot.data.menus.length, (index){
      return 0.0; // or snaphot.data.menu. --> where u put price data
    });
// on widget maybe you can pass bool to manipulate rendered ui :

return menuLoadedList(menuItem, index, List<double> priceChange, bool userTap){
      // in child ----->
      child: Text("Rs. " + userTap[index]? priceChange[index]: menuItem.price.toString());
    };setState(() {
    //remove old data
    priceChange.removeAt(index);
    //inset new
    priceChange.insert(index, 100);
  });