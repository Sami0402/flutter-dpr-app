class AuthService{


  static bool login(String email, String password){
    if(email == 'test@test.com' && password == "123456") {
      return true;
    } else{
      return false;
    }
  }

}