import 'package:flutter/material.dart';
import 'package:park_app/widgets/profile_card_widget.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:park_app/widgets/profile_image_widget.dart';
import 'package:park_app/data_models/profile_details.dart';
//import 'package:park_app/bottom_nagivation_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage(this.emailId, {super.key});

  final String emailId;

  @override
  Widget build(BuildContext context) {
    List<Profile> profiles = [
      Profile(
          name: 'Raghav',
          contactNumber: '9191919191',
          emailID: 'raghav@example.com',
          carPlate: 'ABCD-1234',
          currentBalance: '1000',
          dob: 'January 1, 2002'),
      Profile(
          name: 'Jasneet',
          contactNumber: '8787878787',
          emailID: 'jasneet@sample.com',
          carPlate: 'GOAT-7117',
          currentBalance: '1000000',
          dob: 'April 23, 2002'),
      Profile(
          name: 'Aum',
          contactNumber: '9090909090',
          emailID: 'aum@sample.com',
          carPlate: 'WXYZ-7117',
          currentBalance: '80000',
          dob: 'August 3, 2002')
    ];

    String name = "";
    String contactNumber = "";
    String carPlate = "";
    String currentBalance = "";
    String dob = "";

    for (var i in profiles) {
      if (i.emailID == emailId) {
        name = i.name;
        contactNumber = i.contactNumber;
        carPlate = i.carPlate;
        currentBalance = i.currentBalance;
        dob = i.dob;
      }
    }

    return SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              CircleAvatar(
                radius: 85,
                backgroundColor: Colors.amber,
                child: const CircleAvatar(
                  radius: 80.0,
                  foregroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRT23NlA9taxcUhdcm3JbbPqRoNfn5m9gxVjQ&usqp=CAU'),
                  //backgroundColor: Colors.grey, // Placeholder background color
                ),
              ),
              // ProfileImageWithUpload(
              //   imageUrl:
              //       'https://png.pngtree.com/png-vector/20191101/ourmid/pngtree-cartoon-color-simple-male-avatar-png-image_1934459.jpg',
              //   onUploadPressed: () {},
              // ),
              const SizedBox(
                height: 20,
              ),
              ProfileInfoCard(label: 'Name', value: name),
              const SizedBox(
                height: 4,
              ),
              ProfileInfoCard(label: 'Mobile Number', value: contactNumber),
              const SizedBox(
                height: 4,
              ),
              ProfileInfoCard(label: 'Email ID', value: emailId),
              const SizedBox(
                height: 4,
              ),
              ProfileInfoCard(label: 'Car Number Plate', value: carPlate),
              const SizedBox(
                height: 4,
              ),
              ProfileInfoCard(
                  label: 'Current Balance', value: '\$$currentBalance'),
              const SizedBox(
                height: 4,
              ),
              ProfileInfoCard(label: 'DOB', value: dob),
              const SizedBox(
                height: 4,
              ),
            ],
          ),
        ));
  }
}
