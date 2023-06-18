import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protek_flutter_tools/domain/cubit/base_cubit_request_mixin.dart';

part 'base_state.dart';

abstract class BaseCubit<BaseState> extends Cubit<BaseState>
    with BaseCubitRequestMixin<BaseState> {
  BaseCubit(super.initialState);

  @override
  void emit(BaseState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
