Program _E;
var
A:array [0..101,0..101] of Integer;
n,m,i,j,v:integer;
t,t1:text;
procedure obr(x,y:integer);
begin
if A[x,y-1]=2 then exit;
if A[x,y+1]=2 then exit;
if A[x-1,y]=2 then exit;
if A[x+1,y]=2 then exit;
if (A[x,y-1]=0) then begin
                       while (A[x,y-1]<>1) or (A[x,y-1]<>-2) do
                       begin
                         A[x,y-1]:=-1; dec(y); 
                       end;  inc(v); obr(x,y);
                     end;

if (A[x,y+1]=0) then begin
                       while (A[x,y+1]<>1) or (A[x,y+1]<>-2) do
                       begin
                         A[x,y+1]:=-1; inc(y);   
                       end;  inc(v); obr(x,y);
                     end; 

if (A[x-1,y]=0) then begin
                       while (A[x-1,y]<>1) or (A[x-1,y]<>-2) do
                       begin
                         A[x-1,y]:=-1; dec(x); 
                       end;  inc(v); obr(x,y);
                     end;

if (A[x+1,y]=0) then begin
                       while (A[x+1,y]<>1) or (A[x+1,y]<>-2) do
                       begin
                         A[x+1,y]:=-1; inc(x); 
                       end;  inc(v); obr(x,Y);
                     end;
end;

begin
assign(t,'input.txt');
assign(t1,'output.txt');
reset(t);
rewrite(t1);
readln(t,n,m);
for i:=0 to n+1 do
for j:=0 to m+1 do
A[i,j]:=-2;
for i:=1 to n do
begin
for j:=1 to m do
read(t,A[i,j]);
readln(t);
end;
close(t);
obr(1,1);
writeln(t1,v);
close(t1);
end.