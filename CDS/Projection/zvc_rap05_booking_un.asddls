@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption for Booking'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZVC_RAP05_BOOKING_UN
  as projection on ZV_RAP05_BOOKING_UN
{
  key TravelId,
  key BookingId,
      BookingDate,
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      _Customer.LastName as CustomerName,
      @ObjectModel.text.element: [ 'CarrierName' ]
      CarrierId,
      _Carrier.Name      as CarrierName,
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      @ObjectModel.text.element: [ 'OverallStatus' ]
      BookingStatus,
      _Status._Text.Text as OverallStatus : localized,
      LastChangedAt,
      /* Associations */
      _Carrier,
      _Connection,
      _Customer,
      _Status,
      _Travel : redirected to parent ZVC_RAP05_TRAVEL_RT_UN
}
