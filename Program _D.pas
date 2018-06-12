Program _B;
const
inf=1000001;
var
t1,t2:text;
i,j,k,n,s:longint;
w:array [1..100,1..100] of longint;
begin
assign(t1,'input.txt');
assign(t2,'output.txt');
reset(t1);
rewrite(t2);
readln(t1,n);
for i:=1 to n do begin
  for j:=1 to n do
  begin
   read(t1,w[i,j]); if w[i,j]=1 then w[i,j]:=-10 else w[i,j]:=1000000;
  end;
  readln(t1);
end;

close(t1);
for k:=1 to n do
 for i:=1 to n do
  for j:=1 to n do
    if (w[i,j] > w[i,k] + w[k,j]) then
           w[i,j] := w[i,k] + w[k,j]; 

for i:=1 to n do
  if w[i,i]<0 then inc(s);
  
if s>0 then writeln('1') else writeln('0');

{for i:=1 to n do begin
 for j:=1 to n do
 write(w[i,j],' ');
writeln; end;}

 close(t2);
end.