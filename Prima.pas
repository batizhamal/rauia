//(C) Igor Kvasov
const
  maxn = 100;
  infinity = 1000000;

var
  i,j,u,v,n,m,c,min:longint;
  e,w:array[1..maxn,1..maxn]of longint;
  ne,use,p,key:array[1..maxn]of longint;

//��������� ����������
//e - ������ �������������; e[i] - ������ ������� ������ ������� i
//ne[i] - ���������� ������, ����������� i-�� �������
//w[i,j] - ��� �����, ������������ ������� i � j
//use - ��������� ������, ��� �������� � ������� ����������� ����������� ������
//key[i] - ���������� ������� �� �������� ������������ ������������ ������
//p[i] - �������� i-�� ������� � ����������� ����������� ����������� ������

begin
  read(n,m);
  for i:=1 to m do begin
    read(u,v,c);
    inc(ne[u]); e[u,ne[u]]:=v;
    inc(ne[v]); e[v,ne[v]]:=u;
    w[u,v]:=c; w[v,u]:=c;
  end;
  for i:=1 to n do key[i]:=infinity;
  key[1]:=0;
 
 
 for i:=1 to n do begin
    min:=infinity;
    for j:=1 to n do if (use[j]=0)and(key[j]<min) then begin
      min:=key[j]; u:=j;
    end;
    use[u]:=1;
    for j:=1 to ne[u] do
    begin  
       v:=e[u,j];
       if (use[v]=0)and(w[u,v]<key[v]) then begin
          p[v]:=u; key[v]:=w[u,v];
       end;
    end;
  end;
  
  for i:=2 to n do writeln(i,' ',p[i]);
 end.