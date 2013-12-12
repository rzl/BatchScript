program settop;

{$APPTYPE CONSOLE}

uses
  SysUtils,Windows;
var
  p: array[0..254] of Char;
   h: HWND;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    h := GetForegroundWindow;
   GetWindowText(h, p, 255);
   if pos('ÏÉÁé',p)>0 then begin
   SetWindowPos(h, 0, 0,0, 816,638, SWP_SHOWWINDOW);
       if (paramstr(1)<>'') then ExitCode:=0;;
   end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
