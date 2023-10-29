import 'package:get/get.dart';
import 'package:pbs_admin/pages/bicycle_details.dart';
import 'package:pbs_admin/pages/feedback.dart';
import 'package:pbs_admin/pages/history.dart';
import 'package:pbs_admin/pages/home.dart';
import 'package:pbs_admin/pages/logout.dart';
import 'package:pbs_admin/pages/subscription_details.dart';
import 'package:pbs_admin/pages/user_details.dart';

class SideBarCotroller extends GetxController{

  RxInt index = 0.obs;

  var pages = [
    Home(),
    BicycleDetails(),
    UserDetails(),
    History(),
    SubscriptionDetails(),
    FeedBack(),
    Logout(),
  ];
}