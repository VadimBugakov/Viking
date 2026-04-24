unit MainForm;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.JSON,
  System.StrUtils,
  System.IOUtils,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TFrmKaspiCard = class(TForm)
    PnlTop: TPanel;
    LblTitle: TLabel;
    LblName: TLabel;
    EdtName: TEdit;
    LblSku: TLabel;
    EdtSku: TEdit;
    LblBrand: TLabel;
    EdtBrand: TEdit;
    LblCategory: TLabel;
    EdtCategory: TEdit;
    LblPrice: TLabel;
    EdtPrice: TEdit;
    LblQty: TLabel;
    EdtQty: TEdit;
    LblDesc: TLabel;
    MemoDesc: TMemo;
    LblAttrs: TLabel;
    MemoAttrs: TMemo;
    BtnBuildJson: TButton;
    BtnSaveJson: TButton;
    MemoJson: TMemo;
    DlgSave: TSaveDialog;
    procedure BtnBuildJsonClick(Sender: TObject);
    procedure BtnSaveJsonClick(Sender: TObject);
  private
    function BuildProductJson: string;
    procedure ValidateInputs;
  public
  end;

var
  FrmKaspiCard: TFrmKaspiCard;

implementation

{$R *.dfm}

procedure TFrmKaspiCard.ValidateInputs;
var
  PriceValue: Currency;
  QtyValue: Integer;
begin
  if Trim(EdtName.Text) = '' then
    raise Exception.Create('Укажите название товара.');

  if Trim(EdtSku.Text) = '' then
    raise Exception.Create('Укажите SKU/артикул.');

  if not TryStrToCurr(StringReplace(EdtPrice.Text, ',', '.', [rfReplaceAll]), PriceValue) then
    raise Exception.Create('Цена должна быть числом.');

  if not TryStrToInt(EdtQty.Text, QtyValue) then
    raise Exception.Create('Количество должно быть целым числом.');
end;

function TFrmKaspiCard.BuildProductJson: string;
var
  ProductObj: TJSONObject;
  AttrObj: TJSONObject;
  Line: string;
  KeyValue: TArray<string>;
  PriceValue: Currency;
  QtyValue: Integer;
  I: Integer;
begin
  ValidateInputs;

  TryStrToCurr(StringReplace(EdtPrice.Text, ',', '.', [rfReplaceAll]), PriceValue);
  TryStrToInt(EdtQty.Text, QtyValue);

  ProductObj := TJSONObject.Create;
  try
    ProductObj.AddPair('name', Trim(EdtName.Text));
    ProductObj.AddPair('sku', Trim(EdtSku.Text));
    ProductObj.AddPair('brand', Trim(EdtBrand.Text));
    ProductObj.AddPair('category', Trim(EdtCategory.Text));
    ProductObj.AddPair('price', TJSONNumber.Create(PriceValue));
    ProductObj.AddPair('quantity', TJSONNumber.Create(QtyValue));
    ProductObj.AddPair('description', Trim(MemoDesc.Text));

    AttrObj := TJSONObject.Create;
    for I := 0 to MemoAttrs.Lines.Count - 1 do
    begin
      Line := Trim(MemoAttrs.Lines[I]);
      if Line = '' then
        Continue;

      KeyValue := SplitString(Line, ':');
      if Length(KeyValue) >= 2 then
        AttrObj.AddPair(Trim(KeyValue[0]), Trim(Copy(Line, Pos(':', Line) + 1, MaxInt)));
    end;

    ProductObj.AddPair('attributes', AttrObj);
    Result := ProductObj.Format(2);
  finally
    ProductObj.Free;
  end;
end;

procedure TFrmKaspiCard.BtnBuildJsonClick(Sender: TObject);
begin
  try
    MemoJson.Lines.Text := BuildProductJson;
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

procedure TFrmKaspiCard.BtnSaveJsonClick(Sender: TObject);
var
  JsonContent: string;
begin
  try
    JsonContent := BuildProductJson;

    DlgSave.FileName := Format('%s_%s.json', [Trim(EdtSku.Text), FormatDateTime('yyyymmdd_hhnnss', Now)]);
    if DlgSave.Execute then
    begin
      TFile.WriteAllText(DlgSave.FileName, JsonContent, TEncoding.UTF8);
      MemoJson.Lines.Text := JsonContent;
      MessageDlg('Файл сохранён: ' + DlgSave.FileName, mtInformation, [mbOK], 0);
    end;
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

end.
