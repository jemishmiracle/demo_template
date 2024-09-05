import 'package:flutter/material.dart';
import 'package:h3m_shimmer_card/h3m_shimmer_card.dart';
import 'package:demo_template/custom_elements/custom_elements.dart';

Widget ShimerLoader({double? height, double? width, double? radius}){
  return ShimmerCard(
    width: width ?? 43.w,
    height: height ?? 250,
    borderRadius: radius ?? 10,
    beginAlignment: Alignment.topLeft,
    endAlignment: Alignment.bottomRight,
    backgroundColor: Colors.white.withOpacity(0.4),
    shimmerColor: CustomColors.borderColor,
  );
}

Widget ProductItemShimmer({int count = 4,int crossCount = 2,}){
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossCount,
      crossAxisSpacing: 4.w,
      mainAxisSpacing: 4.w,
    ),
    shrinkWrap: true,
    padding: EdgeInsets.zero,
    physics: NeverScrollableScrollPhysics(),
    itemCount: count,
    itemBuilder: (context, index) {
      return ShimerLoader();
    },
  );
}

Widget ListItemShimmer({double height = 70}){
  return ListView.separated(
    itemCount: 8,
    shrinkWrap: true,
    padding: EdgeInsets.only(bottom: 20),
    itemBuilder: (context, index) {
      return ShimerLoader(height: height);
    },
    separatorBuilder: (context, index) => SizedBox(height: 10),
  );
}

Widget CategoryItemShimmer(){
  return ListView.separated(
    itemCount: 8,
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      return ShimerLoader(height: 150, width: 110,);
    },
    separatorBuilder: (context, index) => SizedBox(width: 10),
  );
}