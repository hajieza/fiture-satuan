program Project1_fiture_satuan;

uses
  Forms,
  fiture_satuan in 'fiture_satuan.pas' {Form1},
  fiture_satuan2 in 'fiture_satuan2.pas' {DataModule2: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.Run;
end.
