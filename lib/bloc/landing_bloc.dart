import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:etteo_demo/helpers/helpers.dart';
import 'package:etteo_demo/model/models.dart';
import 'package:etteo_demo/bloc/bloc.dart';
import 'package:etteo_demo/providers/providers.dart';

import 'package:etteo_demo/providers/user_profile_provider.dart';
import 'package:intl/intl.dart';
import 'bloc.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {

  static DateTime serviceDate = DateTime.now();
  var date = DateFormat("EEEE, MMMM d").format(serviceDate).toUpperCase();

  // var searchFieldFlag = false;

  setDate(DateTime dateTime) {
    date = DateFormat("EEEE, MMMM d").format(dateTime).toUpperCase();
  }

  // //this method will filterOut listItem from the List
  // void dataFiltering(String text) {
    
  // }

  


  final UserProfileProvider _userProfileProvider = UserProfileProvider();

  @override
  LandingState get initialState => InitialLandingState();

  @override
  Stream<LandingState> mapEventToState( LandingEvent event,) async* {
    if (event is FetchUserProfile) {
      yield UserProfileFetchingState();
      UserProfileModel userProfileModel = await _userProfileProvider.getUserProfile();

      // Setting it to global config.
      AppConfig().userProfile = userProfileModel;
      // yield UserProfileFetched(userProfile: userProfileModel);
      yield UserProfileFetched(userProfile: userProfileModel);
    }
  }
}
