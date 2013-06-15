unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, IdCoder, IdCoder3to4, IdCoderMIME, IdTCPServer,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, StdCtrls,
  Menus;

type
  TForm1 = class(TForm)
    Panel_Chat: TPanel;
    Panel_Control: TPanel;
    Panel1: TPanel;
    Edit1: TEdit;
    ListBox1: TListBox;
    Image1: TImage;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    IdTCPClient1: TIdTCPClient;
    IdTCPServer1: TIdTCPServer;
    IdEncoderMIME1: TIdEncoderMIME;
    IdDecoderMIME1: TIdDecoderMIME;
    MainMenu1: TMainMenu;
    Send1: TMenuItem;
    File1: TMenuItem;
    PictureBmpJpg1: TMenuItem;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key=13 then
        if Edit1.Text <> '' then
        begin
            memo1.Lines.Add(Edit1.Text);
            edit1.Text:='';
        end;
    
end;

end.
