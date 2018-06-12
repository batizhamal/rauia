 Program _C;
      var
      n,m,x,y,i:integer; t1:text;
      A:array [1..100,1..100] of Integer;    str:string;

   procedure input;
 var i:integer; t:text;
begin
assign(t,'input.txt');
reset(t);
readln(t,n,m);
for i:=1 to m do
begin
readln(t,x,y); IF A[y,x]=1 then begin str:='No'; exit; end;
A[x,y]:=1;
end; 
close(t);
str:='Yes';
end;

      begin
      input; 
      assign(t1,'output.txt');
      rewrite(t1);
      writeln(t1,str);
      close(t1);

      end.

  