import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:mech/common/color_extension.dart';
import 'package:mech/screen/login/otp_screen.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  late FlCountryCodePicker countryCodePicker;
  late CountryCode countryCode;

  @override
  void initState() {
    super.initState();
    countryCodePicker = const FlCountryCodePicker();
    countryCode = CountryCode(
      name: "Brasil",
      code: "BR",
      dialCode: "+55",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                
                Image.asset(
                  "assets/img/color_logo.png",
                  width: MediaQuery.of(context).size.width * 0.33,
                ),
                
                const SizedBox(height: 60),
                
                Text(
                  "Insira seu número de telefone",
                  style: TextStyle(
                    color: TColor.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                
                const SizedBox(height: 15),
                
                Text(
                  "O código de verificação será enviado para o\nnúmero",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 14,
                  ),
                ),
                
                const SizedBox(height: 30),
                
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: TColor.placeholder,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () async {
                          final code = await countryCodePicker.showPicker(
                            context: context,
                          );

                          if (code != null) {
                            setState(() {
                              countryCode = code;
                            });
                          }
                        },
                        child: Container(
                          height: 45,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: TColor.placeholder,
                              width: 1,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            countryCode.dialCode,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "Ex: 81987654321",
                            hintStyle: TextStyle(
                              color: TColor.placeholder,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                
                const SizedBox(height: 30),
                
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const OTPScreen()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: TColor.primary,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Continuar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
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
