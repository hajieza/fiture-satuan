unit fiture_satuan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label3: TLabel;
    Edit3: TEdit;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure posisiawal;
    procedure bersih;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a: String;

implementation

uses fiture_satuan2;

{$R *.dfm}

procedure TForm1.bersih;
begin
Edit1.Clear;
Edit2.Clear;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
Edit1.Enabled:= True;
Edit2.Enabled:= True;
Button1.Enabled:= False;
Button2.Enabled:= True;
Button3.Enabled:= False;
Button4.Enabled:= True;
Button5.Enabled:= True;
end;

procedure TForm1.posisiawal;
begin
 bersih;
 Button1.Enabled:= true;
 Button2.Enabled:= false;
 Button3.Enabled:= false;
 Button4.Enabled:= false;
 Button5.Enabled:= false;
 Edit1.Enabled:= false;
 Edit2.Enabled:= false;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
if (Edit1.Text = '') or (Edit2.Text = '') then
begin
  ShowMessage('Nama Satuan Tidak Boleh Kosong!');end else
if DataModule2.Zsatuan.Locate('name',Edit1.Text,[]) and
DataModule2.Zsatuan.Locate('deskripsi',Edit2.Text,[]) then
begin
ShowMessage('Nama Satuan '+Edit1.Text+' dan deskripsi '+Edit2.Text+' Sudah Ada Didalam Sistem');
end else
Begin // simpan
with DataModule2.Zsatuan do
begin
SQL.Clear;
SQL.Add('insert into satuan (name , deskripsi) values("'+Edit1.Text+'" , "'+Edit2.Text+'")');ExecSQL ;
SQL.Clear;
SQL.Add('select * from satuan');Open;
end;
ShowMessage('Data Berhasil Disimpan!');
end;

posisiawal;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 posisiawal;
 bersih;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 if (Edit1.Text = '') or (Edit2.Text = '') then
 begin
  ShowMessage('Nama Satuan Tidak Boleh Kosong!');
 end else
begin
  if (Edit1.Text = DataModule2.Zsatuan.Fields[1].AsString) and
  (Edit2.Text = DataModule2.Zsatuan.Fields[2].AsString) then
  begin
  ShowMessage('Nama Satuan '+Edit1.Text+' dan Deskripsi '+Edit2.Text+' Tidak Ada Perubahan');
  end else
  begin
    // Kode update
    with DataModule2.Zsatuan do
    begin
    SQL.Clear;
      SQL.Add('update satuan set name = "' + Edit1.Text + '", deskripsi = "' + Edit2.Text + '" where id = "' + a + '"');      ExecSQL;
      SQL.Clear;
      SQL.Add('select * from satuan');
      Open;
    end;
    ShowMessage('Data Berhasil Diupdate!');
  end;
  end;
posisiawal;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 if MessageDlg('Apakah Anda Yakin Menghapus Data ini',mtWarning,[mbYes,mbNo],0)=mryes then
 begin
with DataModule2.Zsatuan do
begin
SQL.Clear;
SQL.Add('delete from satuan where id= "'+a+'"');
ExecSQL ;
SQL.Clear;SQL.Add('select * from satuan');
Open;end;
ShowMessage('Data Berhasil DiDelete!');
end else
begin
ShowMessage('Data Batal Dihapus!');
end;
posisiawal;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
 posisiawal;
end;

procedure TForm1.Edit3Change(Sender: TObject);
begin
with DataModule2.Zsatuan do
begin
SQL.Clear;
SQL.Add('select * from satuan where name like "%'+edit3.Text+'%"');
Open;
end;
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin
Edit1.Text:= DataModule2.Zsatuan.Fields[1].AsString;
Edit2.Text:= DataModule2.Zsatuan.Fields[2].AsString;
a:= DataModule2.Zsatuan.Fields[0].AsString;
Edit1.Enabled:=True;
Edit2.Enabled:=True;
Button1.Enabled:=False;
Button2.Enabled:=False;
Button3.Enabled:=True;
Button4.Enabled:=True;
Button5.Enabled:=True;
end;

end.
