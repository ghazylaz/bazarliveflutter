import 'package:bazarliveflutter/themes/light_color.dart';
import 'package:bazarliveflutter/themes/theme.dart';
import 'package:bazarliveflutter/title_text.dart';
import 'package:flutter/material.dart';

import 'extentions.dart';

import 'category.dart';
// @dart=2.9
class ProductIcon extends StatelessWidget {
  // final String imagePath;
  // final String text;
  final ValueChanged<Category> onSelected;
  final Category model;
  ProductIcon({Key? key,  required this.model, required this.onSelected}) : super(key: key);

  Widget build(BuildContext context) {
    return model.id == null
        ? Container(width: 5)
        : Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Container(
              padding: AppTheme.hPadding,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: model.isSelected
                    ? LightColor.background
                    : Colors.transparent,
                border: Border.all(
                  color: model.isSelected ? LightColor.orange : LightColor.grey,
                  width: model.isSelected ? 2 : 1,
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: model.isSelected ? Color(0xff6fe6f5) : Colors.white,
                    blurRadius: 2,
                    spreadRadius: 3,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
              child: Row(

                children:  <Widget>[

                  model.name == null
                      ? Container()
                      : Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                          child: TitleText(
                            text:  model.name,
                            fontWeight: FontWeight.w700,
                            fontSize: 10,

                          ),
                        ),
                  model.image != null ? Image.asset(model.image as String) : SizedBox()
                ],
              ),
            ).ripple(
              () {
                onSelected(model);
              },
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          );
  }
}
