import 'package:auth_test/config/palette.dart';
import 'package:auth_test/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() onTap;
  final String title;
  final double height;
  final double minWidth;
  final Color color;
  final Color textColor;
  final bool isLoading;

  const CustomButton({
    Key? key,
    required this.onTap,
    required this.title,
    required this.height,
    required this.minWidth,
    required this.color,
    required this.textColor,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(minWidth, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1),
        ),
        foregroundColor: color,
        backgroundColor: color,
        shadowColor: Colors.transparent,
        padding: EdgeInsets.symmetric(
          horizontal: 0.0,
          vertical: 0.0,
        ),
        elevation: 0.0,
      ),
      child: isLoading
          ? CustomLoader(
              height: 24.0,
              color: textColor,
            )
          : Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: textColor,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }
}

class CustomButtonTextWithIcon extends StatelessWidget {
  final Function() onTap;
  final String title;
  final double height;
  final double minWidth;
  final Color color;
  final Color textColor;
  final bool isLoading;
  final Widget icon;
  final bool isRounded;

  const CustomButtonTextWithIcon({
    Key? key,
    required this.onTap,
    required this.title,
    required this.height,
    required this.minWidth,
    required this.color,
    required this.textColor,
    required this.isLoading,
    required this.icon,
    this.isRounded = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(minWidth, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(isRounded ? height * 2 : 4),
        ),
        foregroundColor: color,
        backgroundColor: color,
        shadowColor: Colors.transparent,
        padding: EdgeInsets.symmetric(
          horizontal: 0.0,
          vertical: 0.0,
        ),
        elevation: 0.0,
      ),
      child: isLoading
          ? CustomLoader(
              height: 24.0,
              color: textColor,
            )
          : Row(
              children: [
                icon,
                const SizedBox(
                  width: 12.0,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: textColor,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final Function() onTap;
  final String title;
  final double height;
  final double minWidth;
  final Color textColor;

  const CustomTextButton({
    Key? key,
    required this.onTap,
    required this.title,
    required this.height,
    required this.minWidth,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        minimumSize: Size(minWidth, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        foregroundColor: Palette.primary,
        shadowColor: Colors.transparent,
        padding: EdgeInsets.symmetric(
          horizontal: 0.0,
          vertical: 0.0,
        ),
        elevation: 0.0,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          color: textColor,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final Widget icon;
  final bool dark;
  final Color backgroundColor;
  final double radius;
  final Function() onTap;
  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.dark = false,
    this.radius = 24.0,
    this.backgroundColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: IconButton(
            splashRadius: radius,
            splashColor: dark ? Palette.primary.withOpacity(0.4) : Colors.white.withOpacity(0.3),
            highlightColor: dark ? Palette.primary.withOpacity(0.3) : Colors.white.withOpacity(0.2),
            padding: EdgeInsets.zero,
            onPressed: onTap,
            icon: icon,
          ),
        ),
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  final Function() onTap;
  final String title;
  final double height;
  final double minWidth;
  final Color textColor;
  final Color color;
  final Color borderColor;
  final bool isLoading;
  final bool isRounded;
  const CustomOutlinedButton({
    Key? key,
    required this.onTap,
    required this.title,
    required this.height,
    required this.minWidth,
    required this.textColor,
    required this.color,
    required this.borderColor,
    this.isLoading = false,
    this.isRounded = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(minWidth, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(isRounded ? height * 2 : 0),
        ),
        foregroundColor: color,
        backgroundColor: color,
        side: BorderSide(
          width: 0.8,
          color: borderColor,
        ),
        shadowColor: Colors.black.withOpacity(0.5),
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 0.0,
        ),
      ),
      onPressed: onTap,
      child: isLoading
          ? CustomLoader(
              height: 24.0,
              color: Colors.white,
            )
          : BodySmall(
              title: title,
              color: textColor,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
              lineHeight: 1.0,
            ),
    );
  }
}

class ThemeSwitchButton extends StatelessWidget {
  final Color bgColor;
  final Color iconColor;
  final Color textColor;
  final String title;
  final Function onTap;
  final bool showDot;
  const ThemeSwitchButton({
    Key? key,
    required this.bgColor,
    required this.iconColor,
    required this.title,
    required this.onTap,
    required this.textColor,
    required this.showDot,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          leading: Container(
            height: 24.0,
            width: 24.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(
                color: iconColor,
                width: 2.0,
              ),
            ),
            alignment: Alignment.center,
            child: showDot
                ? CircleAvatar(
                    radius: 6.0,
                    backgroundColor: iconColor,
                  )
                : const SizedBox.shrink(),
          ),
          title: BodyLarge(title: title, color: textColor),
          onTap: () => onTap,
        ),
      ),
    );
  }
}
