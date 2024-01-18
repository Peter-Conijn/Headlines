namespace RedRabbit.HeadlineGenerator.Headlines;

using Microsoft.Sales.Document;

page 50100 "My Headlines"
{
    ApplicationArea = All;
    Caption = 'My Headlines';
    PageType = HeadlinePart;
    SourceTable = Headline;

    layout
    {
        area(content)
        {
            field(Headline1; HeadLines.Get(1))
            {
                ToolTip = 'Specifies the headline that is displayed in the Role Center.';

                trigger OnDrillDown()
                begin
                    OpenRecord(RecordIds.Get(1));
                end;
            }
            field(Headline2; HeadLines.Get(2))
            {
                ToolTip = 'Specifies the headline that is displayed in the Role Center.';

                trigger OnDrillDown()
                begin
                    OpenRecord(RecordIds.Get(2));
                end;
            }
            field(Headline3; HeadLines.Get(3))
            {
                ToolTip = 'Specifies the headline that is displayed in the Role Center.';

                trigger OnDrillDown()
                begin
                    OpenRecord(RecordIds.Get(3));
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        SetHeadlines();
    end;

    local procedure OpenRecord(RecordID: RecordId)
    var
        RecRef: RecordRef;
    begin
        if RecordID.TableNo() = 0 then
            exit;

        RecRef.Get(RecordID);

        case RecordID.TableNo() of
            Database::"Sales Header":
                OpenSalesHeader(RecRef);
        end;
    end;

    local procedure OpenSalesHeader(var RecRef: RecordRef)
    var
        SalesHeader: Record "Sales Header";
        PageId: Integer;
    begin
        RecRef.SetTable(SalesHeader);
        case SalesHeader."Document Type" of
            Enum::"Sales Document Type"::Quote:
                PageId := Page::"Sales Quote";
            Enum::"Sales Document Type"::Order:
                PageId := Page::"Sales Order";
            Enum::"Sales Document Type"::Invoice:
                PageId := Page::"Sales Invoice";
            Enum::"Sales Document Type"::"Blanket Order":
                PageId := Page::"Blanket Sales Order";
            Enum::"Sales Document Type"::"Credit Memo":
                PageId := Page::"Sales Credit Memo";
            Enum::"Sales Document Type"::"Return Order":
                PageId := Page::"Sales Return Order";
        end;

        Page.Run(PageId, SalesHeader);
    end;

    local procedure SetHeadlines()
    var
        Index: Integer;
    begin
        Rec.FindLast();
        for Index := 1 to 3 do begin
            HeadLines.Add(Rec.Headline);
            RecordIds.Add(Rec."Record ID");
            if Rec.Next(-1) = 0 then
                break;
        end;
    end;

    var
        HeadLines: List of [Text];
        RecordIds: List of [RecordId];
}
