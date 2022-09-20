import 'package:flutter/material.dart';

class FindDonorScreen extends StatelessWidget {
  const FindDonorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 5,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(30)),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Find Donor",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            alignment: Alignment.center,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[200]),
            child: const TextField(
              decoration: InputDecoration.collapsed(
                  hintText: 'Search for names, places...'),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        //  print(index);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        height: 70,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text(
                                    'Mohamed Nishad',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Mankada,Kozhikkottuparamba",
                                    style: TextStyle(fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.water_drop,
                                  size: 30,
                                  color: Colors.red,
                                ),
                                Text(
                                  "AB+",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: 10,
            ),
          )
        ],
      ),
    );
  }
}
