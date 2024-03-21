import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PromoCode extends StatefulWidget {
  final void Function(String)?
      onApplyPromoCode; // Callback function declaration

  const PromoCode({Key? key, this.onApplyPromoCode}) : super(key: key);

  @override
  State<PromoCode> createState() => _PromoCodeState();
}

class _PromoCodeState extends State<PromoCode> {
  TextEditingController promoCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("PromoCode"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Image.asset("assets/done.png"),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: promoCodeController,
              decoration: InputDecoration(
                labelText: "Enter your PromoCode",
                hintText: "Promo Code",
                prefixIcon: Icon(Icons.local_offer, semanticLabel: 'Promocode'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  String promoCode = promoCodeController.text.trim();
                  if (promoCode.isNotEmpty) {
                    widget.onApplyPromoCode
                        ?.call(promoCode); // Calling the callback function
                    Navigator.pop(context);
                  }
                },
                child: Text('Apply'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
