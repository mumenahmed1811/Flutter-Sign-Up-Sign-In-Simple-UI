import 'package:flutter/material.dart';

class SignInBody extends StatefulWidget {
  @override
  _SignInBodyState createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(padding: EdgeInsets.all(20),
        child: Column(
          children: [
            GetUserEmailInput(),
            SizedBox(height: 20,),
            GetUserPasswordInput(),
            SizedBox(height: 20,),
            FormError(errors: errors),
            makeButton("Sign In", (){
            if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            // if all are valid then go to success screen
            }
            }),
          ],
        ),
      ),
    );
  }

  TextFormField GetUserEmailInput() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (!value.isEmpty) {
          removeError(error: "Please enter your email");
        }
        if (
        (
            value.contains("@")
                && value.contains(".com")))
                 {
          removeError(error: "Please enter valid email");
        }

        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: "Please enter your email");
        }
        if (!
            (
            value.contains("@")
            && value.contains(".com")
            ))
              {
              addError(error: "Please enter valid email");
          }
        return null;
      },
      decoration: InputDecoration(

        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.mail,
          color: Colors.grey,
          size: 25.0,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.grey),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.grey),
          gapPadding: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.grey),
          gapPadding: 10,
        ),
      ),

    );
  }

  TextFormField GetUserPasswordInput() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (!value.isEmpty) {
          removeError(error: "Please enter your password");
        }
        if (
        !(value.length >= 8)) {
          removeError(error: "Password must be atleast 8 characters");
        }
        return null;
      },
      obscureText: true,
      validator: (value) {

        if (value.length < 8) {
          addError(error: "Password must be atleast 8 characters");
        }
        if (value.isEmpty) {
          addError(error: "Please enter your password");
        }

        return null;
      },
      decoration: InputDecoration(

        labelText: "Password",
        hintText: "Enter your Password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.lock,
          color: Colors.grey,
          size: 25.0,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.grey),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.grey),
          gapPadding: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.grey),
          gapPadding: 10,
        ),
      ),

    );
  }



}

class makeButton extends StatelessWidget {
  final String text;
  final Function press;

  makeButton(this.text, this.press);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: FlatButton(
        color: Colors.amberAccent,
        onPressed: press,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}


class FormError extends StatelessWidget {
  const FormError({
    Key key,
     this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index])),
    );
  }

  Row formErrorText({String error}) {
    return Row(
      children: [
        Icon(Icons.error, color: Colors.red,),
        SizedBox(
          width: 10,
        ),
        Text(error),
      ],
    );
  }

}