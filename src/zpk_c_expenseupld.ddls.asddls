@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Expense Upload Projection View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZPK_C_EXPENSEUPLD
  provider contract transactional_query
  as projection on ZPK_B_EXPENSEUPLD
{
  key Uploaduuid,
      Filename,
      Mimetype,
      @Semantics.largeObject: {
        fileName: 'filename',
        mimeType: 'mimetype',
        acceptableMimeTypes: [ 'application/vnd.ms-excel', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' ],
        contentDispositionPreference: #INLINE
      }      
      Content,
      Comments,
      @Semantics.user.localInstanceLastChangedBy: true
      Lastchangedby,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      Lastchangedat
}
