unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, IdCoder, IdCoder3to4, IdCoderMIME, IdTCPServer,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, StdCtrls,
  Menus, jpeg;

type
  THlist = record
      th: TIdPeerThread;
      ip: string;
      port: integer;
      id: string;
  end;
  TForm1 = class(TForm)
    Panel_Chat: TPanel;
    Panel_Control: TPanel;
    Panel1: TPanel;
    Edit1: TEdit;
    Image1: TImage;
    Memo1: TMemo;
    OD: TOpenDialog;
    SD: TSaveDialog;
    TCPC: TIdTCPClient;
    TCPS: TIdTCPServer;
    MainMenu1: TMainMenu;
    Send1: TMenuItem;
    File1: TMenuItem;
    PictureBmpJpg1: TMenuItem;
    Login1: TMenuItem;
    Image2: TImage;
    User_List: TListBox;
    Register1: TMenuItem;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Image1Click(Sender: TObject);
    procedure TCPSConnect(AThread: TIdPeerThread);
    procedure TCPSExecute(AThread: TIdPeerThread);
    procedure Login1Click(Sender: TObject);
    procedure PictureBmpJpg1Click(Sender: TObject);
    procedure File1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Register1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  LCount=99;

var
  Form1: TForm1;
  F_NAME, F_Data: String;
  THA: array[0..LCount] of THlist;
  tpt: integer = 0;
  fname: string = '';
  anid : string;
  
  jp: Tjpegimage;

implementation

{$R *.dfm}

procedure TForm1.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key=13 then
        if Edit1.Text <> '' then
        begin
            TCPC.WriteLn(Edit1.Text);
            memo1.Lines.Add('[Me]:'+edit1.Text);
            edit1.Text:='';
        end;
    
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
    if fname <> '' then
    begin
        SD.FileName:=fname;
        if SD.Execute=true then
        begin

            Image1.Picture.SaveToFile(SD.FileName);
            fname:='';
        end;

    end;
end;

procedure TForm1.TCPSConnect(AThread: TIdPeerThread);
var
    c_user, c_password : string;
    t_user, t_password : string;
    s_user, s_password : string;
    s : string;
    List_Count, i : integer;
    k1, k2, k3 : integer;
begin

    t_user:=AThread.Connection.ReadLn();
    {******** DONE ********}
    List_Count:=User_List.Items.Count;
    for i:=0 to List_Count-1 do
    begin
        s:=User_List.Items[i];
        k2:=pos('@',s);
        k3:=length(s);
        c_user:=copy(s,1,k2-1);
        c_password:=copy(s,k2+1,k3);

        if c_user=t_user then
        begin
            break;
        end;
    end;
    
    t_password:=AThread.Connection.ReadLn();
    if t_password <> c_password then
    begin

            Athread.Connection.WriteLn('Something Wrong');
            Athread.Connection.Disconnect;
            AThread.Terminate;
    end
    else
    begin
        Athread.Connection.WriteLn('200');
        anid:=c_user;
    end;
    s:=Athread.Connection.ReadLn();
    if s='@' then
    begin
        TCPC.Host:=Athread.Connection.Socket.Binding.PeerIP;
        TCPC.Connect(1000);

        if TCPC.Connected=true then
        begin
            s_user:=INPUTBOX('LOGIN','User:','');
            TCPC.WriteLn(s_user);

            s_password:=INPUTBOX('LOGIN','Password:','');
            TCPC.WriteLn(s_password);

            s:=TCPC.ReadLn();
            if s='200' then
            begin
                Memo1.Lines.Add('Success Connection');  
                TCPC.WriteLn('*');
                Send1.Enabled:=true;
                Login1.Enabled:=false;
            end
            else
            begin
                Memo1.Lines.Add(s);
                TCPC.Disconnect;
            end;
        end;

    end;


end;

procedure TForm1.TCPSExecute(AThread: TIdPeerThread);
var
    temp0, temp1, temp2,ip,id : string;
    k1,k2,i,j,port :integer;
    ms: TMemorystream;
    sz: integer;
    jp: Tjpegimage;
begin
    while true do
    begin
    temp0:=AThread.Connection.ReadLn();
    if temp0='/*PICTURE*/' then
    begin
        ms:=Tmemorystream.Create;
        jp:=TJpegimage.Create;

        sz:=strtoint( AThread.Connection.ReadLn() );
        Athread.Connection.WriteLn('OK');

        fname:=AThread.Connection.ReadLn();
        AThread.Connection.WriteLn('OK');

        AThread.Connection.ReadStream( ms,sz );
        AThread.Connection.WriteLn('OK');

        ms.Position:=0;
        jp.LoadFromStream(ms);

        image1.Picture.Bitmap.Assign(jp);
        ms.Free;
        jp.Free;
    end
    else if temp0='/*FILE*/' then
    begin
        ms:=Tmemorystream.Create;

        sz:=strtoint( AThread.Connection.ReadLn() );
        Athread.Connection.WriteLn('OK');

        fname:=AThread.Connection.ReadLn();
        AThread.Connection.WriteLn('OK');

        AThread.Connection.ReadStream( ms,sz );
        AThread.Connection.WriteLn('OK');

        ms.Position:=0;
        SD.FileName:=fname;
        if SD.Execute=true then
        begin

            ms.SaveToFile(SD.FileName);
            fname:='';
        end;

        ms.Free;
    end
    else
    begin
        memo1.Lines.Add('['+anid+']:'+ temp0);
    end;
    end;
end;

procedure TForm1.Login1Click(Sender: TObject);
var
    s_ip, s_user, s_password, s : string;
begin
    s_ip:=INPUTBOX('LOGIN','Host Server:','');
    TCPC.Host:=s_ip;
    if (s_ip<>'') then
    begin
        TCPC.Connect(1000);

        if TCPC.Connected=true then
        begin
            s_user:=INPUTBOX('LOGIN','User:','');
            TCPC.WriteLn(s_user);

            s_password:=INPUTBOX('LOGIN','Password:','');
            TCPC.WriteLn(s_password);

            s:=TCPC.ReadLn();
            if s='200' then
            begin
                Memo1.Lines.Add('Success Connection');

                TCPC.WriteLn('@');
                Send1.Enabled:=true;
                Login1.Enabled:=false;
            end
            else
            begin
                Memo1.Lines.Add(s);
                TCPC.Disconnect;
            end;
        end;
    end;
end;

procedure TForm1.PictureBmpJpg1Click(Sender: TObject);
var
    ms: Tmemorystream;
    k: integer;
begin
    OD.Filter:='*.jpeg, *.jpg';
    if od.Execute=true then
    begin
        TCPC.WriteLn('/*PICTURE*/');
        ms:=Tmemorystream.Create;
        jp:=TjpegImage.Create;
        jp.LoadFromFile(od.FileName);
        jp.SaveToStream(ms);
        ms.Position:=0;
        image2.Picture.Assign(jp);
        k:=ms.Size;
        TCPC.WriteLn( inttostr(k) );
        TCPC.ReadLn();

        TCPC.WriteLn( ExtractFilename(OD.FileName) );
        TCPC.ReadLn();

        tcpc.WriteStream( ms );
        TCPC.ReadLn();

        ms.Free;
        jp.Free;
    end;
end;

procedure TForm1.File1Click(Sender: TObject);
var
    ms: Tmemorystream;
    k: integer;
begin
    OD.Filter:='';
    if od.Execute=true then
    begin
        TCPC.WriteLn('/*FILE*/');
        ms:=Tmemorystream.Create;
        ms.LoadFromFile( OD.FileName );
        ms.Position:=0;

        k:=ms.Size;
        TCPC.WriteLn( inttostr(k) );
        TCPC.ReadLn();

        TCPC.WriteLn( ExtractFilename(OD.FileName) );
        TCPC.ReadLn();

        tcpc.WriteStream( ms );
        TCPC.ReadLn();


        ms.Free;
    end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    try
        User_List.Items.LoadFromFile('C:/user.kk');
    except
    end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    User_List.Items.SaveToFile('C:/user.kk');
    TCPC.Disconnect;
    TCPC.DisconnectSocket;
end;

procedure TForm1.Register1Click(Sender: TObject);
var
    s_user, s_password : string;
begin
    s_user:=INPUTBOX('Register','User:','');
    s_password:=INPUTBOX('Register','Password:','');

    if (s_user <> '') and (s_password <> '') then
        User_List.Items.Add(s_user + '@' + s_password);

end;

end.
