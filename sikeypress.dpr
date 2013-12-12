program sikeypress;

{$APPTYPE CONSOLE}

uses
  SysUtils,IniFiles,
  SIMouseKeyboard in 'SIMouseKeyboard.pas';

var
command,str,path:string;
inkey:word;
inx,iny,inmaxmove,intime:integer;
vkHash,comhash: THashedStringList;
txt:textfile;

procedure getvk_hash;
VAR
b:STRING;
begin
  vkHash := THashedStringList.Create;
//  AssignFile(txt,path+'\VK.TXT');
//  reset(txt);
 // while not Eof(txt) do
 //     begin
 //     Readln(txt,b);
     vkHash.Add('VK_LBUTTON=01');
vkHash.Add('VK_RBUTTON=02');
vkHash.Add('VK_CANCEL=03');
vkHash.Add('VK_MBUTTON=04');
vkHash.Add('VK_BACK=08');
vkHash.Add('VK_TAB=09');
vkHash.Add('VK_CLEAR=0C');
vkHash.Add('VK_RETURN=0D');
vkHash.Add('VK_SHIFT=10');
vkHash.Add('VK_CONTROL=11');
vkHash.Add('VK_MENU=12');
vkHash.Add('VK_PAUSE=13');
vkHash.Add('VK_CAPITAL=14');
vkHash.Add('VK_KANA=15');
vkHash.Add('VK_HANGEUL=15');
vkHash.Add('VK_HANGUL=15');
vkHash.Add('VK_JUNJA=17');
vkHash.Add('VK_FINAL=18');
vkHash.Add('VK_HANJA=19');
vkHash.Add('VK_KANJI=19');
vkHash.Add('VK_ESCAPE=1B');
vkHash.Add('VK_CONVERT=1C');
vkHash.Add('VK_NONCONVERT=1D');
vkHash.Add('VK_ACCEPT=1E');
vkHash.Add('VK_MODECHANGE=1F');
vkHash.Add('VK_SPACE=20');
vkHash.Add('VK_PRIOR=21');
vkHash.Add('VK_NEXT=22');
vkHash.Add('VK_END=23');
vkHash.Add('VK_HOME=24');
vkHash.Add('VK_LEFT=25');
vkHash.Add('VK_UP=26');
vkHash.Add('VK_RIGHT=27');
vkHash.Add('VK_DOWN=28');
vkHash.Add('VK_SELECT=29');
vkHash.Add('VK_PRINT=2A');
vkHash.Add('VK_EXECUTE=2B');
vkHash.Add('VK_SNAPSHOT=2C');
vkHash.Add('VK_INSERT=2D');
vkHash.Add('VK_DELETE=2E');
vkHash.Add('VK_HELP=2F');
vkHash.Add('VK_C0=C0');
vkHash.Add('VK_BD=BD');
vkHash.Add('VK_BB=BB');
vkHash.Add('VK_DC=DC');
vkHash.Add('VK_DB=DB');
vkHash.Add('VK_DD=DD');
vkHash.Add('VK_BA=BA');
vkHash.Add('VK_DE=DE');
vkHash.Add('VK_BC=BC');
vkHash.Add('VK_BE=BE');
vkHash.Add('VK_BF=BF');
vkHash.Add('VK_0=30');
vkHash.Add('VK_1=31');
vkHash.Add('VK_2=32');
vkHash.Add('VK_3=33');
vkHash.Add('VK_4=34');
vkHash.Add('VK_5=35');
vkHash.Add('VK_6=36');
vkHash.Add('VK_7=37');
vkHash.Add('VK_8=38');
vkHash.Add('VK_9=39');
vkHash.Add('VK_A=41');
vkHash.Add('VK_B=42');
vkHash.Add('VK_C=43');
vkHash.Add('VK_D=44');
vkHash.Add('VK_E=45');
vkHash.Add('VK_F=46');
vkHash.Add('VK_G=47');
vkHash.Add('VK_H=48');
vkHash.Add('VK_I=49');
vkHash.Add('VK_J=4A');
vkHash.Add('VK_K=4B');
vkHash.Add('VK_L=4C');
vkHash.Add('VK_M=4D');
vkHash.Add('VK_N=4E');
vkHash.Add('VK_O=4F');
vkHash.Add('VK_P=50');
vkHash.Add('VK_Q=51');
vkHash.Add('VK_R=52');
vkHash.Add('VK_S=53');
vkHash.Add('VK_T=54');
vkHash.Add('VK_U=55');
vkHash.Add('VK_V=56');
vkHash.Add('VK_W=57');
vkHash.Add('VK_X=58');
vkHash.Add('VK_Y=59');
vkHash.Add('VK_Z=5A');
vkHash.Add('VK_LWIN=5B');
vkHash.Add('VK_RWIN=5C');
vkHash.Add('VK_APPS=5D');
vkHash.Add('VK_NUMPAD0=60');
vkHash.Add('VK_NUMPAD1=61');
vkHash.Add('VK_NUMPAD2=62');
vkHash.Add('VK_NUMPAD3=63');
vkHash.Add('VK_NUMPAD4=64');
vkHash.Add('VK_NUMPAD5=65');
vkHash.Add('VK_NUMPAD6=66');
vkHash.Add('VK_NUMPAD7=67');
vkHash.Add('VK_NUMPAD8=68');
vkHash.Add('VK_NUMPAD9=69');
vkHash.Add('VK_MULTIPLY=6A');
vkHash.Add('VK_ADD=6B');
vkHash.Add('VK_SEPARATOR=6C');
vkHash.Add('VK_SUBTRACT=6D');
vkHash.Add('VK_DECIMAL=6E');
vkHash.Add('VK_DIVIDE=6F');
vkHash.Add('VK_F1=70');
vkHash.Add('VK_F2=71');
vkHash.Add('VK_F3=72');
vkHash.Add('VK_F4=73');
vkHash.Add('VK_F5=74');
vkHash.Add('VK_F6=75');
vkHash.Add('VK_F7=76');
vkHash.Add('VK_F8=77');
vkHash.Add('VK_F9=78');
vkHash.Add('VK_F10=79');
vkHash.Add('VK_F11=7A');
vkHash.Add('VK_F12=7B');
vkHash.Add('VK_F13=7C');
vkHash.Add('VK_F14=7D');
vkHash.Add('VK_F15=7E');
vkHash.Add('VK_F16=7F');
vkHash.Add('VK_F17=80');
vkHash.Add('VK_F18=81');
vkHash.Add('VK_F19=82');
vkHash.Add('VK_F20=83');
vkHash.Add('VK_F21=84');
vkHash.Add('VK_F22=85');
vkHash.Add('VK_F23=86');
vkHash.Add('VK_F24=87');
vkHash.Add('VK_NUMLOCK=90');
vkHash.Add('VK_SCROLL=91');
vkHash.Add('VK_LSHIFT=A0');
vkHash.Add('VK_RSHIFT=A1');
vkHash.Add('VK_LCONTROL=A2');
vkHash.Add('VK_RCONTROL=A3');
vkHash.Add('VK_LMENU=A4');
vkHash.Add('VK_RMENU=A5');
vkHash.Add('VK_PROCESSKEY=E5');
vkHash.Add('VK_ATTN=F6');
vkHash.Add('VK_CRSEL=F7');
vkHash.Add('VK_EXSEL=F8');
vkHash.Add('VK_EREOF=F9');
vkHash.Add('VK_PLAY=FA');
vkHash.Add('VK_ZOOM=FB');
vkHash.Add('VK_NONAME=FC');
vkHash.Add('VK_PA1=FD');
vkHash.Add('VK_OEM_CLEAR=FE');
//      end;
end;

procedure intcommand;
begin
  comHash := THashedStringList.Create;
  comHash.Add('SIKeyDown=0');
  comHash.Add('SIKeyUp=1');
  comHash.Add('SIKeypress=2');
  comHash.Add('SIMouseClick=3');
  comHash.Add('SIMouseMoveTo=4');
  comHash.Add('SIMouseDoubleClick=5');
end;

function HexToInt(str:string) : word;
var
i , value : word;
pos : word;
begin
value:=0;
pos:=length(str);
for i:=1 to pos do
 begin
case str[i] of
'f','F':
value := value*16+15;
'e','E':
value := value*16+14;
'd','D':
value := value*16+13;
'c','C':
 value := value*16+12;
'b','B':
value := value*16+11;
'a','A':
value := value*16+10;
'0'..'9':
value := value*16+ord(str[i])-ord('0');
else
 result:=value;
exit;
end;
result:=value;
end;
end;


begin
  try
     if (paramstr(1)='/?') or (paramstr(1)='help') then begin
       writeln('使用方法:     ' + #10#13
       +  '按住D不放： sikeypress SIKeyDown VK_D' + #10#13
       +  '放开D：     sikeypress SIKeyUp VK_D'    + #10#13
       +  '按一下：    sikeypress SIKeypress VK_D'  + #10#13
       +  '鼠标点击：  sikeypress SIMouseClick VK_LBUTTON'  + #10#13
       +  '移动鼠标：  sikeypress SIMouseMoveTo x y 1 time ' + #10#13
       +  '鼠标双击：  sikeypress SIMouseDoubleClick VK_LBUTTON' + #10#13
       +  'VK.TXT 有很全的按键信息'+ #10#13
       );
       exitcode:=0;
       exit;
    end;

    path:=ExtractFilePath(paramstr(0));
    intcommand;
    getvk_hash;

    command:= paramstr(1);
     case comHash.IndexOfName(command) of
     //comHash.IndexOfName('SIKeyDown')
     0: begin
        SIKeyDown(HexToInt(vkHash.Values[paramstr(2)]));
     end;
     //comHash.IndexOfName('SIKeyUp')
     1: begin
        SIKeyUp(HexToInt(vkHash.Values[paramstr(2)]));
      end;
      2: begin
        SIKeyDown(HexToInt(vkHash.Values[paramstr(2)]));
        sleep(100);
        SIKeyUp(HexToInt(vkHash.Values[paramstr(2)]));
      end;
     //comHash.IndexOfName('SIMouseClick')
     3: begin
       SIMouseClick(HexToInt(vkHash.Values[paramstr(2)]),100);
      end;
     //comHash.IndexOfName('SIMouseMoveTo')
     4: begin
       SIMouseMoveTo(strtoint(paramstr(2)),strtoint(paramstr(3)),strtoint(paramstr(4)),strtoint(paramstr(5)));
      end;

     5: begin
         SIMouseClick(HexToInt(vkHash.Values[paramstr(2)]),100);
         SIMouseClick(HexToInt(vkHash.Values[paramstr(2)]),100);
     end;

     end;//SIKeyDown(HexToInt(astr));

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
