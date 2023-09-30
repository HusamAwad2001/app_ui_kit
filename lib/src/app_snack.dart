import 'package:flutter/material.dart';
import 'snack/custom_snack_bar.dart';
import 'snack/top_snack_bar.dart';

abstract class AppSnack{

  static success(BuildContext context,{required String label,Curve curve=Curves.fastOutSlowIn,Curve reverseCurve=Curves.fastOutSlowIn,double borderRadius=10}){
    _show(context,label: label,type: 0,borderRadius: borderRadius);
  }
  static error(BuildContext context,{required String label,Curve curve=Curves.fastOutSlowIn,Curve reverseCurve=Curves.fastOutSlowIn,double borderRadius=10}){
    _show(context,label: label,type: 1,borderRadius: borderRadius);
  }

   static _show(BuildContext context,{required int type,required String label,Curve curve=Curves.fastOutSlowIn,Curve reverseCurve=Curves.fastOutSlowIn,double borderRadius=10}){
    showTopSnackBar(
      Overlay.of(context),
      type==0? CustomSnackBar.success(
        message: label,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ):
      CustomSnackBar.error(
        message: label,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      curve: curve,
      reverseCurve: reverseCurve
    );
  }
}