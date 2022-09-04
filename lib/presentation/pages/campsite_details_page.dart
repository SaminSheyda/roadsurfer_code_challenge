import 'package:flutter/material.dart';
import 'package:roadsurfer_code_challenge/data/models/campsite_model.dart';
import 'package:roadsurfer_code_challenge/helpers/language_code_helper.dart';
import 'package:roadsurfer_code_challenge/presentation/widgets/campsite_field.dart';
import 'package:intl/intl.dart';

class CampsiteDetailsPage extends StatelessWidget {
  const CampsiteDetailsPage(this.campsite, {Key? key}) : super(key: key);
  final CampsiteModel campsite;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(child: _buildPhoto(context)),
          Expanded(
            child: Container(
              color: Colors.greenAccent,
              width: double.infinity,
              child: _buildbody(),
            ),
          ),
        ],
      );

  Widget _buildPhoto(BuildContext context) => Stack(
        children: [
          Image.network(
            campsite.photo,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          _buildBackButton(context),
        ],
      );

  Widget _buildBackButton(BuildContext context) => GestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(top: 38, left: 16),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFF0F5F5),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ),
        ),
        onTap: () => Navigator.of(context).pop(),
      );

  Widget _buildbody() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              campsite.label,
              style: const TextStyle(fontSize: 28, color: Colors.black45),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 32),
            CampsiteField(
              Icons.date_range_rounded,
              'Created at: ${DateFormat.yMMMMd('en_US').format(DateTime.parse(campsite.createdAt!))}',
              textSize: 16,
              iconSize: 20,
            ),
            const SizedBox(height: 8),
            CampsiteField(
              Icons.water_rounded,
              'Is close to water: ${(campsite.isCloseToWater ?? false) ? 'Yes' : 'No'}',
              textSize: 16,
              iconSize: 20,
            ),
            const SizedBox(height: 8),
            CampsiteField(
              Icons.local_fire_department_outlined,
              'Is camp fire to water: ${(campsite.isCampFireAllowed ?? false) ? 'Yes' : 'No'}',
              textSize: 16,
              iconSize: 20,
            ),
            const SizedBox(height: 8),
            CampsiteField(
              Icons.language,
              'Host languages: ${showListOfLanguages(campsite.hostLanguages)}',
              textSize: 16,
              iconSize: 20,
            ),
            const SizedBox(height: 8),
            CampsiteField(
              Icons.monetization_on_outlined,
              'Price per night: ${campsite.pricePerNight}',
              textSize: 16,
              iconSize: 20,
            ),
            const SizedBox(height: 8),
            CampsiteField(
              Icons.more_outlined,
              'Suitable for: ${campsite.suitableFor.toString()}',
              textSize: 16,
              iconSize: 20,
            ),
          ],
        ),
      );
}
