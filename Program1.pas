    program esepB;
    var
    a: array [1..10000,1..2] of longint;
    b: array [1..10000,0..10000] of longint;
    visit: array[1..10000] of boolean;
    N,M,sum,sum1,key,z: longint;
    i: longint;
     
    procedure input;
    var t:text;
    j: integer;
    begin
     assign(t,'input.txt');
     reset(t);
     readln(t,N,M);
     for j:=1 to n do
     visit[j]:=false;
     for j:=1 to m do
     begin
     readln(t,a[j,1],a[j,2]);
      end;
     close(t);
    end;
     
    procedure output;
    var i1,j1: longint;
    t: text;
    begin
     assign(t,'output.txt');
     rewrite(t);
     writeln(t,sum1);
     for i1:=1 to sum1 do
      begin
      writeln(t,b[i1,0]);
      for j1:=1 to b[i1,0] do
        write(t,b[i1,j1],' ');
      writeln(t);
      end;
      close(t);
    end;
     
     
     procedure DFS(v: longint);
     var j: longint;
     begin
     
      sum:=sum+1;
      b[sum1,0]:=sum; b[sum1,sum]:=v;
      visit[v]:=true;
      for j:=1 to m do
      if (v=a[j,1]) and (visit[a[j,2]]=false) then DFS(a[j,2]) else
      if (v=a[j,2]) and (visit[a[j,1]]=false) then DFS(a[j,1])
      end;
    begin
    input;
    sum1:=0; key:=0;
     for i:=1 to n do
     if visit[i]=false then
     begin
      sum:=0; inc(sum1);
      DFS(i);
      end;
     
     output;
     
     
     
     
     
    end.
