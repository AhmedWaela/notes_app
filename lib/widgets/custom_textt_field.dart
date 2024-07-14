import 'package:flutter/material.dart';

class CustomTexttField extends StatelessWidget {
  const CustomTexttField({super.key, required this.hint,  this.maxlines = 1, this.onSaved, this.onChanged});
  final String hint;
  final int maxlines;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: (value) {
        if(value?.isEmpty ?? true){
          return 'please fill the fields';
        }
        return null;
      },
      onSaved: onSaved ,
      maxLines: maxlines,
      cursorColor: const Color(0xff62FCD7),
      decoration: InputDecoration(
        hintText: hint,
hintStyle:  const TextStyle(
  color: Color(0xff62FCD7)
),
border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: const BorderSide(
    color: Colors.white
  )
),
        focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
                color: Colors.white
            )
        ),
        enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
                color: Colors.white
            )
        ),
      ),
    );
  }
}
