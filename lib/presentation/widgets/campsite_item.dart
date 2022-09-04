import 'package:flutter/material.dart';
import 'package:roadsurfer_code_challenge/data/models/campsite_model.dart';
import 'package:roadsurfer_code_challenge/helpers/language_code_helper.dart';
import 'package:roadsurfer_code_challenge/presentation/widgets/campsite_field.dart';

class CampsiteItem extends StatelessWidget {
  const CampsiteItem({required this.campsite, Key? key}) : super(key: key);

  final CampsiteModel campsite;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.28,
          key: const Key('CampsiteItem'),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.greenAccent),
          child: Column(
            children: [
              Expanded(
                child: _buildPhoto(context),
              ),
              Expanded(
                child: _buildDataFields(context),
              ),
            ],
          ),
        ),
      );

  Widget _buildPhoto(BuildContext context) => ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
        child: Image.network(campsite.photo,
            fit: BoxFit.cover, width: double.infinity),
      );

  Widget _buildDataFields(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: MediaQuery.of(context).size.height * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              campsite.label,
              style: const TextStyle(
                fontSize: 24,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CampsiteField(Icons.location_on_outlined,
                        getCountryFromGeoLocation(campsite.geoLocation)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    CampsiteField(Icons.language,
                        _showListOfLanguages(campsite.hostLanguages)),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CampsiteField(Icons.attach_money,
                        (campsite.pricePerNight ?? 0).toString()),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    CampsiteField(
                        Icons.water_outlined,
                        (campsite.isCloseToWater ?? false)
                            ? 'Clos to water'
                            : ' Not close to water'),
                  ],
                ),
              ],
            ),
          ],
        ),
      );

  String _showListOfLanguages(List<String>? codes) {
    if (codes != null && codes.isNotEmpty) {
      String language = getDisplayLanguage(codes.first);
      for (int i = 1; i < codes.length; i++) {
        language += ', ${getDisplayLanguage(codes[i])}';
      }
      return language;
    } else {
      return 'English';
    }
  }

  String getCountryFromGeoLocation(GeoLocation? location) {
    if (location == null || location.lat == null) {
      return 'Unknown';
    } else {
      /// because in all data models location is null, i will not implement this
      /// part, for that i need to use a package to convert lat and long to human readable address
      return '';
    }
  }
}
