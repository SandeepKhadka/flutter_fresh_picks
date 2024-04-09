import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Frequently Asked Questions'),
            _buildFAQs(),
            SizedBox(height: 20.0),
            _buildSectionTitle('Contact Information'),
            _buildContactInfo(),
            SizedBox(height: 20.0),
            _buildSectionTitle('How-to Guides'),
            _buildHowToGuides(),
            // Add more sections here as needed
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
    );
  }

  Widget _buildFAQs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFAQItem('How can I track my order?',
            'You can track your order by going to the "Order History" section in your account.'),
        _buildFAQItem('What payment methods do you accept?',
            'We accept various payment methods including online payment like, Khalti, and cash on delivery (COD).'),
        _buildFAQItem('How do I return a product?',
            'To return a product, please contact our customer support team.'),
        // Add more FAQ items as needed
      ],
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Q: $question',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        SizedBox(height: 5.0),
        Text(
          'A: $answer',
          style: TextStyle(fontSize: 14.0),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email: Put your email here.com'),
        Text('Phone: +1234567890'),
        Text('Address: Put full address, Pokhara, Nepal'),
        // Add more contact information as needed
      ],
    );
  }

  Widget _buildHowToGuides() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHowToGuideItem('How to place an order',
            'Follow these steps to place an order:\n1. Browse the products\n2. Add desired items to your cart\n3. Proceed to checkout and select payment method\n4. Review and confirm your order\n5. Receive order confirmation'),
        _buildHowToGuideItem('How to use promo codes',
            'To use a promo code, enter the code during checkout and click "Apply". Make sure to check the terms and conditions of the promo code before use.'),
        // Add more how-to guide items as needed
      ],
    );
  }

  Widget _buildHowToGuideItem(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        SizedBox(height: 5.0),
        Text(
          description,
          style: TextStyle(fontSize: 14.0),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }
}
