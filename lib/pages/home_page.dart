import 'package:coding_chal/model/country.dart';
import 'package:coding_chal/provider/country_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: 'UserName',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter username";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    Provider.of<CountryProvider>(context, listen: false)
                        .getCountry(_controller.text);
                  }
                },
                child: const Text("Search"),
              ),
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          Selector<CountryProvider, bool>(
            shouldRebuild: (prev, next) => prev != next,
            selector: (context, countryProvider) =>
                countryProvider.fetchingCountry,
            builder: (context, fetchingCountry, _) {
              if (fetchingCountry) {
                return Image.asset(
                  'assets/gllobe.gif',
                  height: 150,
                  width: 150,
                );
              } else {
                return Selector<CountryProvider, List<Country>?>(
                  shouldRebuild: (prev, next) => prev != next,
                  selector: (context, countryProvider) =>
                      countryProvider.countries,
                  builder: (context, countries, _) {
                    if (countries == null) {
                      return const SizedBox.shrink();
                    } else if (countries.isEmpty) {
                      return const Center(
                        child: Text("No country found"),
                      );
                    } else {
                      return Column(
                        children: [
                          const Text(
                            "Probabily you are from",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            children: countries
                                .map((e) => Chip(label: Text(e.countryCode)))
                                .toList(),
                          ),
                        ],
                      );
                    }
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
