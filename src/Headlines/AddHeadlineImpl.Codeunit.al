namespace RedRabbit.HeadlineGenerator.Headlines;

codeunit 50100 "Add Headline Impl."
{
    Access = Internal;

    InherentEntitlements = X;
    InherentPermissions = X;

    procedure AddHeadline(NewHeadline: Text[2048]) Headline: Record Headline
    begin
        Headline.Init();
        Headline."Headline" := NewHeadline;
        Headline.Insert(true);

        if Headline.Count() <= 10 then
            exit;

        Headline.SetLoadFields("Entry No.");
        Headline.FindFirst();
        RemoveHeadline(Headline."Entry No.");
    end;

    procedure AddHeadline(NewHeadline: Text[2048]; NewRecordId: RecordId)
    var
        Headline: Record Headline;
    begin
        Headline := AddHeadline(NewHeadline);
        Headline."Record ID" := NewRecordId;
        Headline.Modify(true);
    end;

    procedure RemoveHeadline(HeadlineEntryNo: Integer)
    var
        Headline: Record Headline;
    begin
        if Headline.Get(HeadlineEntryNo) then
            Headline.Delete(true);
    end;
}
