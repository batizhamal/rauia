Program _E;
var
A:array [1..100,1..100] of Integer;
vis:array [1..100,1..100] of boolean;
m,n,i,j,col:integer;
t1:text;


procedure input;
var
i,j:integer; t:text; x:char;
begin
assign(t,'input.txt');
reset(t);
readln(t,m,n);
for i:=1 to m do
begin
for j:=1 to n do
begin
read(t,x); 
IF (x='#') then A[i,j]:=-1 else A[i,j]:=0;
end;
readln(t);
end;
end;

procedure obr(i1,j1:integer);
var u,q:integer;
begin
vis[i1,j1]:=true;
A[i1,j1]:=col;
for u:=1 to m do
for q:=1 to n do
begin
if (u=i1) and (A[u,q]=-1) and (not vis[u,q]) then obr(u,q);
if (q=j1) and (A[u,q]=-1) and (not vis[u,q]) then obr(u,q);
end;
end;


begin
input;
assign(t1,'output.txt');
rewrite(t1);
col:=0;
for i:=1 to m do
for j:=1 to n do
if (A[i,j]=-1) and (not vis[i,j]) then begin inc(col); obr(i,j); end;
writeln(t1,col);
close(t1);
end. 