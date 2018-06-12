Program _B;
const
inf=1000001;
var
t1,t2:text;
i,j,k,n,max:longint;
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
   read(t1,w[i,j]); if w[i,j]=-1 then w[i,j]:=inf;
   end;
  readln(t1);
end;

close(t1);
for k:=1 to n do
 for i:=1 to n do
  for j:=1 to n do
    if (w[i,j] > w[i,k] + w[k,j]) then
           w[i,j] := w[i,k] + w[k,j]; 
 max:=-1;          
for i:=1 to n do 
 for j:=1 to n do
  if (w[i,j]>max) and (w[i,j]<>inf) then max:=w[i,j];
 writeln(t2,max);
 close(t2);
end.