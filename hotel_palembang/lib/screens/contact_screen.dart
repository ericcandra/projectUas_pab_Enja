import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Admin'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Admin: Enja',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ContactInfoRow(
              icon: Icons.phone,
              label: 'WhatsApp',
              contactInfo: '+62 812-3456-7890',
            ),
            const SizedBox(height: 8),
            ContactInfoRow(
              icon: Icons.email,
              label: 'Email',
              contactInfo: 'enja@example.com',
            ),
            const SizedBox(height: 8),
            ContactInfoRow(
              icon: Icons.account_circle,
              label: 'Instagram',
              contactInfo: '@enja_instagram',
            ),
          ],
        ),
      ),
    );
  }
}

class ContactInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String contactInfo;

  const ContactInfoRow({
    required this.icon,
    required this.label,
    required this.contactInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 28),
        const SizedBox(width: 16),
        Text(
          '$label: ',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        Expanded(
          child: Text(
            contactInfo,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}