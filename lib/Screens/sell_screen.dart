import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kshri2/providers/user_details_provider.dart';
import 'package:kshri2/resources/cloudfirestore_methods.dart';
import 'package:kshri2/utils/color_themes.dart';
import 'package:kshri2/utils/utils.dart';
import 'package:kshri2/widgets/custom_main_button.dart';
import 'package:kshri2/widgets/loading_widget.dart';
import 'package:kshri2/widgets/text_field_widget.dart';
import 'package:provider/provider.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({super.key});

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  bool isLoading = false;
  int selected = 1;
  Uint8List? image;
  TextEditingController nameController = TextEditingController();
  TextEditingController costController = TextEditingController();
  List<int> keysForDiscount = [0, 70, 60, 50];

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    costController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: !isLoading
          ? SingleChildScrollView(
              child: SizedBox(
                height: screenSize.height,
                width: screenSize.width,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            image == null
                                ? Image.network(
                                    "https://th.bing.com/th/id/R.29e298d98dd1d0744190f12619653717?rik=Pj%2bfpUeUsSLcGg&riu=http%3a%2f%2fwww.chanchao.com.tw%2fDTG%2fimages%2fdefault.jpg&ehk=4VyszEBE7gcMqvDlCGxmET4he6UIqe%2b7pyqddzrnFU4%3d&risl=&pid=ImgRaw&r=0",
                                    height: screenSize.height / 10,
                                  )
                                : Image.memory(
                                    image!,
                                    height: screenSize.height / 10,
                                  ),
                            IconButton(
                                onPressed: () async {
                                  Uint8List? temp = await Utils().pickImage();
                                  if (temp != null) {
                                    setState(() {
                                      image = temp;
                                    });
                                  }
                                },
                                icon: Icon(Icons.file_upload))
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 35, vertical: 10),
                          height: screenSize.height * 0.7,
                          width: screenSize.width * 0.7,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFieldWidget(
                                  title: "Name",
                                  controller: nameController,
                                  obscureText: false,
                                  hintText: "Enter the name of the product"),
                              TextFieldWidget(
                                  title: "Cost",
                                  controller: costController,
                                  obscureText: false,
                                  hintText: "Enter the cost of the product"),
                              const Text(
                                "Discount",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              ListTile(
                                title: Text("None"),
                                leading: Radio(
                                    value: 1,
                                    groupValue: selected,
                                    onChanged: (int? i) {
                                      setState(
                                        () {
                                          selected = i!;
                                        },
                                      );
                                    }),
                              ),
                              ListTile(
                                title: Text("70%"),
                                leading: Radio(
                                    value: 2,
                                    groupValue: selected,
                                    onChanged: (int? i) {
                                      setState(
                                        () {
                                          selected = i!;
                                        },
                                      );
                                    }),
                              ),
                              ListTile(
                                title: Text("60%"),
                                leading: Radio(
                                    value: 3,
                                    groupValue: selected,
                                    onChanged: (int? i) {
                                      setState(
                                        () {
                                          selected = i!;
                                        },
                                      );
                                    }),
                              ),
                              ListTile(
                                title: Text("50%"),
                                leading: Radio(
                                    value: 4,
                                    groupValue: selected,
                                    onChanged: (int? i) {
                                      setState(
                                        () {
                                          selected = i!;
                                        },
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),
                        CustomMainButton(
                            child: const Text(
                              "Sell",
                              style: TextStyle(color: Colors.black),
                            ),
                            color: yellowColor,
                            isLoading: isLoading,
                            onPressed: () async {
                              String output = await CloudFirestoreClass()
                                  .uploadProductToDatabase(
                                image: image,
                                productName: nameController.text,
                                rawCost: costController.text,
                                discount: keysForDiscount[selected - 1],
                                sellerName: Provider.of<UserDetailsProvider>(
                                  context,
                                  listen: false,
                                ).userDetails.name,
                                sellerUid:
                                    FirebaseAuth.instance.currentUser!.uid,
                              );
                              if (output == "success") {
                                Utils().showSnackBar(
                                    context: context,
                                    content: "Uploaded Successfully");
                              } else {
                                Utils().showSnackBar(
                                    context: context, content: output);
                              }
                            }),
                        CustomMainButton(
                            child: const Text(
                              "Back",
                              style: TextStyle(color: Colors.black),
                            ),
                            color: Colors.grey[300]!,
                            isLoading: isLoading,
                            onPressed: () {
                              Navigator.pop(context);
                            })
                      ],
                    ),
                  ),
                ),
              ),
            )
          : const LoadingWidget(),
    ));
  }
}
