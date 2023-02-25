part of 'controller_cubit.dart';

@immutable
abstract class ControllerState {}

class ControllerInitial extends ControllerState {}

class PaymentAuthLoadingStates extends ControllerState {}

class PaymentAuthSuccessStates extends ControllerState {}

class PaymentAuthErrorStates extends ControllerState {
  final String error;
  PaymentAuthErrorStates(this.error);
}

// for order id
class PaymentOrderIdLoadingStates extends ControllerState {}

class PaymentOrderIdSuccessStates extends ControllerState {}

class PaymentOrderIdErrorStates extends ControllerState {
  final String error;
  PaymentOrderIdErrorStates(this.error);
}

// for request token
class PaymentRequestTokenLoadingStates extends ControllerState {}

class PaymentRequestTokenSuccessStates extends ControllerState {}

class PaymentRequestTokenErrorStates extends ControllerState {
  final String error;
  PaymentRequestTokenErrorStates(this.error);
}

// for ref code
class PaymentRefCodeLoadingStates extends ControllerState {}

class PaymentRefCodeSuccessStates extends ControllerState {}

class PaymentRefCodeErrorStates extends ControllerState {
  final String error;
  PaymentRefCodeErrorStates(this.error);
}