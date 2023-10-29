import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:pbs_admin/controller/sidebar_controller.dart';


class SideBar extends StatefulWidget {
    const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final SideBarCotroller sideBarCotroller = Get.put(SideBarCotroller());

  @override
  void initState() {
    setState(() {
      sideBarCotroller.index.value = 0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          SidebarX(
            controller: SidebarXController(selectedIndex: 0),
            animationDuration: const Duration(milliseconds: 500), //sidebar expand duration
            theme: SidebarXTheme(
              margin: const EdgeInsets.all(20), //sidebar margin
              decoration: BoxDecoration(
                color: Colors.black54, //sidebar color
                borderRadius: BorderRadius.circular(16), //sidebar style
              ),
              textStyle: const TextStyle(color: Colors.white70),
              selectedTextStyle: const TextStyle(color: Colors.white70),
              itemTextPadding: const EdgeInsets.only(left: 20),
              selectedItemTextPadding: const EdgeInsets.only(left: 20),
              itemDecoration: BoxDecoration(
                border: Border.all(color: Colors.white38),
              ),
              selectedItemDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),//selected item style
                border: Border.all(
                  color: Colors.redAccent.withOpacity(0.37), //selected item border color
                ),
                gradient: const LinearGradient(
                  colors: [Colors.redAccent,Colors.pink], //selected item background color
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.30),//selected item border shadow
                    blurRadius: 30,//selected item border shadow blur
                  )
                ],
              ),
              iconTheme: const IconThemeData(
                color: Colors.white, //Icons Color
                size: 20, //Icons size
              ),
            ),
            extendedTheme: const SidebarXTheme(
              width: 190, //sidebar extend size
              decoration: BoxDecoration(
                color: Colors.blueGrey, //sidebar extend color
              ),
              margin: EdgeInsets.only(right: 10), //sidebar margin set for right
            ),
            footerDivider: Divider(color: Colors.black.withOpacity(1.0), height: 0.5), //footer line
            headerBuilder: (context, extended){
              return SizedBox(
                height: 180,
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Image.asset('images/logo.png', color: Colors.white,),
                ),
              );
            },
            items: [
              SidebarXItem(
                icon: Icons.home,
                label: 'Home',
                onTap: () => sideBarCotroller.index.value =0,
              ),
              SidebarXItem(
                icon: Icons.pedal_bike_outlined,
                label: 'Bicycle Details',
                onTap: () => sideBarCotroller.index.value =1,
              ),
              SidebarXItem(
                icon: Icons.supervised_user_circle_rounded,
                label: 'User Details',
                onTap: () => sideBarCotroller.index.value =2,
              ),SidebarXItem(
                icon: Icons.history,
                label: 'History',
                onTap: () => sideBarCotroller.index.value =3,
              ),SidebarXItem(
                icon: Icons.paid_outlined,
                label: 'Subscriptions',
                onTap: () => sideBarCotroller.index.value =4,
              ),SidebarXItem(
                icon: Icons.feedback,
                label: 'FeedBack',
                onTap: () => sideBarCotroller.index.value =5,
              ),SidebarXItem(
                icon: Icons.logout,
                label: 'Logout',
                onTap: () => sideBarCotroller.index.value =6,
              ),
            ],
          ),
          Expanded(
              child: Center(
                child: Obx(() => sideBarCotroller.pages[sideBarCotroller.index.value]),
    ),
          ),
        ],
      ),

    );
  }
}
