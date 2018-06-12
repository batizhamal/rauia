Program _D;
const col1=1;
var
  inp, outp: text;
  n, m, x, y, i, j: integer; 
  A: array[1..100, 1..100] of integer;
  vis: array[1..100] of boolean;
  ability: boolean;
  color: array[1..100] of integer;
 
 
procedure DFS(v,col: integer);
var
 j: integer;
 
begin
  vis[v] := false;
  color[v] := col;  
  for j := 1 to n do
    if (A[v, j] <> 0) and vis[j] then DFS(j,col1);
end;
 
 
 
 
begin
  assign(inp, 'input.txt');
  assign(outp, 'output.txt');
  reset(inp);
  rewrite(outp);
  
  read(inp, n, m);
  
  for i := 1 to n do 
    for j := 1 to n do
     A[i, j] := 0;
  
  for i := 1 to m do
  begin
    read(inp, x, y);
    A[x, y] := 1;
    A[y, x] := 1;
  end;
  
  for i := 1 to n do
    vis[i] := true;
    
 
  
  for i := 1 to n do
    color[i] := 0;
  for i := 1 to n do  
  if vis[i]=true then
  DFS(i,1);
  
  ability := true;
  
  for i := 1 to n do
    for j := 1 to n do
      if (color[i] = color[j]) and (A[i, j] <> 0) then ability := false;
  
  if ability then 
  begin
    writeln(outp, 'YES'); 
    for i := 1 to n do
      if color[i] = 1 then begin write(outp, i,' '); writeln(outp); end;
  end
  else writeln(outp, 'NO');
   close(inp);
  close(outp);
end.