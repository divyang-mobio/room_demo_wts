import 'package:bloc/bloc.dart';

import '../../models/safe_model.dart';
import '../../utils/database.dart';

part 'safe_screen_event.dart';

part 'safe_screen_state.dart';

class SafeScreenBloc extends Bloc<SafeScreenEvent, SafeScreenState> {
  SafeScreenBloc() : super(SafeScreenInitial()) {
    on<IsDataIsThere>((event, emit) async {
      List<SafeModel> data = await DatabaseHelper.instance.getData();
      if (data.isNotEmpty) {
        print("have Data");
        emit(SafeScreenWithData(safeModel: data[0]));
      } else {
        print("have no Data");
        emit(SafeScreenWithOutData());
      }
    });
  }
}
