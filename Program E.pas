Program _E;
var
t,t1:text;   
D:array [1..100,1..100] of Integer;  //A-лабиринт, D-ходы
A:array [0..101,0..101] of Integer;
Q:array [1..100,1..2] of Integer; //очередь
used:array [1..100,1..100] of boolean;
N,M,Qstart,Qend,u,uu,v,vv,i,j:integer;
begin
assign(t,'input.txt');
assign(t1,'output.txt');
reset(t);
rewrite(t1);
 readln(t,n,m);
 for i:=1 to n do
 begin
 for j:=1 to m do
 read(t,A[i,j]);
 readln(t);
 end;
 
 
 for i:=0 to n+1 do
 begin
 A[i,0]:=-1;  A[i,m+1]:=-1;
 end;
 
 for i:=0 to m+1 do
 begin
 A[0,i]:=-1; A[n+1,i]:=-1;
 end;
 
 close(t);
    Q[1,1]:=1; Q[1,2]:=1;
    Qstart:=1; Qend:=2;
    
    while qstart<qend do
    begin
    uu:=q[qstart,1]; vv:=q[qstart,2];  used[uu,vv]:=true;
    inc(qstart);
           {вправо} u:=uu; v:=vv;
           while (v+1<m+1) and (A[u,v+1]=0)  do
           inc(v);
            if (A[u,v+1]=2) and (not used[u,v]) then begin D[u,v]:=D[uu,vv]+1; writeln(t1,D[u,v]);  break; end;
            if (A[u,v+1]=1) and (not used[u,v]) then begin D[u,v]:=D[uu,vv]+1; q[qend,1]:=u; q[qend,2]:=v; inc(qend); end;
            if (A[u,v+1]=-1) and (not used[u,v]) then begin D[u,v]:=D[uu,vv]+1; q[qend,1]:=u; q[qend,2]:=v; inc(qend); end;
            
               {вниз} u:=uu; v:=vv;
           while (u+1<n+1) and (A[u+1,v]=0)  do
           inc(u);
            if (A[u+1,v]=2) and (not used[u,v]) then begin D[u,v]:=D[uu,vv]+1; writeln(t1,D[u,v]);  break; end;
            if (A[u+1,v]=1) and (not used[u,v]) then begin D[u,v]:=D[uu,vv]+1; q[qend,1]:=u; q[qend,2]:=v; inc(qend); end; 
            if (A[u+1,v]=-1) and (not used[u,v]) then begin D[u,v]:=D[uu,vv]+1; q[qend,1]:=u; q[qend,2]:=v; inc(qend); end;
            
             {влево} u:=uu; v:=vv;
           while (v-1>0) and (A[u,v-1]=0) do
           dec(v);
            if (A[u,v-1]=2) and (not used[u,v]) then begin D[u,v]:=D[uu,vv]+1; writeln(t1,D[u,v]);  break; end;
            if (A[u,v-1]=1) and (not used[u,v]) then begin D[u,v]:=D[uu,vv]+1; q[qend,1]:=u; q[qend,2]:=v; inc(qend); end; 
            if (A[u,v-1]=-1) and (not used[u,v]) then begin D[u,v]:=D[uu,vv]+1; q[qend,1]:=u; q[qend,2]:=v; inc(qend); end;
            
             {вверх} u:=uu; v:=vv;
           while (u-1>0) and (A[u-1,v]=0) do
           dec(u);
            if (A[u-1,v]=2) and (not used[u,v]) then begin D[u,v]:=D[uu,vv]+1; writeln(t1,D[u,v]);  break; end;
            if (A[u-1,v]=1) and (not used[u,v]) then begin D[u,v]:=D[uu,vv]+1; q[qend,1]:=u; q[qend,2]:=v; inc(qend); end; 
            if (A[u-1,v]=-1) and (not used[u,v]) then begin D[u,v]:=D[uu,vv]+1; q[qend,1]:=u; q[qend,2]:=v; inc(qend); end;
    end;
     
     for i:=1 to n do
     begin
     for j:=1 to m do
     write(d[i,j],' ');
     writeln;
     end;
   close(t1);
   

end.