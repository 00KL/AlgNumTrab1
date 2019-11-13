%N = 3;
%v1 = [8,7,6];
%v2 = [1,1,0];
%v3 = [2,2,0];
%[8 1 0]
%[2 7 1]
%[0 2 6]


%b = [3,5,7];
%tol = 0.001;
%Gauss_siedel(N,v1,v2,v3,b,tol)
%A = [8,1,0;
%     2,7,1;
%     0,2,6];
%b = [3;5;7];
%x = [0;0;0];
%gauss_seidel(A,b,x,tol,N)

disp ("Digite uma opção:")
disp ("1 - Resolver um sistema Ax = b (com matriz tridiagonal) de dimens~ao n.")
disp ("2 - Resolver o PVC para o problema A.")
disp ("3 - Resolver o PVC para o problema B.")
disp ("4 - Resolver o PVC para o problema C.")
disp ("5- Sair")
escolha = input("Escolha:");

switch (escolha)
    
    case 1
      N = input("Dimensão da matriz: ");
      v1 = input("Vetor Diagonal Principal: ");
      v2 = input("Vetor subdiagonal superior: ");
      v3 = input("Vetor subdiagonal inferior: ");
      b = input("Vetor b: ");
      tol = 10^-10;
      Gauss_siedel(N,v1,v2,v3,b,tol)
    
    case 2
      disp("Problema A")
      %Dados do problema A
      m = 30;
      T0 = 20;
      TL = 100;
      tol = 10^-10;
      
      %como f(x) = 0 não é necessário
      %calcular h, pois h iria somente 
      %multiplicar os valores f(xi)
      
      %Como a função é f(x) = 0 
      %a todos os valore serão nulos
      %menos o primeiro e o último
      b = zeros(m,1);
      b(1) = -T0;
      b(m+1) = -TL;
      
      %Matriz da discretização
      v1 = ones(m - 1,1);
      v1 = v1*(-2);
      v2 = ones(m - 1,1);
      v3 = ones(m - 1,1);
      
      Gauss_siedel (m-1, v1, v2, v3, b, tol,0,0)
      
    case 3
      disp("Problema B")
      %Dados do problema A
      m = 30;
      T0 = 20;
      TL = 100;
      tol = 10^-10;
      
      %como f(x) = 0 não é necessário
      %calcular h, pois h iria somente 
      %multiplicar os valores f(xi)
      
      %Como a função é f(x) = 0 
      %a todos os valore serão nulos
      %menos o primeiro e o último
      b = zeros(m-1,1);
      
      %Matriz da discretização
      v1 = ones(m - 1,1);
      v1 = v1*(-2);
      v2 = ones(m - 1,1);
      v3 = ones(m - 1,1);
      
      Gauss_siedel (m-1, v1, v2, v3, b, tol,T0,TL)
   
   case 4
      disp("Problema C")
      %Dados do problema A
      m = 300;
      T0 = 20;
      TL = 100;
      tol = 10^-10;
      
      %Calculando o h
      h = (TL - T0)/(m-1);
      
      %Como a função é f(x) = 0 
      %a todos os valore serão nulos
      %menos o primeiro e o último
      b = zeros(m-1,1);
      for i = 1:(m-1)
        b(i) = (h^2)*10*sin(i);
      endfor
      
      %Matriz da discretização
      v1 = ones(m - 1,1);
      v1 = v1*(-2);
      v2 = ones(m - 1,1);
      v3 = ones(m - 1,1);
      
      Gauss_siedel (m-1, v1, v2, v3, b, tol,T0,TL)
    case 5
      disp(" Progrma finalizado ")
      disp("Problema C")
      %Dados do problema A
      m = 25;
      T0 = 2;
      TL = 10;
      tol = 10^-10;
      
      %Calculando o h
      h = (TL - T0)/(m-1);
      
      %Como a função é f(x) = 0 
      %a todos os valore serão nulos
      %menos o primeiro e o último
      b = zeros(m-1,1);
      for i = 1:(m-1)
        b(i) = (h^2)*(i^2);
      endfor
      
      %Matriz da discretização
      v1 = ones(m - 1,1);
      v1 = v1*(-2);
      v2 = ones(m - 1,1);
      v3 = ones(m - 1,1);
      
      Gauss_siedel (m-1, v1, v2, v3, b, tol,T0,TL)
  endswitch