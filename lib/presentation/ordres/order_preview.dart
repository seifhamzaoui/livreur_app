// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:livreur_app/presentation/constants/colors.dart';
import 'package:livreur_app/presentation/constants/enums.dart';
import 'package:livreur_app/presentation/core/custom_icon_button.dart';
import 'package:livreur_app/presentation/core/primary_widgets.dart';
import 'package:livreur_app/presentation/ordres/order_map_way.dart';
import 'package:livreur_app/presentation/ordres/orders_page.dart';

class OrderPreviewPage extends StatefulWidget {
  const OrderPreviewPage({Key? key}) : super(key: key);

  @override
  State<OrderPreviewPage> createState() => _OrderPreviewPageState();
}

class _OrderPreviewPageState extends State<OrderPreviewPage> {
  OrderStatus orderStatus = OrderStatus.LIV_PENDING;
  bool showDialog = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SwiftColors.backGrey,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.h),
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
                  ],
                ),
                SizedBox(height: 20.h),
                Column(
                  children: [
                    Text(
                      'Détails de la \ncommande',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'montserrat-bold',
                        color: SwiftColors.purple,
                        fontSize: 24.sp,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    if (orderStatus == OrderStatus.RES_PENDING)
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: EdgeInsets.all(15.w),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: SwiftColors.orange,
                                radius: 10,
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: Text(
                                    'Il est préférable de valider la commande avant la préparation du repas afin de permettre au livreur à arriver au temps ',
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(fontSize: 14.sp)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    SizedBox(height: 20.h),
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                      elevation: 8,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 19.h, horizontal: 31.w),
                        child: Column(
                          children: [
                            SizedBox(height: 16.h),
                            OrderinfoItem(title: 'Magasin', value: "Denny's"),
                            SizedBox(height: 16.h),
                            OrderinfoItem(title: 'Client', value: "Hamza Bendahmane"),
                            SizedBox(height: 16.h),
                            OrderinfoItem(title: 'Repas', value: "1200 DA"),
                            SizedBox(height: 16.h),
                            OrderinfoItem(title: 'Livraison', value: "200 DA"),
                            SizedBox(height: 16.h),
                            OrderinfoItem(title: 'N° du commande', value: "C6754358744535"),
                            SizedBox(height: 29.h),
                            if (orderStatus == OrderStatus.COMPLETED) OrderCompletedIcon(),
                            if (orderStatus == OrderStatus.LIV_PENDING)
                              OrderPending(orderStatus: orderStatus),
                            if (orderStatus == OrderStatus.RES_PENDING)
                              OrderPending(orderStatus: orderStatus),
                            SizedBox(height: 56.8.h),
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 1),
                                Text(
                                  '1400 Da',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.sp,
                                    color: SwiftColors.orange,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 58.h),
                if (orderStatus == OrderStatus.LIV_PENDING)
                  PrimaryButton(
                    backColor: SwiftColors.purple,
                    frontColor: Colors.white,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (c) => OrderMapWay()));
                    },
                    text: 'Voir Map',
                  ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OrderinfoItem extends StatelessWidget {
  const OrderinfoItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            color: SwiftColors.hintGreyColor,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
            color: SwiftColors.orange,
          ),
        ),
      ],
    );
  }
}

class CirclePurpleCheck extends StatefulWidget {
  const CirclePurpleCheck({
    Key? key,
  }) : super(key: key);

  @override
  State<CirclePurpleCheck> createState() => _CirclePurpleCheckState();
}

class _CirclePurpleCheckState extends State<CirclePurpleCheck> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 2000))
      ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.25,
      top: 10,
      child: SizedBox(
        height: 165,
        width: 165,
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                height: 165,
                width: 165,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return CustomPaint(
                      painter: WaterRipplePainter(_controller.value,
                          count: 2, color: SwiftColors.purple),
                    );
                  },
                ),
              ),
            ),
            Center(
              child: Container(
                height: 111,
                width: 111,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: SwiftColors.purple,
                ),
                child: Icon(
                  Icons.check,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderCompletedIcon extends StatefulWidget {
  const OrderCompletedIcon({Key? key}) : super(key: key);

  @override
  State<OrderCompletedIcon> createState() => _OrderCompletedIconState();
}

class _OrderCompletedIconState extends State<OrderCompletedIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 2000))
      ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.25,
      top: 10,
      child: Column(
        children: [
          SizedBox(
            height: 60,
            width: 60,
            child: Stack(
              children: [
                Center(
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return CustomPaint(
                          painter: WaterRipplePainter(_controller.value,
                              count: 2, color: SwiftColors.green),
                        );
                      },
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: SwiftColors.green,
                    ),
                    child: Icon(
                      Icons.check,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.2),
          Text(
            'Commande Complété',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: SwiftColors.green,
            ),
          )
        ],
      ),
    );
  }
}

class OrderPending extends StatefulWidget {
  const OrderPending({
    Key? key,
    required this.orderStatus,
  }) : super(key: key);
  final OrderStatus orderStatus;

  @override
  State<OrderPending> createState() => _OrderPendingState();
}

class _OrderPendingState extends State<OrderPending> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 2000))
      ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String text = 'en attente de \nLivraison';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedBuilder(
            animation: _controller,
            builder: (context, _ctrl) {
              return Transform.rotate(
                angle: pi * _controller.value,
                child: Image.asset('assets/icons/pending_star.png'),
              );
            }),
        const SizedBox(height: 16.2),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: SwiftColors.purple,
          ),
        )
      ],
    );
  }
}

class WaterRipplePainter extends CustomPainter {
  final double progress;
  final int count;
  final Color color;

  Paint _paint = Paint()..style = PaintingStyle.fill;

  WaterRipplePainter(this.progress, {this.count = 3, this.color = const Color(0xFF0080ff)});

  @override
  void paint(Canvas canvas, Size size) {
    double radius = min(size.width / 2, size.height / 2);

    for (int i = count; i >= 0; i--) {
      final double opacity = (1.0 - ((i + progress) / (count + 1)));
      final Color _color = color.withOpacity(opacity);
      _paint..color = _color;

      double _radius = radius * ((i + progress) / (count + 1));

      canvas.drawCircle(Offset(size.width / 2, size.height / 2), _radius, _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
