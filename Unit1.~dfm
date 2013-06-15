object Form1: TForm1
  Left = 240
  Top = 245
  Width = 731
  Height = 727
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
    Width = 585
    Height = 669
    Align = alLeft
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object Panel1: TPanel
      Left = 1
      Top = 647
      Width = 583
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
      Width = 583
      Height = 646
      Align = alClient
      TabOrder = 1
    end
  end
  object Panel_Control: TPanel
    Left = 585
    Top = 0
    Width = 130
    Height = 669
    Align = alLeft
    TabOrder = 0
    object Image1: TImage
      Left = 1
      Top = 1
      Width = 128
      Height = 128
      Align = alTop
    end
    object ListBox1: TListBox
      Left = 1
      Top = 129
      Width = 128
      Height = 539
      Align = alClient
      ItemHeight = 14
      TabOrder = 0
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 88
    Top = 24
  end
  object SaveDialog1: TSaveDialog
    Left = 120
    Top = 24
  end
  object IdTCPClient1: TIdTCPClient
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 0
    Left = 88
    Top = 56
  end
  object IdTCPServer1: TIdTCPServer
    Bindings = <>
    CommandHandlers = <>
    DefaultPort = 0
    Greeting.NumericCode = 0
    MaxConnectionReply.NumericCode = 0
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
    object Send1: TMenuItem
      Caption = '&Send'
      object File1: TMenuItem
        Caption = '&File'
      end
      object PictureBmpJpg1: TMenuItem
        Caption = '&Picture(Bmp, Jpg)'
      end
    end
  end
end
