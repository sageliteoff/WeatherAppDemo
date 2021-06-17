import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/features/weather/domain/entities/weatherEntity.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';

import '../../../../dependency_injection.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<WeatherBloc>(
      create: (context) => getIt<WeatherBloc>(),
      child: HomeBody(),
    ));
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: draftScreenHeigt.h,
      width: draftScreenWidth.w,
      decoration: BoxDecoration(
        gradient: kBackgroundGradient,
      ),
      child: Padding(
        padding: const EdgeInsets.all(kSpacingX16),
        child: Center(
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherInitial) {
                return SearchTextinput(
                  editingController: TextEditingController(),
                );
              }

              if (state is WeatherLoading) {
                return Center(child: CircularProgressIndicator());
              }
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    height: draftScreenHeigt * 0.5.h,
                    child: HomeTopSection(),
                  ),
                  SizedBox(
                    height: kSpacingX64.h,
                  ),
                  HomeMiddleSection(),
                  Expanded(child: HomeBottomSection())
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class HomeBottomSection extends StatelessWidget {
  const HomeBottomSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WeatherInfo(
              inforText: "visibility",
              inforValue: "300",
              inforIconData: Icons.thermostat_outlined,
            ),
            WeatherInfo(
              inforText: "humidity",
              inforValue: "300",
              inforIconData: Icons.pin_drop,
            ),
            WeatherInfo(
              inforText: "pressure",
              inforValue: "300",
              inforIconData: Icons.thermostat_outlined,
            ),
          ],
        ),
        Text("Last update ${DateTime.now().toString()}"),
        Text("Demo API Created by Sagelite")
      ],
    );
  }
}

class WeatherInfo extends StatelessWidget {
  final String inforText;
  final IconData inforIconData;
  final String inforValue;

  const WeatherInfo({
    @required this.inforText,
    @required this.inforValue,
    @required this.inforIconData,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(inforIconData),
            Text(inforText),
          ],
        ),
        SuperScript(baseText: inforValue, superscriptText: "o")
      ],
    );
  }
}

class HomeTopSection extends StatelessWidget {
  final TextEditingController searchTextInputController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SearchTextinput(
        editingController: searchTextInputController,
      ),
      LocationDetails(),
      Container(
          decoration: BoxDecoration(),
          height: kSpacingX160.h,
          width: 0.8 * draftScreenWidth.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Temperatur section
              //
              WeatherTemperature(),
            ],
          ))
    ]);
  }
}

class HomeMiddleSection extends StatelessWidget {
  const HomeMiddleSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSpacingX36.h,
      child: Text(
        getIt<WeatherBloc>().state.weather.description,
        style: kHeadingTextStyle(),
      ),
    );
  }
}

class WeatherTemperature extends StatelessWidget {
  final WeatherEntity weather = getIt<WeatherBloc>().state.weather;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SuperScript(
              baseText: "${weather.temprature}",
              superscriptText: "o",
              fontSize: kSpacingX42,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Feels like",
                  style: kInfoTextSytle(),
                ),
                SuperScript(
                    baseText: "${weather.feelsLike}", superscriptText: "o"),
              ],
            )
          ],
        ),
        this.weather.iconUrl != null
            ? Image.network(weather.iconUrl)
            : Icon(
                Icons.cloud,
                color: kWhiteColor,
                size: kSpacingX64,
              ),
      ],
    );
  }
}

class SuperScript extends StatelessWidget {
  final String baseText;
  final String superscriptText;
  final double fontSize;

  final bool showUnit;

  const SuperScript({
    @required this.baseText,
    @required this.superscriptText,
    this.fontSize = kSpacingX12,
    this.showUnit = false,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: this.baseText,
            style: TextStyle(
              color: kWhiteColor,
              fontSize: this.fontSize,
            )),
        WidgetSpan(
          child: Transform.translate(
            offset: Offset(this.fontSize * 0.2, -0.5 * this.fontSize),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.superscriptText,
                  //superscript is usually smaller in size
                  textScaleFactor: 0.7,
                  style: TextStyle(
                    color: kWhiteColor,
                  ),
                ),
                this.showUnit
                    ? SizedBox(
                        width: this.fontSize * 0.1,
                      )
                    : SizedBox(),
                this.showUnit
                    ? Text(
                        "C",
                        textScaleFactor: 0.5,
                        style: TextStyle(color: kWhiteColor),
                      )
                    : SizedBox()
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class LocationDetails extends StatelessWidget {
  final WeatherEntity weather = getIt<WeatherBloc>().state.weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          this.weather.locationName,
          style: kHeadingTextStyle(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              color: kWhiteColor,
              size: kSpacingX12.sp,
            ),
            SizedBox(
              width: kSpacingX8,
            ),
            Text(
              "${this.weather.coordinate["lon"]}, ${this.weather.coordinate["lat"]}",
              style: kInfoTextSytle(),
            )
          ],
        )
      ],
    );
  }
}

class SearchTextinput extends StatelessWidget {
  final TextEditingController editingController;
  const SearchTextinput({
    Key key,
    @required this.editingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSpacingX42.h,
      decoration: BoxDecoration(
        border: Border.all(color: kWhiteColor),
        color: Colors.white,
        borderRadius: BorderRadius.circular(kSpacingX2),
      ),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        controller: this.editingController,
        onFieldSubmitted: (text) {
          BlocProvider.of<WeatherBloc>(context)
              .add(GetWeatherEvent(locationName: text));
        },
        decoration: InputDecoration(
          hintText: "Enter City",
          hintStyle: TextStyle(fontSize: kSpacingX16),
          prefixIcon: Icon(Icons.search),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
