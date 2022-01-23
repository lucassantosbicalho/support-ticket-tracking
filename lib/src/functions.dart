import 'dart:ui';
import 'package:flutter/material.dart';

colorProgressBar(avatarPercent) {
  if(avatarPercent > 1.0){
    return const Color(0xffEB0030);//
  } else if(avatarPercent > 0.8 && avatarPercent <= 1.0){
    return const Color(0xffF28352);
  } else if(avatarPercent > 0.5 && avatarPercent <= 0.8){
    return const Color(0xffDFF56C);
  } else {
    return const Color(0xff27F5AA);
  }
}
