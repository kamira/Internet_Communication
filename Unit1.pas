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
    TCPC: TIdTCPClient;
    TCPS: TIdTCPServer;
    IdEncoderMIME1: TIdEncoderMIME;
    IdDecoderMIME1: TIdDecoderMIME;
    MainMenu1: TMainMenu;
    Send1: TMenuItem;
    File1: TMenuItem;
    PictureBmpJpg1: TMenuItem;
    Login1: TMenuItem;
    User_List: TListBox;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Image1Click(Sender: TObject);
    procedure TCPSConnect(AThread: TIdPeerThread);
    procedure TCPSExecute(AThread: TIdPeerThread);
    procedure Login1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  F_NAME, F_Data: String;

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

procedure TForm1.Image1Click(Sender: TObject);
begin
    if F_NAME <> '' then
    begin
        Image1.Picture.SaveToFile(F_NAME+'.'+F_DATA);
    end;
end;

procedure TForm1.TCPSConnect(AThread: TIdPeerThread);
var
    c_user, c_password : string;
    t_user, t_password : string;
    s : string;
    List_Count, i : integer;
    k1, k2, k3 : integer;
begin
    t_user:=AThread.Connection.ReadLn();
    t_password:=AThread.Connection.ReadLn();
    {******** DONE ********}
    List_Count:=User_List.Items.Count;
    for i:=0 to List_Count-1 do
    begin
        s:=User_List.Items[i];
        k1:=pos('::',s);
        k2:=pos('@',s);
        k3:=length(s);
        c_user:=copy(s,k1+2,k2-1);
        c_password:=copy(s,k2+1,k3);

        if c_user=t_user then
        begin
            break;
        end;
    end;

    if t_user <> c_user then
    begin
        Athread.Connection.Disconnect;
        AThread.Terminate;
    end
    else
    begin
        if t_password <> c_password then
        begin
            Athread.Connection.Disconnect;
            AThread.Terminate;
        end;
    end;
end;

procedure TForm1.TCPSExecute(AThread: TIdPeerThread);
var
    temp_0, temp_1, temp_2 : string;
    k1 :integer;
begin

    temp_0:=uppercase( AThread.Connection.ReadLn() );
    temp_1:=copy(temp_0,1,1);
    if temp_1='/' then
    begin
        k1:=pos(' ',temp_0);
        temp_2:=copy(temp_0,2,k1-1);
        if temp_2='QUIT' then
        begin
            Athread.Connection.Disconnect;
            AThread.Terminate;
        end;
    end
    else
    begin

    end;
end;

procedure TForm1.Login1Click(Sender: TObject);
var
    s_ip, s_user, s_password : string;
begin
    s_ip:=INPUTBOX('LOGIN','Host Server:','');
    TCPC.Host:=s_ip;

    s_user:=INPUTBOX('LOGIN','User:','');
    s_password:=INPUTBOX('LOGIN','Password:','');

    TCPC.Connect();

    if TCPC.Connected=true then
    begin
        TCPC.WriteLn(s_user);
        TCPC.WriteLn(s_password);
    end;
end;

end.
