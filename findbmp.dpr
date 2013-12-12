program findbmp;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  BitmapData in 'BitmapData.pas';

  var
  Bit1,Bit2 : TBDBitmapData;
  Range : TBDColorRange;
  imgsum,left,top:integer;
  bmppath,path:string;

function cmpimg(Left,Top : Integer; Bmp : TBDBitmapData; lParam : Integer): Boolean;
begin
    imgsum:=imgsum+1;
     writeln(inttostr(imgsum)+'x'+inttostr(left)+'y'+inttostr(top));
     result:=true;
end;

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    if (paramstr(1)='/?') or (paramstr(1)='help') then begin
       writeln('使用方法: findbmp bmppath ' + #10#13
       +  '返回： 如果图片存在则以下面格式返回数据 1x坐标Xy坐标Y' + #10#13
       +  '如果图片不存在则返回 0 ' + #10#13
       +  '例子 : findbmp xk\pack800.bmp'  + #10#13
       +  '本程序不支持绝对路径，请填写相对路径' + #10#13
       +  '程序会设置退出代码为匹配数 ERRORLEVEL'
       );
       exitcode:=0;
       exit;
    end;

    path:=ExtractFilePath(paramstr(0));
    bmppath:=path+ '\' + string(paramstr(1));
    imgsum:=0;
    left:=0;
    top:=0;
    Range.R:=5;
    Range.G:=5;
    Range.B:=5;
    Bit1:=TBDBitmapData.Create;
    Bit2:=TBDBitmapData.Create;
    Bit1.CopyFormScreen;
    Bit2.LoadFromFile(bmppath);
    Bit1.EnumImage(Bit2,range,@cmpimg);
    //Writeln(imgsum);
    exitcode:=imgsum;
    Bit1.Free ;
    Bit2.Free;
    halt;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
