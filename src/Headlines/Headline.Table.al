namespace RedRabbit.HeadlineGenerator.Headlines;

table 50100 Headline
{
    Access = Internal;
    Caption = 'Headline';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; Headline; Text[2048])
        {
            Caption = 'Headline';
        }
        field(3; "Record ID"; RecordId)
        {
            Caption = 'Record ID';
        }

    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
