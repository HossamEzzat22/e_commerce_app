class ApiContest {
  static const String baseUrl = 'https://accept.paymob.com/api';  //
  static const String paymentApiKey = 'ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6VXhNaUo5LmV5SnVZVzFsSWpvaWFXNXBkR2xoYkNJc0ltTnNZWE56SWpvaVRXVnlZMmhoYm5RaUxDSndjbTltYVd4bFgzQnJJam8yT1RNMU1qbDkuZ1N6TzFlR1g4Y1NfNE55U0p3RElqSXRndEdyNVI1N3hUZlV2elNNWVNNYXBMUkN6TjlYYm9ZRHUyY2YwanFmLXVqbDJyNUpXR3NJb1BDcFg3QjNjd2c='; //
  static const String getAuthToken = '/auth/tokens';  //
  static const getOrderId = '/ecommerce/orders';  //
  static const getPaymentId = '/acceptance/payment_keys';  //
  static const getRefCode = '/acceptance/payments/pay';  //
  static String visaUrl =
      '$baseUrl/acceptance/iframes/730746?payment_token=$finalToken';
  static String paymentFirstToken = '';  //
  static String paymentOrderId = '';  //
  static String finalToken = '';  //
  static String refCode = '';  //



  // static String integrationIdKiosk = '';
  static String integrationIdCard = '3384660';



}
