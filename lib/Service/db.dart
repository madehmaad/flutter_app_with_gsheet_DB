import 'package:dio/dio.dart';
import 'package:study_room_project/model/result_model.dart';

late List<RoomModel> Rooms = [];
List<RoomModel> studyRoomsList = [];
List<RoomModel> coffeShopsList = [];
List<RoomModel> meetingRoomList = [];

abstract class dbService {
  Dio dio = Dio();
  late Response raw;
  String baseUrl =
      'https://script.google.com/macros/s/AKfycbzd5VvDELwPBq_ZIkY7_RhLAcujhWaCANE3HsnTMnCEExwHWzdFNOn1wBuTD98f4Huh/exec';
}

class DataService extends dbService {
  getRooms() async {
    try {
      raw = await dio.get(baseUrl);
      Rooms = List.generate(
          raw.data.length, (index) => RoomModel.fromMap(raw.data[index]));
      print(Rooms);
      studyRoomsList.clear();
      coffeShopsList.clear();
      meetingRoomList.clear();
      Rooms.forEach((element) {
        if (element.type == 'study room' && element.status == 'available') {
          studyRoomsList.add(element);
        } else if (element.type == 'coffee shop' &&
            element.status == 'available') {
          coffeShopsList.add(element);
        } else if (element.type == 'meeting room' &&
            element.status == 'available') {
          meetingRoomList.add(element);
        } else {}
      });
      return Rooms;
    } catch (e) {
      return 'No Internet';
    }
  }

//
}
