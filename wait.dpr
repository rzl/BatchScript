program wait;

{$APPTYPE CONSOLE}

uses
  SysUtils;

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    sleep(strtoint(paramstr(1)));
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
