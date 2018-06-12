Program _Cbfs;
var
input,output:text;
A:array [1..3000,1..3000] of Integer;
q:array [1..10000,1..2] of Integer;
d:array [0..3001,0..3001] of Integer;
t,h,i,j,s,s1,n,m,u,v,c,c1,x1,y1:integer;
const
ox:array [1..4] of Integer=(0,0,1,-1);
oy:array [1..4] of Integer=(-1,1,0,0);
procedure push(x,y:integer);
begin
q[t,1]:=x; q[t,2]:=y;
t:=t+1;
end;

function pop:integer;
begin
pop:=q[h,1]*10+q[h,2];
h:=h+1;
end;


function empty:boolean;
var i,l:integer;
begin
if (t>h) then empty:=false else empty:=true;
end;


begin
t:=1; h:=1;
assign(input,'input.txt');
reset(input);
assign(output,'output.txt');;
rewrite(output);
readln(input,n,m);

for i:=0 to n+1 do
for j:=0 to m+1 do
d[i,j]:=-2;
    
for i:=1 to n do
for j:=1 to m do
d[i,j]:=-1;
    
for i:=1 to n do
begin
 for j:=1 to m do begin
 read(input,A[i,j]); IF (A[i,j]=1) then begin push(i,j); d[i,j]:=0; end;
 end;
readln(input);
end;
close(input);

while not empty do
begin
u:=pop;  x1:=u div 10; y1:=u mod 10;
for i:=1 to 4 do
if (d[x1+ox[i],y1+oy[i]]<>-2) and (d[x1+ox[i],y1+oy[i]]=-1) then begin d[x1+ox[i],y1+oy[i]]:=d[x1,y1]+1; push(x1+ox[i],y1+oy[i]); end;
end;

for i:=1 to n do
begin
for j:=1 to m do
write(output,d[i,j],' ');
writeln(output);
end;

close(output);
end.