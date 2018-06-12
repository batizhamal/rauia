Program _D;
const maxM=100;
var
A:array [1..maxM,1..2] of Integer;
N,M,sum,sum1,key,z,u,v,s: integer;
b: array [1..1000,0..1000] of integer;
i,j: longint;
visit:array [1..maxM] of boolean;

procedure input;
var
i:integer; t:text;
begin
assign(t,'input.txt');
reset(t);
readln(t,n,m);
for i:=1 to m do
readln(t,A[i,1],A[i,2]);
close(t);
end;

procedure output;
var i1,j1,ij: integer;
t: text;
begin
 assign(t,'output.txt');
 rewrite(t);
 for i1:=1 to sum1 do
  begin
s:=0;
for j1:=1 to b[i1,0] do
begin
for ij:=1 to m do
begin
if A[ij,1]=j1 then s:=s+1;
if A[ij,2]=j1 then s:=s+1;
end;
end;
 if (s>2) and ((s mod 2)<>0) then  begin writeln(t,'NO'); break; end else writeln(t,'YES'); 
 end;

  close(t);
end;

procedure dfs(v: longint);
 var j: longint;
 begin
  sum:=sum+1;
  b[key,0]:=sum; b[key,sum]:=v;
  visit[v]:=true;
FOR j:=1 to m do
begin
if (A[j,1]=v) and (not visit[A[j,2]]) then dfs(A[j,2]);
if (A[j,2]=v) and (not visit[A[j,1]]) then dfs(A[j,1]);
  end;
  end;


begin
input;
sum1:=0; key:=0;
 for i:=1 to n do
 if visit[i]=false then
 begin
  sum:=0; inc(key);
  sum1:=sum1+1;
  dfs(i);
  end;
 output;
end.