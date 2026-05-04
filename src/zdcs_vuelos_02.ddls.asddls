@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vuelos'
define view entity ZDCS_VUELOS_02
  as select from /dmo/flight  as vuelos
    join         /dmo/carrier as aerolineas on vuelos.carrier_id = aerolineas.carrier_id
{
key aerolineas.name as nombre,
    vuelos.connection_id as conexion,
    vuelos.flight_date as fecha,
    vuelos.price as precio,
    vuelos.currency_code as moneda
  }
