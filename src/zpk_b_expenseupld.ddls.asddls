@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Expense Upload Base View'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZPK_B_EXPENSEUPLD
  as select from zpkexpenseupld
{
  key uploaduuid    as Uploaduuid,
      filename      as Filename,
      mimetype      as Mimetype,
      @Semantics.largeObject: {
        fileName: 'filename',
        mimeType: 'mimetype',
        acceptableMimeTypes: [ 'application/vnd.ms-excel', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' ],
        contentDispositionPreference: #INLINE
      }
      content       as Content,
      comments      as Comments,
      @Semantics.user.localInstanceLastChangedBy: true
      lastchangedby as Lastchangedby,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      lastchangedat as Lastchangedat
}
