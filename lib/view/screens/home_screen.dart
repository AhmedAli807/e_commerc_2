import 'package:e_commerc_2/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController hController = HomeController();

  @override
  void initState() {
    super.initState();
    hController.getProduct();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recommended',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  Text('View All',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ],
              ),
            ),
            FutureBuilder<List<ProductModel>>(
              future: hController.getProduct(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? productsList()
                    : snapshot.hasError
                    ? errorWidget()
                    : loadingWidget();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget productsList() => Expanded(
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
      ),
      itemCount: hController.productList.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
        ),
        child: InkWell(
          onTap: (){
            showDialog(context: context, builder: (_)=>AlertDialog(
              title: Text('details'),
              content: Text(hController.productList[index].description??''),
              actions: [
                TextButton(onPressed: (){
                  Navigator.of(_).pop();
                },
                    child: Container(
                      color: Colors.green,
                      padding: EdgeInsets.all(14),
                      child:Text('okay',
                      style: TextStyle(color: Colors.white),) ,
                    )),

              ],
            ));
          },
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    hController.productList[index].image ?? '',
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      // color: Colors.black.withOpacity(0.4),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.1),
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(0.9),
                        ],
                        end: Alignment.bottomCenter,
                        begin: Alignment.topCenter,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 200,
                        child: Text(
                          hController.productList[index].title ?? '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBC02D).withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      hController.productList[index].price.toString(),
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    ),
  );

  Widget errorWidget() => const Text(
    'Sorry, Something went wrong',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.red,
      fontSize: 16,
    ),
  );

  Widget loadingWidget() => const CupertinoActivityIndicator();
}