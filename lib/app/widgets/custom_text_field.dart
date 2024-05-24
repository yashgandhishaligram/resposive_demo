import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextFieldWidget extends StatefulWidget {
  CustomTextFieldWidget(
      {Key? key,
      required this.textEditingController,
      this.isPassword = false,
      this.isObscureText = false,
      this.title,
      this.textFieldType,
      this.suffixIcon,
      this.suffixImage,
      this.isSuffix = false,
      this.isPrefix = false,
      this.isDense = false,
      this.isReadOnly = false,
      this.preIcon,
      this.labelText,
      this.labelTextColor,
      this.onTap,
      this.disabled,
      this.inputFormat,
      this.contentPadding,
      this.isValidate = false,
        this.fillColor,
      this.validator,
      this.textFieldFillColor,
      this.hintStyle,
      this.borderRadius,
      this.onChanged})
      : super(key: key);
  final TextEditingController textEditingController;
  final void Function(String)? onChanged;
  final bool? isPassword;
  bool? isObscureText;
  final TextInputType? textFieldType;
  final bool? isSuffix;
  final IconData? suffixIcon;
  final Widget? suffixImage;
  final bool? isPrefix;
  final bool? isDense;
  final bool? isReadOnly;
  final IconData? preIcon;
  final String? title;
  final String? labelText;
  final Color? labelTextColor;
  final Color? fillColor;
  final List<TextInputFormatter>? inputFormat;
  final EdgeInsetsGeometry? contentPadding;
  final bool? isValidate;
  final bool? disabled;
  final String? validator;
  final Color? textFieldFillColor;
  final TextStyle? hintStyle;
  final double? borderRadius;
  final VoidCallback? onTap;

  @override
  State<StatefulWidget> createState() {
    return _CustomTextFieldWidgetState();
  }
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black),
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      readOnly: widget.isReadOnly!,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // validator: (value) =>
      //     AuthFormValidation().formValidation(value!, widget.validator!),
      controller: widget.textEditingController,
      onChanged: widget.onChanged,
      keyboardType: widget.textFieldType,
      inputFormatters: widget.inputFormat,
      obscureText: widget.isObscureText!,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
          isDense: widget.isDense,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
              borderSide: const BorderSide(
                  color: Colors.black, width: 2.0)),
          hintText: widget.labelText,
          hintStyle: widget.hintStyle ??
              const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
          focusedBorder: InputBorder.none /*OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.0),
              borderSide:  const BorderSide(
                  color: Colors.black, width: 2.0))*/,
          enabledBorder: InputBorder.none,
         /* OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.0),
              borderSide:  const BorderSide(
                  color: Colors.black, width: 2.0)),*/
          errorBorder: InputBorder.none,
/*          OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.0),
              borderSide: const BorderSide(
                  color: Colors.red, width:2.0)),*/
          disabledBorder: InputBorder.none,
         /* OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.0),
              borderSide:  const BorderSide(
                  color: Colors.black, width: 2.0)),*/
          contentPadding: widget.contentPadding ??
              const EdgeInsets.only(left: 20, bottom: 10, top: 10, right: 20),
          fillColor: widget.fillColor,
          filled: true,
          prefixIcon: widget.isPrefix!
              ? Icon(widget.preIcon!, color: Colors.grey, size: 24)
              : null,
          suffixIcon: widget.isSuffix!
              ? IconButton(
                  icon: Icon(
                      widget.isPassword!
                          ? widget.isObscureText!
                              ? Icons.visibility_off
                              : Icons.visibility
                          : widget.suffixIcon,
                      color: widget.isPassword!
                          ? widget.isObscureText!
                              ? Colors.grey
                              : Colors.black
                          : Colors.black),
                  onPressed: () {
                    setState(() {
                      widget.isObscureText = !widget.isObscureText!;
                    });
                  },
                )
              : widget.suffixImage),
    );
  }
}
