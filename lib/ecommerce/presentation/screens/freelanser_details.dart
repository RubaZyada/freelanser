import 'package:ecommerce/ecommerce/data/freelancers_model.dart';
import 'package:ecommerce/ecommerce/presentation/widgets/rating.dart';
import 'package:flutter/material.dart';


class FreelancerDetails extends StatelessWidget {
  const FreelancerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final freelancer =
        ModalRoute.of(context)!.settings.arguments as FreelancersModel;
    return Scaffold(
      appBar: AppBar(title: Text('Freelancer Details')),
      body: Column(
        children: [
          Image.asset(freelancer.imageUrl),
          Text(freelancer.name),
          Rating(rate: freelancer.rate),
        ],
      ),
    );
  }
}
