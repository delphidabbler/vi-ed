inherited ResOutputDirDlg: TResOutputDirDlg
  Caption = 'Choose Compiler Output Folder'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBody: TPanel
    Width = 351
    Height = 57
    ExplicitWidth = 351
    ExplicitHeight = 57
    object lblDirName: TLabel
      Left = 0
      Top = 0
      Width = 323
      Height = 13
      Caption = 
        'Enter &path to compiled .res files or choose by clicking browse ' +
        'button:'
      FocusControl = edDirName
    end
    object sbDirName: TSpeedButton
      Left = 328
      Top = 24
      Width = 23
      Height = 22
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777000000000007777700333333333077770B033333333307770FB033333333
        30770BFB0333333333070FBFB000000000000BFBFBFBFB0777770FBFBFBFBF07
        77770BFB00000007777770007777777700077777777777777007777777770777
        0707777777777000777777777777777777777777777777777777}
      OnClick = sbDirNameClick
    end
    object edDirName: TEdit
      Left = 0
      Top = 24
      Width = 321
      Height = 21
      TabOrder = 0
    end
  end
  object dlgDirName: TPJBrowseDialog
    Options = [boDirsOnly]
    Left = 8
    Top = 80
  end
end
