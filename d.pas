program _d;
var
n,m,i,j,k,s:integer;  A:array [1..100,1..2] of Integer; t1:text;
color:array [1..100] of Integer;
procedure input;
var 
t:text; i,x,y:integer;
begin
assign(t,'input.txt');
reset(t);
readln(t,n,m);
for i:=1 to m do
readln(t,A[i,1],A[i,2]);
close(t);
end;

procedure dfs(v:integer);
var i,j:integer;
begin
color[v]:=k;
for j:=1 to m do
begin
if A[j,1]=v then begin inc(k); dfs(A[j,2]); end;
if A[j,2]=v then begin inc(k); dfs(A[j,1]); end;
end;
end;


begin
input;
assign(t1,'output.txt');
rewrite(t1);
for i:=1 to n do
color[i]:=1;
k:=1;
dfs(1);
for i:=1 to n do
begin
for j:=1 to m do
begin
if (A[j,1]=i) and (color[A[j,1]]=color[A[j,2]]) then s:=s+1;
if (A[j,2]=i) and (color[A[j,1]]=color[A[j,2]]) then s:=s+1;
end;
end;
if s=0 then begin
           writeln(t1,'YES'); writeln(t1);
           for i:=1 to n do
           if color[i]=1 then write(t1,i,' ');
           end;
close(t1);
end.