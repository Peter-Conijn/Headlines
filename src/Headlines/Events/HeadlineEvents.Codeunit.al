namespace RedRabbit.HeadlineGenerator.Headlines.Events;

using Microsoft.Sales.Document;
using RedRabbit.HeadlineGenerator.Headlines;

codeunit 50102 "Headline Events"
{
    Access = Internal;

    InherentEntitlements = X;
    InherentPermissions = X;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterInsertEvent, '', false, false)]
    local procedure OnAfterInsertEvent_SalesHeader(var Rec: Record "Sales Header"; RunTrigger: Boolean)
    begin
        if Rec.IsTemporary() then
            exit;

        AddHeadline.AddHeadline(StrSubstNo(SalesDocumentAdded, Format(Rec."Document Type").ToLower()), Rec.RecordId());
    end;

    var
        AddHeadline: Codeunit "Add Headline";
        SalesDocumentAdded: Label 'A new sales %1 has been created.';
}
