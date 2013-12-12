program findword;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  BitmapData in 'BitmapData.pas';

var
str,path:string;
Bit1 : TBDBitmapData;
lastleft,lasttop:Integer;
TID:BOOLEAN;
ab,ag,ar,sum:integer;

function cmpcolor(Left,Top : Integer; Color : TBDColor; lParam : Integer): Boolean;
var
j,a:integer;
b,x,y:string;
color0,color1,color2,color3,color4:TBDColor;
thesame:boolean;
txt:textfile;
begin
     thesame:=true;
     color0:=Bit1.Pixels[left,top];
     color1:=Bit1.Pixels[left-1,top];
     color2:=Bit1.Pixels[left,top-1];
if (color0<>color2) and (color0<>color1) then begin
AssignFile(txt,path+'\'+paramstr(4));
reset(txt);
  while not Eof(txt) do
      begin
      Readln(txt,b);
          if (pos('Y',b)>0) then  begin
              a:=pos('X',b);
              j:=pos('Y',b);
              x:=copy(b,0,a-1);
              y:=copy(b,a+1,j-a-1);
              color3:=Bit1.Pixels[left+strtoint(x),top+strtoint(y)];
           if color0<>color3 then begin
           result:=true;
              exit;
           end;
          end;
          if (pos('N',b)>0) then begin
               a:=pos('X',b);
               j:=pos('N',b);
              x:=copy(b,0,a-1);
              y:=copy(b,a+1,j-a-1);
              color4:=Bit1.Pixels[left+strtoint(x),top+strtoint(y)];
              if color0=color4 then begin
              result:=true;
               exit;
              end;
          end;
        end;
        if thesame=true then begin
        tid:=true;
        lastleft:=left;
        lasttop:=top;
        sum:=sum+1;
        writeln(inttostr(sum)+'x'+inttostr(left)+'y'+inttostr(top));
end;
end;

result:=true;

end;

begin
   try
if (paramstr(1)='/?') or (paramstr(1)='help') then begin
       writeln('使用方法: findword B G R TXTFILE ' + #10#13
       +  '返回： 如果字存在则以下面格式返回数据 1x坐标Xy坐标Y' + #10#13
       +  '如果字不存在则返回 0 ' + #10#13
       +  '例子 : findword 255 255 42 xl\renwu_ji.txt'  + #10#13
       +  '本程序不支持绝对路径，请填写相对路径' + #10#13
       +  '程序会设置退出代码为匹配数 ERRORLEVEL'
       );
       exitcode:=0;
       exit;
    end;

     path:=ExtractFilePath(paramstr(0));
     ab:=strtoint(paramstr(1));
     ag:=strtoint(paramstr(2));
     ar:=strtoint(paramstr(3));
     tid:=false;
      sum:=0;
      Bit1:=TBDBitmapData.Create;
      Bit1.CopyFormScreen;
      BIT1.EnumColor(BGR(AB,AG,AR),@cmpcolor);
      if tid then begin
     exitcode:=sum;
     end else begin
       exitcode:=0;
      end;

      BIT1.Free;
        except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
