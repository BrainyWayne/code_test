import 'package:code_test/module/components/custom_scaffold.dart';
import 'package:code_test/module/components/global_widgets.dart';
import 'package:code_test/module/components/input_item.dart';
import 'package:code_test/module/encrypt/cubit/encrypt_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Encrypt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Encrypt",
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 17),
        children: [
          Text(
            "Data encryption between two devices",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(
            height: 10,
          ),
          Divider(),
          SizedBox(
            height: 50,
          ),
          Text(
            "Enter data to Encrypt",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            style: Theme.of(context).textTheme.bodyText1,
            onChanged: (value) {
              context.read<EncryptCubit>().textDataChanged(value);
            },
            decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
              onTap: () {
                context.read<EncryptCubit>().encryptData();
              },
              child:
                  cButton("Encrypt Data", Colors.white, Colors.green, context)),
          SizedBox(
            height: 20,
          ),
          Text(
            "Results",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(
            height: 10,
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),
          BlocBuilder<EncryptCubit, EncryptState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Encryption Key: ${state.key.base64}",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Encryption IV: ${state.iv.base64}",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Text Data: ${state.textData}",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Encrypted Data: ${state.encrypt.base64}",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Decrypted Data: ${state.decryptedData}",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
