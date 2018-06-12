   Program _C;
      var
      n,n1,s,c,p,i,j:integer; t1:text;
      A:array [1..100,1..100] of Integer;    

   procedure input;
 var i,j:integer; t:text;
begin
assign(t,'input.txt');
reset(t);
readln(t,n);
for i:=1 to n do
begin
for j:=1 to n do
read(t,A[i,j]);
readln(t);
end; 
close(t);
end;

      begin
      input; if (n=0) then writeln('NO');
    assign(t1,'output.txt');
    rewrite(t1);
      for i:=1 to n do
      begin
      s:=0;
     for j:=1 to n do
     s:=s+A[i,j];
     if (s<>0) then inc(n1);
      end;
      for i:=1 to n do
      begin
     for j:=1 to n do
     if A[i,j]=1 then begin inc(c); A[j,i]:=0; end;
      end;
   if (n1=n) and (c=n-1) then writeln(t1,'YES') else writeln(t1,'NO');
close(t1);

      end.

  