import 'package:cv/src/localizations/localization.dart';
import 'package:cv/src/paths.dart';
import 'package:cv/src/widgets/account_tile_widget.dart';
import 'package:cv/src/widgets/theme_switch_tile_widget.dart';
import 'package:flutter/material.dart';

class BottomSheetMenu extends StatefulWidget {
  const BottomSheetMenu(
      {Key key,
      this.backgroundColor,
      this.height = 275.0,
      this.borderRadius = const BorderRadius.only(
          topLeft: const Radius.circular(10.0),
          topRight: const Radius.circular(10.0))})
      : super(key: key);

  final Color backgroundColor;
  final double height;
  final BorderRadius borderRadius;

  @override
  State<StatefulWidget> createState() => _BottomSheetMenuState();
}

class _BottomSheetMenuState extends State<BottomSheetMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      color: Colors.transparent,
      child: Container(
        decoration: new BoxDecoration(
          color:
              widget.backgroundColor ?? Theme.of(context).dialogBackgroundColor,
          borderRadius: widget.borderRadius,
        ),
        child: _buildBottomSheet(context),
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Column(
      children: <Widget>[
        AccountTile(),
        Divider(),
        ThemeSwitchTile(),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text(Localization.of(context).settings),
          onTap: () => _navigateToSettings(context),
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              child: Text(Localization.of(context).menuPP),
              onPressed: () {},
            ),
            Text(Localization.of(context).middleDot),
            MaterialButton(
              child: Text(Localization.of(context).menuToS),
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }

  void _navigateToSettings(BuildContext context) {
    Navigator.of(context).pushNamed(kPathSettings);
  }
}
