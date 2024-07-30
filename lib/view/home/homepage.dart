
import 'package:demogetapi/controller/cartcontroller.dart';
import 'package:demogetapi/model/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    final Cartcontroller cartController = Get.put(Cartcontroller());

    
    cartController.fetchdata();

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.blueAccent,actions: [
          IconButton(onPressed: () {
            
            
          }, icon: Icon(Icons.arrow_forward_ios))
        ],
      ),
      body: Obx(() {
        if (cartController.Clist.isEmpty) {
          return Center(
            child: Text('No items in the cart', style: TextStyle(fontSize: 18, color: Colors.grey[600])),
          );
        }

        return ListView.separated(
          itemCount: cartController.Clist.length,
          itemBuilder: (BuildContext context, int index) {
            Carts c = cartController.Clist[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Cart ID: ${c.id}", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("User ID: ${c.userId}"),
                    Text("Total Quantity: ${c.totalQuantity}"),
                    Text("Total Products: ${c.totalProducts}"),
                    Text("Discounted Total: \$${c.discountedTotal}"),
                    SizedBox(height: 12),
                    if (c.products != null && c.products!.isNotEmpty)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: c.products!.map((product) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.grey[300]!),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                                        image: DecorationImage(
                                          image: NetworkImage("${product.thumbnail}"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Product ID: ${product.id}", style: TextStyle(fontWeight: FontWeight.bold)),
                                          Text("Product Name: ${product.title}"),
                                          Text("Quantity: ${product.quantity}"),
                                          Text("Price: \$${product.price}"),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    if (c.products == null || c.products!.isEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text('No products in this cart', style: TextStyle(color: Colors.grey[600])),
                      ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 10),
        );
      }),
    );
  }
}
