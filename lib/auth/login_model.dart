class LoginModel {
   final String id;
   final String email;
   final String password;

   LoginModel({
      required this.id,
      required this.email,
      required this.password
   });

   factory LoginModel.fromJson(Map data) {
      return LoginModel(
         id: data['_id'],
         email: data['email'],
         password: data['password']
      );
   }
}