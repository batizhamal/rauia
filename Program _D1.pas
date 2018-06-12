 program _B;
 const
n1=20;
ox:array[1..8] of integer=(2,2,-2,-2,1,1,-1,-1);
oy:array[1..8] of integer=(-1,1,-1,1,2,-2,2,-2);

var
t,t1:text;
a,b:array[-1..n1+2,-1..n1+2] of integer;
q1,q2:array [1..64,1..2] of Integer; z:string;
i,j,x1,y1,x2,y2,Q1start, Q2start, Q1end, Q2end,u1,u2:integer;
begin
assign(t,'input.txt');
reset(t);
assign(t1,'output.txt');
rewrite(t1);
readln(t,z);      close(t);            //читаем
if copy(z,1,1)='a' then x1:=1; 
if copy(z,1,1)='b' then x1:=2;                  
if copy(z,1,1)='c' then x1:=3; 
if copy(z,1,1)='d' then x1:=4; 
if copy(z,1,1)='e' then x1:=5; 
if copy(z,1,1)='f' then x1:=6; 
if copy(z,1,1)='g' then x1:=7; 
if copy(z,1,1)='h' then x1:=8; 
  y1:=strtoint(copy(z,2,1));
  
if copy(z,4,1)='a' then x2:=1; 
if copy(z,4,1)='b' then x2:=2; 
if copy(z,4,1)='c' then x2:=3; 
if copy(z,4,1)='d' then x2:=4; 
if copy(z,4,1)='e' then x2:=5; 
if copy(z,4,1)='f' then x2:=6; 
if copy(z,4,1)='g' then x2:=7; 
if copy(z,4,1)='h' then x2:=8; 
  y2:=strtoint(copy(z,5,1));
  
  
for i:=-1 to 10 do
for j:=-1 to 10 do
begin
a[i,j]:=-1; b[i,j]:=-1; end;
for i:=1 to 8 do
for j:=1 to 8 do
begin
a[i,j]:=0; b[i,j]:=0; end;

Q1[1,1]:=x1;
Q1[1,2]:=y1;
Q2[1,1]:=x2;
Q2[1,2]:=y2;
Q1end:=2; Q2end:=2;
Q1start:=1; Q2start:=1;

while Q1start<Q1end do
begin
 u1:=Q1[Q1start,1]; u2:=Q1[Q1start,2];
     for i:=1 to 8 do
     begin
        if (a[u1+ox[i],u2+oy[i]] = 0) then
      begin
        a[u1+ox[i],u2+oy[i]] := a[u1,u2] + 1;
        Q1[Q1end,1] := u1+ox[i];
        Q1[Q1end,2] := u2+oy[i];
        inc(Q1end);
      end; 
     end;
end;

while Q2start<Q2end do
begin
 u1:=Q2[Q2start,1]; u2:=Q2[Q2start,2];
     for i:=1 to 8 do
     begin
        if (b[u1+ox[i],u2+oy[i]] = 0) then
      begin
        b[u1+ox[i],u2+oy[i]] := b[u1,u2] + 1;
        Q2[Q2end,1] := u1+ox[i];
        Q2[Q2end,2] := u2+oy[i];
        inc(Q2end);
      end; 
     end;
end;

for i:=1 to 8 do
for j:=1 to 8 do
if a[i,j]=b[i,j] then writeln(t1,a[i,j]);
close(t1); end. 