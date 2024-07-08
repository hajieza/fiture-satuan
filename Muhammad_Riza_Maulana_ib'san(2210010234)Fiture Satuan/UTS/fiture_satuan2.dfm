object DataModule2: TDataModule2
  OldCreateOrder = False
  Left = 192
  Top = 125
  Height = 150
  Width = 276
  object ZConnection1: TZConnection
    ControlsCodePage = cGET_ACP
    Properties.Strings = (
      'RawStringEncoding=DB_CP')
    Connected = True
    DisableSavepoints = False
    HostName = 'localhost'
    Port = 3306
    Database = 'db_penjualan'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'C:\Users\user\Downloads\libmysql (3).dll'
    Left = 24
    Top = 8
  end
  object Zsatuan: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'SELECT * FROM satuan')
    Params = <>
    Left = 104
    Top = 16
  end
  object Dssatuan: TDataSource
    DataSet = Zsatuan
    Left = 176
    Top = 16
  end
end
