// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:livreur_app/presentation/constants/colors.dart';
import 'package:livreur_app/presentation/constants/enums.dart';
import 'package:livreur_app/presentation/core/custom_icon_button.dart';
import 'package:livreur_app/presentation/core/custom_text_field.dart';
import 'package:livreur_app/presentation/core/primary_widgets.dart';
import 'package:livreur_app/presentation/ordres/order_preview.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SwiftColors.backGrey,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                  Expanded(child: Image.asset('assets/images/logo_small.png')),
                  CustomIconButton(
                    icon: SvgPicture.asset('assets/icons/notification.svg'),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 60.h),
              Text(
                'List des\nCommandes',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontFamily: 'montserrat-bold',
                ),
              ),
              SizedBox(height: 25.h),
              SizedBox(height: 20.h),
              SizedBox(height: 20.h),
              OrdersScreenMenuItem(
                orderStatus: OrderStatus.COMPLETED,
              ),
              OrdersScreenMenuItem(
                orderStatus: OrderStatus.LIV_PENDING,
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class OrdersScreenMenuItem extends StatelessWidget {
  const OrdersScreenMenuItem({
    Key? key,
    required this.orderStatus,
  }) : super(key: key);

  final OrderStatus orderStatus;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 17.h),
        child: Column(
          children: [
            Text(
              orderStatus == OrderStatus.COMPLETED
                  ? '*Commande Complété*'
                  : orderStatus == OrderStatus.RES_PENDING
                      ? '*En attente de Livraison*'
                      : '*En attente de Livraison*',
              style: TextStyle(
                fontSize: 16.sp,
                color: orderStatus == OrderStatus.COMPLETED
                    ? SwiftColors.green
                    : orderStatus == OrderStatus.RES_PENDING
                        ? SwiftColors.purple
                        : SwiftColors.purple,
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 41.w,
                  width: 41.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/denys.png'),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hamza',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    Text(
                      'Bendahmane',
                      style: TextStyle(fontSize: 16.sp),
                    )
                  ],
                ),
                Spacer(),
                Container(
                  height: 41.w,
                  width: 41.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/denys.png'),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  'Denny\'s ',
                  style: TextStyle(fontSize: 16.sp),
                ),
              ],
            ),
            Divider(),
            SizedBox(
              height: 140,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return FoodOrderMenuitem();
                }),
                separatorBuilder: ((context, index) {
                  return SizedBox(width: 20.w);
                }),
                itemCount: 3,
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 20.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                        color: SwiftColors.hintGreyColor,
                      ),
                    ),
                    Text(
                      '1400 DA',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21.sp,
                        color: SwiftColors.orange,
                      ),
                    ),
                  ],
                ),
                Spacer(flex: 1),
                Expanded(
                  flex: 2,
                  child: PrimaryButton(
                    backColor: SwiftColors.purple,
                    frontColor: Colors.white,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: ((context) {
                        return OrderPreviewPage();
                      })));
                    },
                    text: 'Voir',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FoodOrderMenuitem extends StatelessWidget {
  const FoodOrderMenuitem({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 88.w,
      child: Column(
        children: [
          Container(
            height: 80.w,
            width: 88.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.w),
                image: DecorationImage(image: AssetImage('assets/images/burger.png'))),
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  'Pizza Poolet',
                  maxLines: 3,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
              CircleAvatar(
                backgroundColor: SwiftColors.orange,
                foregroundColor: Colors.white,
                radius: 15,
                child: Text(
                  '1',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
