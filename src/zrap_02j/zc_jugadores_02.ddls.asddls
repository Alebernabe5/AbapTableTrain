@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZJUGADORES_02'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_JUGADORES_02
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_JUGADORES_02
  association [1..1] to ZR_JUGADORES_02 as _BaseEntity on $projection.ID = _BaseEntity.ID
{
  key ID,
  Nombre,
  Equipo,
  Nacionalidad,
  Salario,
  Goles,
  Ntarjetas,
  IsActive,
  @Semantics: {
    User.Createdby: true
  }
  CreatedBy,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  CreatedAt,
  @Semantics: {
    User.Lastchangedby: true
  }
  LastChangedBy,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LastChangedAt,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LocalLastChangedAt,
  _BaseEntity
}
