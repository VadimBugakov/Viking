object FrmKaspiCard: TFrmKaspiCard
  Left = 0
  Top = 0
  Caption = 'Заполнение карточки товара Kaspi'
  ClientHeight = 700
  ClientWidth = 980
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PnlTop: TPanel
    Left = 0
    Top = 0
    Width = 980
    Height = 700
    Align = alClient
    TabOrder = 0
    object LblTitle: TLabel
      Left = 24
      Top = 16
      Width = 427
      Height = 25
      Caption = 'Генератор JSON карточки товара для Kaspi магазина'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblName: TLabel
      Left = 24
      Top = 64
      Width = 104
      Height = 15
      Caption = 'Название товара:'
    end
    object EdtName: TEdit
      Left = 24
      Top = 84
      Width = 433
      Height = 23
      TabOrder = 0
    end
    object LblSku: TLabel
      Left = 24
      Top = 120
      Width = 72
      Height = 15
      Caption = 'SKU/Артикул:'
    end
    object EdtSku: TEdit
      Left = 24
      Top = 140
      Width = 209
      Height = 23
      TabOrder = 1
    end
    object LblBrand: TLabel
      Left = 248
      Top = 120
      Width = 40
      Height = 15
      Caption = 'Бренд:'
    end
    object EdtBrand: TEdit
      Left = 248
      Top = 140
      Width = 209
      Height = 23
      TabOrder = 2
    end
    object LblCategory: TLabel
      Left = 24
      Top = 176
      Width = 64
      Height = 15
      Caption = 'Категория:'
    end
    object EdtCategory: TEdit
      Left = 24
      Top = 196
      Width = 433
      Height = 23
      TabOrder = 3
    end
    object LblPrice: TLabel
      Left = 24
      Top = 232
      Width = 63
      Height = 15
      Caption = 'Цена (KZT):'
    end
    object EdtPrice: TEdit
      Left = 24
      Top = 252
      Width = 209
      Height = 23
      TabOrder = 4
      Text = '0'
    end
    object LblQty: TLabel
      Left = 248
      Top = 232
      Width = 72
      Height = 15
      Caption = 'Количество:'
    end
    object EdtQty: TEdit
      Left = 248
      Top = 252
      Width = 209
      Height = 23
      TabOrder = 5
      Text = '1'
    end
    object LblDesc: TLabel
      Left = 24
      Top = 288
      Width = 61
      Height = 15
      Caption = 'Описание:'
    end
    object MemoDesc: TMemo
      Left = 24
      Top = 308
      Width = 433
      Height = 113
      ScrollBars = ssVertical
      TabOrder = 6
    end
    object LblAttrs: TLabel
      Left = 24
      Top = 432
      Width = 235
      Height = 15
      Caption = 'Характеристики (каждая строка: ключ:значение):'
    end
    object MemoAttrs: TMemo
      Left = 24
      Top = 452
      Width = 433
      Height = 117
      Lines.Strings = (
        #1062#1074#1077#1090': '#1095#1077#1088#1085#1099#1081'
        #1042#1077#1089': 1.2 #1082#1075')
      ScrollBars = ssVertical
      TabOrder = 7
    end
    object BtnBuildJson: TButton
      Left = 24
      Top = 584
      Width = 209
      Height = 33
      Caption = 'Сформировать JSON'
      TabOrder = 8
      OnClick = BtnBuildJsonClick
    end
    object BtnSaveJson: TButton
      Left = 248
      Top = 584
      Width = 209
      Height = 33
      Caption = 'Сохранить JSON в файл'
      TabOrder = 9
      OnClick = BtnSaveJsonClick
    end
    object MemoJson: TMemo
      Left = 488
      Top = 64
      Width = 465
      Height = 553
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 10
      WordWrap = False
    end
  end
  object DlgSave: TSaveDialog
    DefaultExt = 'json'
    Filter = 'JSON files (*.json)|*.json'
    Left = 904
    Top = 24
  end
end
