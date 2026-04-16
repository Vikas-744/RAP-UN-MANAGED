@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Root Main'
@Metadata.ignorePropagatedAnnotations: true


define root view entity ZV_RAP05_TRAVEL_ROOT_UN
  //  as select from zvt_rap05_trvl_m
  as select from /dmo/travel
  composition [1..*] of ZV_RAP05_BOOKING_UN      as _booking
  association [0..1] to /DMO/I_Agency            as _Agency   on $projection.AgencyId = _Agency.AgencyID
  association [0..1] to /DMO/I_Customer          as _Customer on $projection.CustomerId = _Customer.CustomerID
  association [1..*] to I_Currency               as _Currency on $projection.CurrencyCode = _Currency.CurrencyISOCode
  association [0..1] to /DMO/I_Overall_Status_VH as _Status   on $projection.OverallStatus = _Status.OverallStatus
{
  key travel_id     as TravelId,
      agency_id     as AgencyId,
      customer_id   as CustomerId,
      begin_date    as BeginDate,
      end_date      as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee   as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price   as TotalPrice,
      currency_code as CurrencyCode,
      description   as Description,
      status        as OverallStatus,
      @Semantics.user.createdBy: true
      createdby     as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      createdat     as CreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      lastchangedby as LastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      lastchangedat as LastChangedAt,


      //      overall_status  as OverallStatus,
      //      @Semantics.user.createdBy: true
      //      created_by      as CreatedBy,
      //      @Semantics.systemDateTime.createdAt: true
      //      created_at      as CreatedAt,
      //      @Semantics.user.localInstanceLastChangedBy: true
      //      last_changed_by as LastChangedBy,
      //      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      //      last_changed_at as LastChangedAt,
      //** Association **
      _Agency,
      _Customer,
      _Currency,
      _Status,
      _booking

}
