%N = 3;
%a = [8,7,6];
%b = [2,2,0];
%c = [1,1,0];
%[8 1 0]
%[2 7 1]
%[0 2 6]


%F = [3,5,7];
%tol = 0.001;
%Gauss_siedel(N,a,c,b,F,tol)
%A = [8,1,0;
%     2,7,1;
%     0,2,6];
%F = [3;5;7];
%x = [0;0;0];
%gauss_seidel(A,F,x,tol,N)

disp ("Digite uma opcao:")
disp ("1 - Resolver um sistema Ax = b (com matriz tridiagonal) de dimens~ao n.")
disp ("2 - Resolver o PVC para o problema A.")
disp ("3 - Resolver o PVC para o problema B.")
disp ("4 - Resolver o PVC para o problema C.")
disp ("5- Sair")
escolha = input("Escolha:");

      %A escolha do nome F ao inves de b 
      %e por conta do padrão de se usar b
      %como a subdiagonal inferior 
      %F = zeros(m-1,1);

switch (escolha)
    
    case 1
      N = input("Dimensao da matriz: ");
      a = input("Vetor Diagonal Principal: ");
      b = input("Vetor subdiagonal inferior: ");
      c = input("Vetor subdiagonal superior: ");
      F = input("Vetor b: ");
      tol = 10^-10;
      Gauss_siedel(N,a,c,b,F,tol)
    
    case 2
      disp("Problema A")
      %Dados do problema A
      m = 30;
      T0 = 20;
      TL = 100;
      tol = 10^(-10);
      
      %Calculando o h
      %DONE concertar h nos outros calculos
      h = 3/(m-1);
          
      %menos o primeiro e o ultimo
      x = [0:h:3,1]; % x tem m+1 elementos
      x = transpose(x)
      %Como a funcao a f(x) = 0 
      %a todos os valore serao nulos
      F = zeros(m-1,1);
      F(1) = -T0;   %em toda iteração da primeira linha sera subtraido T0
      F(m-1) = -TL; %em toda iteração da última linha sera subtraido TL
      
      %Matriz da discretizacao
      a = ones(m - 1,1);
      a = a*(-2);
      b = ones(m - 1,1);
      c = ones(m - 1,1);
      
      %DONE tirar t0 e tl do for
      T = Gauss_siedel (m-1, a, b, c, F, tol);
      T;
      %DONE acrescentar valores de T0 e TL
      T = [T0;T;TL];
      T
      %DONE plotar grafico plot(x,T)
      plot(x, "x" , T, "T")
      
    case 3
      disp("Problema B")
      %Dados do problema B
      m = 300;
      T0 = 0;
      TL = 100;
      tol = 10^-10;
      
      %Calculando o h
      %DONE concertar h nos outros calculos
      h = 3/(m-1);
      
      %DONE mudar valor de x
      x = 0:h:3; % x tem m+1 elementos
      %DONE concertar h nos outros fors
      F = zeros(m-1,1);
      for i = 1:(m-1)
        F(i) = (h^2)*10*sin(x(i+1)); % x só percorrer os nós internos
      endfor
      F(1) = F(1) - T0;    %em toda iteração da primeira linha sera subtraido T0
      F(m-1) = F(m-1) - TL;%em toda iteração da última linha sera subtraido TL
      
      %Matriz da discretizacao
      a = ones(m - 1,1);
      a = a*(-2);
      b = ones(m - 1,1);
      c = ones(m - 1,1);
      
      %DONE tirar t0 e tl do for
      T = Gauss_siedel (m-1, a, b, c, F, tol);
      
      %DONE acrescentar valores de T0 e TL
      T = [T0;T;TL];
    
      %DONE plotar grafico plot(x,T)
      plot(x, "-;X;", T , "-;T;")

   
   case 4
      disp("Problema C")
   
    case 5
      disp(" Progrma finalizado ")
      
  endswitch