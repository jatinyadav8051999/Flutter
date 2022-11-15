import 'package:flutter/material.dart';
import 'package:productapp/core/models/productModel.dart';
import 'package:productapp/ui/views/productDetails.dart';


class ProductCard extends StatelessWidget {
  final Product productDetails;

  ProductCard({@required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetails(product: productDetails)));
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Card(
          elevation: 5,
          child: Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.45,
            width: MediaQuery
                .of(context)
                .size
                .width * 0.9,
            child: Column(
              children: <Widget>[
                Hero(
                  tag: productDetails.id,
                  child: Image.asset(
                    'assets/${productDetails.img}.jpg',
                    height: MediaQuery
                        .of(context)
                        .size
                        .height *
                        0.35,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        productDetails.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        '${productDetails.price} \$',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            fontStyle: FontStyle.italic,
                            color: Colors.orangeAccent),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
👉Step 5: Creating Product details and add product Screens
to create a new Product item, we will take the name input and price by the user . We instantiate a new Product object using our Finally we upload to Firebase using our addProduct() function called using the CRUD provider

Scaffold(
  appBar: AppBar(),
  body: Padding(
    padding: EdgeInsets.all(12),
    child: Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Product Title',
              fillColor: Colors.grey[300],
              filled: true,
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter Product Title';
              }
            },
              onSaved: (value) => title = value
          ),
          SizedBox(height: 16,),
          TextFormField(
            keyboardType: TextInputType.numberWithOptions(),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Price',
              fillColor: Colors.grey[300],
              filled: true,
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter The price';
              }
            },
              onSaved: (value) => price = value
          ),
          DropdownButton<String>(
            value: productType,
            onChanged: (String newValue) {
              setState(() {
                productType = newValue;
              });
            },
            items: <String>['Bag', 'Computer', 'Dress', 'Phone','Shoes']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          RaisedButton(
            splashColor: Colors.red,
            onPressed: () async{
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                await productProvider.addProduct(Product(name: title,price: price,img: productType.toLowerCase()));
                Navigator.pop(context) ;
              }
            },
            child: Text('add Product', style: TextStyle(color: Colors.white)),
            color: Colors.blue,
          )

        ],
      ),
    ),
  ),
);
Now to delete or update a product we will add another screen to check for the product details and from there we can either delete it or change it

class ProductDetails extends StatelessWidget {
  final Product product;

  ProductDetails({@required this.product});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        actions: <Widget>[
          
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.delete_forever),
            onPressed: ()async {
              await productProvider.removeProduct(product.id);
              Navigator.pop(context) ;
            },
          ),
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.edit),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> ModifyProduct(product: product,)));
            },
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: product.id,
            child: Image.asset(
              'assets/${product.img}.jpg',
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            product.name,
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 22,
                fontStyle: FontStyle.italic),
          ),
          Text(
            '${product.price} \$',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 22,
                fontStyle: FontStyle.italic,
                color: Colors.orangeAccent),
          )
        ],
      ),
    );
  }
}
  

  
