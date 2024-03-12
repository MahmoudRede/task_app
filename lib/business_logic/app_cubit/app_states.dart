abstract class AppState{

}

class InitialState extends AppState{}

class GetCurrentWeatherLoadingState extends AppState{}
class GetCurrentWeatherSuccessState extends AppState{}
class GetCurrentWeatherErrorState extends AppState{}

class SelectWeatherImageState extends AppState{}