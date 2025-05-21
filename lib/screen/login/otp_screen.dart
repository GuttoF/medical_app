import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:mech/common/color_extension.dart';
import 'package:mech/screen/login/verified_screen.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                
                Image.asset(
                  "assets/img/color_logo.png",
                  width: MediaQuery.of(context).size.width * 0.33,
                ),
                
                const SizedBox(height: 60),
                
                Text(
                  "Insira o código de verificação",
                  style: TextStyle(
                    color: TColor.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                
                const SizedBox(height: 15),
                
                Text(
                  "Insira o código de verificação enviado para seu \nnúmero de telefone",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 14,
                  ),
                ),
                
                const SizedBox(height: 30),
                
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: TColor.placeholder,
                  focusedBorderColor: TColor.primary,
                  obscureText: false,
                  textStyle: const TextStyle(
                    color: Color(0xff43C73D),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  showFieldAsBox: false,
                  borderWidth: 3.0,
                  onCodeChanged: (value) {},
                  onSubmit: (value) {},
                ),
                
                const SizedBox(height: 30),
                
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const VerifiedScreen())
                    );
                  },
                  child: Container(
                    width: double.maxFinite,
                    height: 40,
                    decoration: BoxDecoration(
                      color: TColor.primary,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 20),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Não recebeu o código?",
                      style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 12,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        " Reenvie aqui.",
                        style: TextStyle(
                          color: TColor.primary,
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                ),
                
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
