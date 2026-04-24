program KaspiCardApp;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {FrmKaspiCard};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmKaspiCard, FrmKaspiCard);
  Application.Run;
end.
