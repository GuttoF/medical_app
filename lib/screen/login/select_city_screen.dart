import 'package:flutter/material.dart';
import 'package:mech/common/color_extension.dart';
import 'package:mech/screen/login/on_boarding_screen.dart';

class SelectCityScreen extends StatefulWidget {
  const SelectCityScreen({super.key});

  @override
  State<SelectCityScreen> createState() => _SelectCityScreenState();
}

class _SelectCityScreenState extends State<SelectCityScreen> {
  int selectIndex = -1;
  String searchText = '';

  final List<String> allCities = [
    'Aracaju',
    'Belém',
    'Belo Horizonte',
    'Boa Vista',
    'Brasília',
    'Campo Grande',
    'Curitiba',
    'Cuiabá',
    'Florianópolis',
    'Fortaleza',
    'Goiânia',
    'João Pessoa',
    'Macapá',
    'Maceió',
    'Manaus',
    'Natal',
    'Palmas',
    'Porto Alegre',
    'Recife',
    'Rio Branco',
    'Rio de Janeiro',
    'Salvador',
    'São Luís',
    'São Paulo',
    'Teresina'
  ];

  List<String> get filteredCities {
    if (searchText.isEmpty) return allCities;
    return allCities
        .where((city) => city.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Selecione a Cidade",
          style: TextStyle(
            color: TColor.primaryTextW,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 35,
                decoration: BoxDecoration(
                  color: TColor.primary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                        offset: Offset(0, 3))
                  ],
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: "Pesquise sua cidade",
                    hintStyle:
                        TextStyle(color: TColor.placeholder, fontSize: 14),
                    prefixIcon: Icon(
                      Icons.search,
                      color: TColor.placeholder,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: TColor.black,
                  size: 25,
                ),
                const SizedBox(width: 8),
                Text(
                  "Use sua localização atual",
                  style: TextStyle(
                    color: TColor.black,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                itemCount: filteredCities.length,
                itemBuilder: (context, index) {
                  final city = filteredCities[index];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectIndex = index;
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const OnBoardingScreen()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        city,
                        style: TextStyle(
                          color: selectIndex == index
                              ? TColor.black
                              : TColor.placeholder,
                          fontSize: 16,
                          fontWeight: selectIndex == index
                              ? FontWeight.w600
                              : FontWeight.w400,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.black26,
                  height: 1,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
