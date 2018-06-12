const
  maxn = 100;
  infinity = 10000;

var
  i,j,u,v,n,min,s,t,x:longint;
  e,w:array[1..maxn,1..maxn]of longint;
  ne,use,p,d:array[1..maxn]of longint;

t1,t2:text;

begin
assign(t1,'input.txt');
assign(t2,'output.txt');
reset(t1);
rewrite(t2);
  read(t1,n,t,s);
  for i:=1 to n do begin
   for j:=1 to n do begin
    read(t1,x);
    if (x<>0) and (x<>-1) then begin 
    inc(ne[j]); e[j,ne[j]]:=i; //edges are inverted
    w[j,i]:=x;
     end;
    end;
  end;
  for i:=1 to n do d[i]:=infinity;
  d[s]:=0;
  for i:=1 to n do begin
    min:=infinity;
    for j:=1 to n do if (use[j]=0)and(d[j]<min) then begin
      min:=d[j]; u:=j;
    end;
    use[u]:=1;
    for j:=1 to ne[u] do begin
      v:=e[u,j];
      if d[v]>d[u]+w[u,v] then begin
        d[v]:=d[u]+w[u,v]; p[v]:=u;
      end;
    end;
  end;
  if (d[t]<>infinity) then  writeln(t2,d[t]) else writeln(t2,'-1');

  
  {u:=t; write(t2,u);
  while u<>s do begin
    u:=p[u]; write(t2,' ',u);
  end;}
  
  close(t1);
 close(t2);
end.