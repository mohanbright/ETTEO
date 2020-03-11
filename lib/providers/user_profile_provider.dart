// import 'package:etteo_demo/api/offline_api.dart';
import 'package:etteo_demo/api/user_profile_api.dart';
import 'package:etteo_demo/model/models.dart';

class UserProfileProvider {
  UserProfileApi _userProfileApi = UserProfileApi();
  
  Future<UserProfileModel> getUserProfile() async {
    return _userProfileApi.getUserProfile();
    
    
    // AppConfig().isOnline
    //     ? await _userProfileApi.getUserProfile()
    //     : await _offlineApi.getUserProfile();
  }
}
