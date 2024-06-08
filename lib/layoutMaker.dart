import 'package:flutter/material.dart';

class LayoutMaker {
  static text (String text,double textSize,Color textColor)
  {
    return Text(text,style:TextStyle(color: textColor,fontSize:textSize,fontWeight: FontWeight.normal ));
  }
  static button(VoidCallback onPress,String text,double textSize,Color backColor,Color textColor)
  {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backColor,
            foregroundColor: backColor
        ),
        onPressed: (){
          onPress();
        }, child:
    Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.bloodtype,color: Colors.white,size: 20,),
        const SizedBox(
          width: 5,
        ),
        Text(text,style: TextStyle(color: textColor,fontSize: textSize),)
      ],
    )
    );
  }
  static textField(TextEditingController textEditingController,String hintTEXT,TextInputType inputType,bool hideOrNot)
  {
    return TextFormField(
      controller:textEditingController ,
      keyboardType: inputType,
      obscureText: hideOrNot,
      cursorColor: Colors.red,
      decoration:  InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
        hintText: hintTEXT,
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
                color: Colors.red
            )
        ),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
                color: Colors.red
            )
        ),
      ),
    );
  }
  static dialog(BuildContext context,String text,VoidCallback onPress,String actionText)
  {
    return showDialog(context: context, builder: (BuildContext context)
    {
      return AlertDialog(
        title: Text(text),
        actions: [
          InkWell(
            onTap: ()
            {
              onPress();
            },
            child: Text(actionText,style: const TextStyle(color: Colors.red,fontSize: 15),),
          )
        ],
      );
    });
  }
  static dialog2(BuildContext context,String text,VoidCallback onPress,String actionText,String actionText2)
  {
    return showDialog(context: context, builder: (BuildContext context)
    {
      return AlertDialog(
        title: Text(text),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: ()
              {
                onPress();
                Navigator.pop(context);
              },
              child: Text(actionText,style: const TextStyle(color: Colors.red,fontSize: 15)),
            ),
          ),
          InkWell(
            onTap: ()
            {
              Navigator.pop(context);
            },
            child: Text(actionText2,style: const TextStyle(color: Colors.grey,fontSize: 15)),
          ),
        ],
      );
    });
  }
}