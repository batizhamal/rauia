var
  t1: text;
  Q: array[1..10000,1..2] of integer;
  a, D: array[0..2000, 0..2000] of integer;  
  i, j, n, m, Qstart, Qend: integer;
  start: array[1..2] of integer;
  u1,u2:integer;
begin
  {считываем исходные данные:
  количество вершин графа,
  матрицу смежности,
  номера стартовой и конечной вершины}
  assign(t1,'input.txt');
  reset(t1);
  readln(t1,n,m);   u1:=1;
  for i := 1 to n do
  begin
    for j := 1 to m do
     begin
      D[i,j] := -1;
      read(t1,a[i, j]);
      if a[i, j]=1 then begin q[u1,1]:=i; q[u1,2]:=j; inc(u1); end;
     end;
   readln(t1);
  end;
 
  start[1]:= q[1,1];
  start[2]:= q[1,2];
  close(t1);
  for i:=0 to n do
   begin
    a[i,0]:=-2;
    a[i,m+1]:=-2;
   end;
  for i:=0 to m+1 do
   begin
    a[0,i]:=-2;
    a[n+1,i]:=-2;
   end;
  {заполняем массив длин D}
  {for i := 1 to n do
    for j:=1 to m do
    begin
    D[i] := -1;
    prev[i]:=-1;
    end;}
  {расстояние от старта до старта равно нулю}  
  for i:=1 to u1-1 do
    D[q[i,1],q[i,2]] := 0;
  {кладем стартовую вершину в очередь.
  В очереди Q индекс Qstart - номер первого элемента очереди, Qend - номер ячейки после последнего элемента}
  Qstart := 1;
  Qend := u1;
  {Пока очередь не пуста, то есть, там есть хотя бы один элемент, то есть Qstart и Qend отличаются хотя бы на 1}
  while Qstart < Qend do
  begin
    u1 := Q[Qstart,1];//забираем первую вершину из очереди
    u2 := Q[Qstart,2];
    inc(Qstart); //передвигаем индекс первого элемента очереди
    {перебираем все вершины графа}
    if (a[u1,u2+1] = 0) and (d[u1,u2+1] = -1) {and used[u1,u2+1]=False }then
      begin
        d[u1,u2+1] := d[u1,u2] + 1;
        Q[Qend,1] := u1;
        Q[Qend,2] := u2+1;
       { Prev[u[1]+1,u[2]+1]:=u[1];}
        inc(Qend);
      end;
    if (a[u1,u2-1] = 0) and (d[u1,u2-1] = -1) {and used[u1,u2-1]=False} then
      begin
        d[u1,u2-1] := d[u1,u2]+1;
        Q[Qend,1] := u1;
        Q[Qend,2] := u2-1;
       { Prev[u[1]+1,u[2]+1]:=u[1];}
        inc(Qend);
       
      end;
    if (a[u1-1, u2] = 0) and (d[u1-1,u2] = -1) {and used[u1-1,u2]=False} then
      begin
        d[u1-1,u2] := d[u1,u2] + 1;
        Q[Qend,1] := u1-1;
        Q[Qend,2] := u2;
       { Prev[u[1]+1,u[2]+1]:=u[1];}
        inc(Qend);
       
      end;
    if (a[u1+1, u2] = 0) and (d[u1+1,u2] = -1) {and used[u1+1,u2]=False} then
      begin
        d[u1+1,u2] := d[u1,u2] + 1;
        Q[Qend,1] := u1+1;
        Q[Qend,2] := u2;
       { Prev[u[1]+1,u[2]+1]:=u[1];}
        inc(Qend);
     
      end;
  end;
  {writeln(d[finish]);
  if d[finish]>0 then  
  begin
  tmp := finish;
  i := 1;
  while tmp <> -1 do
  begin
    ans[i] := tmp;
    inc(i);
    tmp := Prev[tmp];
  end;
  for j := i - 1 downto 1 do
    write(ans[j], ' ');
   end;}
for i:=1 to n do
  begin
  for j:=1 to m do
   write(D[i,j],' ');
   writeln;
  end;
end.