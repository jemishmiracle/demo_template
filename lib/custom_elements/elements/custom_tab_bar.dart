import 'package:demo_template/custom_elements/custom_elements.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  int defaultIndex;
  ValueChanged<int> onChange;
  List<String> titles;
  CustomTabBar({super.key,required this.onChange,this.defaultIndex = 0, required this.titles});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: Row(
        children: List.generate(titles.length, (index) => Expanded(
          child: InkWell(
            onTap: () {
              onChange(index);
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(index == 0 ? 10 : 0),
                  bottomLeft: Radius.circular(index == 0 ? 10 : 0),
                  topRight: Radius.circular(index == (titles.length - 1) ? 10 : 0),
                  bottomRight: Radius.circular(index == (titles.length - 1) ? 10 : 0),
                ),
                gradient: LinearGradient(
                  colors: [
                    (defaultIndex == index) ? CustomColors.primary.withOpacity(0.7) : CustomColors.borderColor,
                    (defaultIndex == index) ? CustomColors.primary : Colors.white.withOpacity(0.7),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: CustomText(text: titles[index],color: (defaultIndex == index) ? Colors.white : Colors.black,),
            ),
          ),
        )),
      ),
    );
  }
}