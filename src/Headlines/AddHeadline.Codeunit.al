namespace RedRabbit.HeadlineGenerator.Headlines;

/// <summary>
/// This codeunit is used to add headlines to the Headline table.
/// </summary>
codeunit 50101 "Add Headline"
{
    Access = Public;

    InherentEntitlements = X;
    InherentPermissions = X;

    /// <summary>
    /// Adds a new headline to the system.
    /// </summary>
    /// <param name="NewHeadline">The new headline to be added.</param>
    procedure AddHeadline(NewHeadline: Text[2048])
    begin
        AddHeadlineImpl.AddHeadline(NewHeadline);
    end;

    /// <summary>
    /// Adds a new headline to the system.
    /// </summary>
    /// <param name="NewHeadline">The text of the new headline.</param>
    /// <param name="NewRecordId">The record ID of the new headline.</param>
    procedure AddHeadline(NewHeadline: Text[2048]; NewRecordId: RecordId)
    begin
        AddHeadlineImpl.AddHeadline(NewHeadline, NewRecordId);
    end;

    /// <summary>
    /// Removes a headline with the specified entry number.
    /// </summary>
    /// <param name="EntryNo">The entry number of the headline to be removed.</param>
    procedure RemoveHeadline(EntryNo: Integer)
    begin
        AddHeadlineImpl.RemoveHeadline(EntryNo);
    end;

    var
        AddHeadlineImpl: Codeunit "Add Headline Impl.";
}
