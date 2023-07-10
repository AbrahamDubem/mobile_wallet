import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitted10/utils/my_button.dart';
import 'package:untitted10/utils/my_list_tile.dart';
import '../utils/my_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//page controller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: Icon(Icons.credit_card),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.home, size: 20,)),
              IconButton(onPressed: () {}, icon: Icon(Icons.settings,size: 20,)),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            //app bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Text(
                            'My',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'cards',
                            style: TextStyle(fontSize: 28),
                          ),
                        ],
                      ),
                      //plus button
                      Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.add)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //cards
            Container(
              height: 200,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                children: const [
                  MyCard(
                    balance: 10000,
                    cardNumber: 8924383434,
                    expiryMonth: 22,
                    expiryYear: 23,
                    color: Colors.purple,
                  ),
                  MyCard(
                    balance: 13345,
                    cardNumber: 098487654,
                    expiryMonth: 10,
                    expiryYear: 25,
                    color: Colors.blue,
                  ),
                  MyCard(
                    balance: 250987,
                    cardNumber: 12345678,
                    expiryMonth: 15,
                    expiryYear: 26,
                    color: Colors.orange,
                  ),
                  MyCard(
                    balance: 90746,
                    cardNumber: 345373663,
                    expiryMonth: 17,
                    expiryYear: 28,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 4,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.grey.shade600,
                dotHeight: 14,
                dotWidth: 13,
                dotColor: Colors.green
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            //3 buttons: send, pay, bills
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // send button
                  MyButton(
                      iconImagePath: 'assets/images/sendmoney.jpg',
                      buttonText: 'Send'),

                  //pay button
                  MyButton(
                      iconImagePath: 'assets/images/credit-card.png',
                      buttonText: 'Pay'),

                  //bills button
                  MyButton(
                      iconImagePath: 'assets/images/bill.png',
                      buttonText: 'Bills')
                ],
              ),
            ),

           SizedBox(height: 30,),
           const Column(
             children: [
               MyListTile(
                 //Statistics
                   iconImagePath: 'assets/images/analytics.png',
                   tileTitle: 'Statistics',
                   tileSubTitle: 'Payments and Income'),

               //column: stats, transactions
               MyListTile(
                   iconImagePath: 'assets/images/card 22.jpg',
                   tileTitle: 'Transactions',
                   tileSubTitle: 'transaction history'),
             ],
           )
          ],
        ),
      ),
    );
  }
}
