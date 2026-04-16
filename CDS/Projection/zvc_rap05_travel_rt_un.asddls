@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consuming for Projection of Travel Root Entity'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true


define root view entity ZVC_RAP05_TRAVEL_RT_UN
  provider contract transactional_query
  as projection on ZV_RAP05_TRAVEL_ROOT_un
{
  key TravelId           as TravelId,

      @Consumption.valueHelpDefinition: [{ entity : { name : '/DMO/I_Agency' ,
                                                      element : 'AgencyID'
                                                          }
            }]
      @ObjectModel.text.element: [ 'AgencyName' ]
      AgencyId,
      _Agency.Name       as AgencyName,

      @Consumption.valueHelpDefinition: [{ entity : { name : '/DMO/I_Customer' ,
                                                      element : 'CustomerID'
                                                          }
            }]
      @ObjectModel.text.element: [ 'lastname' ]
      CustomerId,
      _Customer.LastName as lastname,

      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,

      @Consumption.valueHelpDefinition: [{ entity : { name : 'I_Currency' ,
                                                element : 'Currency'
                                                    }
      }]
      CurrencyCode,
      Description,

      @Consumption.valueHelpDefinition: [{ entity : { name : '/DMO/I_Overall_Status_VH' ,
                                                element : 'OverallStatus'
                                                    }
      }]
      @ObjectModel.text.element: [ 'OverallStatusText' ]
      OverallStatus,
      _Status._Text.Text as OverallStatusText : localized,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      /* Associations */
      _Agency,
      _booking : redirected to composition child ZVC_RAP05_BOOKING_UN,
      _Currency,
      _Customer,
      _Status
}
