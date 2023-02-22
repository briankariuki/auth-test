import 'package:auth_test/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;

  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final TextEditingController? controller;
  final Function(String value) onChanged;
  final TextInputType? keyboardType;
  final bool obsecureText;
  final bool readOnly;

  final List<String>? autofillHints;
  final Function()? onEditingComplete;
  final FocusNode? focusNode;
  final List<TextInputFormatter> inputFormatters;

  const CustomTextField({
    Key? key,
    this.hintText,
    this.controller,
    required this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.keyboardType,
    this.autofillHints,
    this.onEditingComplete,
    this.obsecureText = false,
    this.focusNode,
    this.readOnly = false,
    this.inputFormatters = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      minLines: minLines,
      readOnly: readOnly,
      keyboardType: keyboardType,
      focusNode: focusNode,
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxLength),
        ...inputFormatters,
      ],
      autofillHints: autofillHints,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      controller: controller,
      obscureText: obsecureText,
      cursorColor: Palette.primary,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 14.0,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        prefixStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14.0,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        hintStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14.0,
          color: Palette.gray2,
          fontWeight: FontWeight.w500,
        ),
        errorStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14.0,
          color: Palette.primary,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: suffixIcon,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18.0,
          vertical: 20.0,
        ),
        fillColor: Colors.black.withOpacity(0.12),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(1.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1.0),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Palette.secondary_red,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Palette.secondary_red,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(1.0),
        ),
        filled: true,
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? prefixText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final TextEditingController? controller;
  final Function(String value) onChanged;
  final String? Function(String? value) validator;
  final List<String>? autofillHints;
  final Function()? onEditingComplete;
  final bool obsecureText;
  final FocusNode? focusNode;
  final bool readOnly;

  final AutovalidateMode? autovalidateMode;
  final TextInputType? keyboardType;
  final List<TextInputFormatter> inputFormatters;

  const CustomTextFormField({
    Key? key,
    this.hintText,
    this.controller,
    required this.onChanged,
    required this.validator,
    this.prefixText,
    this.suffixIcon,
    this.autofillHints,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.onEditingComplete,
    this.obsecureText = false,
    this.focusNode,
    this.readOnly = false,
    this.autovalidateMode,
    this.prefixIcon,
    this.keyboardType,
    this.inputFormatters = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      keyboardType: keyboardType,
      readOnly: readOnly,
      focusNode: focusNode,
      maxLines: maxLines,
      minLines: minLines,
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxLength),
        ...inputFormatters,
      ],
      autofillHints: autofillHints,
      validator: validator,
      onChanged: onChanged,
      obscureText: obsecureText,
      onEditingComplete: onEditingComplete,
      cursorColor: Palette.primary,
      controller: controller,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 14.0,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        prefixStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14.0,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        hintStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14.0,
          color: Palette.gray2,
          fontWeight: FontWeight.w500,
        ),
        errorStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14.0,
          color: Palette.primary,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: suffixIcon,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18.0,
          vertical: 20.0,
        ),
        fillColor: Colors.black.withOpacity(0.12),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(1.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1.0),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Palette.secondary_red,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Palette.secondary_red,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(1.0),
        ),
        filled: true,
      ),
    );
  }
}

class CustomLoader extends StatelessWidget {
  final double height;
  final Color color;
  const CustomLoader({Key? key, required this.height, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: color.withOpacity(0.3), width: 2),
            borderRadius: BorderRadius.circular(30),
          ),
          height: height,
          width: height,
        ),
        SizedBox(
          height: height - 2.0,
          width: height - 2.0,
          child: RepaintBoundary(
            child: CircularProgressIndicator(
              color: color,
              strokeWidth: 1.5,
            ),
          ),
        )
      ],
    );
  }
}

class CustomCircularProgress extends StatefulWidget {
  final double height;
  final double value;
  final Color color;
  const CustomCircularProgress({
    Key? key,
    required this.height,
    required this.color,
    required this.value,
  }) : super(key: key);

  @override
  State<CustomCircularProgress> createState() => _CustomCircularProgressState();
}

class _CustomCircularProgressState extends State<CustomCircularProgress> with SingleTickerProviderStateMixin {
  final ColorTween _backgroundColorTween = ColorTween();

  static final Animatable<double> _easeOutTween = CurveTween(curve: Curves.easeOut);

  late AnimationController _controller;

  late Animation<Color?> _backgroundColor;

  @override
  void didChangeDependencies() {
    _backgroundColorTween
      ..begin = Colors.white
      ..end = Palette.secondary_red;

    super.didChangeDependencies();

    _controller.value = widget.value;
  }

  // var isExpanded = false;

  // _onExpansionChanged(bool val) {
  //   setState(() {
  //     isExpanded = val;
  //     if (isExpanded) {
  //       _controller.forward();
  //     } else {
  //       _controller.reverse();
  //     }
  //   });
  // }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: Duration(milliseconds: 200), vsync: this);

    _backgroundColor = _controller.drive(_backgroundColorTween.chain(_easeOutTween));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.value = widget.value > 0.6 ? widget.value : 0.0;

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: _backgroundColor.value!.withOpacity(0.3), width: 2),
            borderRadius: BorderRadius.circular(30),
          ),
          height: widget.height,
          width: widget.height,
        ),
        SizedBox(
          height: widget.height - 2.0,
          width: widget.height - 2.0,
          child: RepaintBoundary(
            child: CircularProgressIndicator(
              color: widget.color,
              valueColor: _backgroundColor,
              value: widget.value,
              strokeWidth: 1.5,
            ),
          ),
        )
      ],
    );
  }
}
