object Form1: TForm1
  Left = 192
  Top = 125
  Width = 870
  Height = 450
  Caption = 'SATUAN'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 24
    Width = 29
    Height = 13
    Caption = 'NAMA'
  end
  object Label2: TLabel
    Left = 40
    Top = 64
    Width = 52
    Height = 13
    Caption = 'DESKRIPSI'
  end
  object Label3: TLabel
    Left = 48
    Top = 304
    Width = 86
    Height = 13
    Caption = 'MASUKKAN NAMA'
  end
  object Edit1: TEdit
    Left = 112
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 112
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 48
    Top = 152
    Width = 617
    Height = 120
    DataSource = DataModule2.Dssatuan
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object Button1: TButton
    Left = 40
    Top = 104
    Width = 75
    Height = 25
    Caption = 'BARU'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 136
    Top = 104
    Width = 75
    Height = 25
    Caption = 'SIMPAN'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 232
    Top = 104
    Width = 75
    Height = 25
    Caption = 'UBAH'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 328
    Top = 104
    Width = 75
    Height = 25
    Caption = 'HAPUS'
    TabOrder = 6
    OnClick = Button4Click
  end
  object Edit3: TEdit
    Left = 176
    Top = 296
    Width = 121
    Height = 21
    TabOrder = 7
    OnChange = Edit3Change
  end
  object Button5: TButton
    Left = 432
    Top = 104
    Width = 75
    Height = 25
    Caption = 'BATAL'
    TabOrder = 8
    OnClick = Button5Click
  end
end
