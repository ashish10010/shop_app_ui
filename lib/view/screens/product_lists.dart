import 'package:flutter/material.dart';
import 'package:shop_app/view/screens/global_variables.dart';
import 'package:shop_app/view/screens/product_details_page.dart';
import 'package:shop_app/view/screens/products_card.dart';
class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

   final List<String> filters = ['All',
          "Addidas",
          "Nike",
          "Bata",
      ];
 late String selectedFilter;
       @override
  void initState() {
    super.initState();
     selectedFilter = filters[0];
  }
  @override
  Widget build(BuildContext context) {
      final borderDec =  OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(225, 225, 225, 1),
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(50),
                        ),
                    );
    return SafeArea(

        child: Column(
          children: [
            Row(
              children: [
                 Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: Text(
                    "Shoes\nCollection",
                    style: Theme.of(context).textTheme.titleLarge,
                   ),
                 ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search,color: Color.fromRGBO(119, 119, 119, 1),
                    ),
                    border: borderDec,
                    enabledBorder: borderDec,
                    focusedBorder: borderDec,
                  ),
                )
                ),
              ],
            ),
             SizedBox(
              height: 120,
               child: ListView.builder(
                scrollDirection: Axis.horizontal,
                    itemCount: filters.length,
                    itemBuilder: (context,index){
                      final filter = filters[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8),
                        child: GestureDetector(
                          onTap: () {
                              setState(() {
                                 selectedFilter = filter;
                              });
                          },
                          child: Chip(
                            backgroundColor:selectedFilter == filter
                            ? Theme.of(context).colorScheme.primary
                            : Color.fromRGBO(245, 247, 249, 1),
                            side: BorderSide(
                              color: Color.fromRGBO(245, 247, 249, 1),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            label: Text(filter),
                            labelStyle: TextStyle(
                              fontSize: 16,
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                           ),
                      ),
                  );
                },
             ),
           ),
          
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context,index) {
                final product = products[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return ProductDetailPage(product: product);
                        },
                      ),
                    );
                  },
                  child: ProductCard(
                    title: product['title'] as String,
                    price: product['price'] as double,
                    image: product['imageUrl'] as String,
                    backgroundColor: index.isEven 
                    ?  Color.fromRGBO(216, 240, 253, 1)
                    : Color.fromRGBO(245, 247, 249, 1),
                    ),
                );
                },
            ),
          ),   
         ],
        ),
      );
  }
}