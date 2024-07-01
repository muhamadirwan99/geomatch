import 'package:flutter/material.dart';
import 'package:geomatch/core.dart';
import '../view/credit_view.dart';

class CreditController extends State<CreditView> {
  static late CreditController instance;
  late CreditView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
