object Form1: TForm1
  Left = 308
  Top = 259
  Width = 527
  Height = 576
  Caption = 'Internet Communication'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 14
  object Panel_Chat: TPanel
    Left = 0
    Top = 0
    Width = 381
    Height = 518
    Align = alLeft
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object Panel1: TPanel
      Left = 1
      Top = 496
      Width = 379
      Height = 21
      Align = alBottom
      Caption = 'Panel1'
      TabOrder = 0
      object Edit1: TEdit
        Left = 0
        Top = 0
        Width = 585
        Height = 22
        TabOrder = 0
        OnKeyDown = Edit1KeyDown
      end
    end
    object Memo1: TMemo
      Left = 1
      Top = 1
      Width = 379
      Height = 495
      Align = alClient
      TabOrder = 1
    end
  end
  object Panel_Control: TPanel
    Left = 381
    Top = 0
    Width = 130
    Height = 518
    Align = alLeft
    TabOrder = 0
    object Image1: TImage
      Left = 1
      Top = 1
      Width = 128
      Height = 128
      Align = alTop
      OnClick = Image1Click
    end
    object ListBox1: TListBox
      Left = 1
      Top = 129
      Width = 128
      Height = 388
      Align = alClient
      ItemHeight = 14
      TabOrder = 0
    end
  end
  object User_List: TListBox
    Left = 511
    Top = 0
    Width = 0
    Height = 518
    TabStop = False
    Align = alClient
    ItemHeight = 14
    Items.Strings = (
      'Admin::Admin@root')
    TabOrder = 2
  end
  object OpenDialog1: TOpenDialog
    Left = 88
    Top = 24
  end
  object SaveDialog1: TSaveDialog
    Left = 120
    Top = 24
  end
  object TCPC: TIdTCPClient
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 66535
    Left = 88
    Top = 56
  end
  object TCPS: TIdTCPServer
    Active = True
    Bindings = <>
    CommandHandlers = <>
    DefaultPort = 66535
    Greeting.NumericCode = 0
    MaxConnectionReply.NumericCode = 0
    OnConnect = TCPSConnect
    OnExecute = TCPSExecute
    ReplyExceptionCode = 0
    ReplyTexts = <>
    ReplyUnknownCommand.NumericCode = 0
    Left = 120
    Top = 56
  end
  object IdEncoderMIME1: TIdEncoderMIME
    FillChar = '='
    Left = 88
    Top = 88
  end
  object IdDecoderMIME1: TIdDecoderMIME
    FillChar = '='
    Left = 120
    Top = 88
  end
  object MainMenu1: TMainMenu
    Left = 152
    Top = 24
    object Login1: TMenuItem
      Caption = '&Login'
      OnClick = Login1Click
    end
    object Send1: TMenuItem
      Caption = '&Send'
      object File1: TMenuItem
        Caption = '&File'
      end
      object PictureBmpJpg1: TMenuItem
        Caption = '&Picture(bmp, jpeg)'
      end
    end
  end
end
