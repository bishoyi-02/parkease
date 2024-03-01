import 'package:flutter/material.dart';
import 'package:park_app/screens/payment_page.dart';

class ModalDesign extends StatelessWidget {
  const ModalDesign(this.title, this.availability, this.address,
      this.contactNumber, this.price, this.email, this.changeScreen,
      {super.key});
  final String title;
  final String availability;
  final String address;
  final String contactNumber;
  final String price;
  final String email;
  final changeScreen;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        height: MediaQuery.of(context).size.height * 0.65,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: Container(
                  width: 44,
                  height: 4,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.local_parking,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            color: Colors.grey[900],
                            elevation: 4,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            availability,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                          Text(
                            '  Slots available',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                                fontSize: 12),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Card(
                            color: Colors.grey[900],
                            elevation: 4,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0, top: 8),
                  child: ClipRRect(
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqBJ5bNmCyFu-WIShaA5lwOHXXzHurEgGH2w&usqp=CAU',
                      fit: BoxFit.cover,
                      width: 120,
                      height: 110,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PaymentPage(address, title, changeScreen),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text(
                    'BOOK SPOT',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        wordSpacing: 4,
                        letterSpacing: 0.3),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                'Contacts',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.grey,
                    ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.call,
                    size: 16,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    contactNumber,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[900],
                        fontSize: 18,
                        letterSpacing: 0.2),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.web_asset,
                    size: 18,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    email,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[900],
                        fontSize: 18,
                        letterSpacing: 0.2),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 34,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Text(
                  'Full Address',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.grey,
                      ),
                )),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.local_parking,
                    size: 18,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 14.0),
                      child: Text(
                        address,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[900],
                          fontSize: 16.5,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
