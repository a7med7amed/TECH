import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tech/constants.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key, required this.xOnPressed});
  final void Function()? xOnPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: 288,
        color: sideBarColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage("assets/me.jpg"),
                        backgroundColor: Colors.red,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Ahmed Hamed",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                          Text(
                            "Customer",
                            style: TextStyle(
                                color: Color.fromARGB(255, 196, 196, 196),
                                fontSize: 14),
                          ),
                        ],
                      )
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: xOnPressed,
                          icon: const Icon(
                            FontAwesomeIcons.x,
                            color: Colors.white,
                            size: 22,
                          ),
                          constraints: const BoxConstraints(),
                          padding: EdgeInsets.zero,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              const Text(
                "BROWSE",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              const SideBarItem(
                title: "Home",
                icon: FontAwesomeIcons.house,
              ),
              const SideBarItem(
                title: "Cart",
                icon: FontAwesomeIcons.cartShopping,
              ),
              const SideBarItem(
                title: "Wishlist",
                icon: FontAwesomeIcons.heart,
              ),
              const SideBarItem(
                title: "Help",
                icon: FontAwesomeIcons.circleInfo,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "ORDERS",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              const SideBarItem(
                title: "Current Orders",
                icon: FontAwesomeIcons.receipt,
              ),
              const SideBarItem(
                title: "History",
                icon: FontAwesomeIcons.clock,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SideBarItem extends StatelessWidget {
  const SideBarItem({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 0.7,
          width: double.infinity,
          color: Colors.grey,
        ),
        InkWell(
          onTap: () {},
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            minLeadingWidth: 25,
            leading: Icon(
              icon,
              color: Colors.white,
              size: 22,
            ),
            title: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}
