import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'new_bloc_event.dart';
part 'new_bloc_state.dart';

class NewBlocBloc extends Bloc<NewBlocEvent, NewBlocState> {
  NewBlocBloc() : super(const NewBlocState()) {
    on<NewBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
