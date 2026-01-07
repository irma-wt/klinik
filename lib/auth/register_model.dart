class RegisterModel {
   final String id;
   final String full_name;
   final String email;
   final String phone_number;
   final String password;
   final String confirm_password;

   RegisterModel({
      required this.id,
      required this.full_name,
      required this.email,
      required this.phone_number,
      required this.password,
      required this.confirm_password
   });

   factory RegisterModel.fromJson(Map data) {
      return RegisterModel(
         id: data['_id'],
         full_name: data['full_name'],
         email: data['email'],
         phone_number: data['phone_number'],
         password: data['password'],
         confirm_password: data['confirm_password']
      );
   }
}