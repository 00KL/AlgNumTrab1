
function [q]=funcaofontecalor(escolha)
      %A escolha do nome F ao inves de b 
      %e por conta do padrÃ£o de se usar b
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
      Gauss_seidel(N,a,c,b,F,tol)
    
    case 2
      disp("Problema 2A")
      disp("Resolvendo o PVC")
      disp("Resolvendo para dominio de x=0 a L=3")
      disp("Divisao do dominio (m) 30")
      %Dados do problema A
      m = 30;
      T0 = 20;
      TL = 100;
      tol = 10^(-10);
      
      %Calculando o h
      h = 3/m;
      fprintf("Para a uma discretezacao em  m=30 subint. os pontos internos sao: ")
      h
      
      x = [0:h:3]; % x tem m+1 elementos
      interx = x(2:(end-1)); %para printar os valores internos essa linha retira o primeiro e o ultimo elemento
      fprintf("Para a uma discretezacao em  m=30 subint. os pontos internos sao: ")
      fprintf("%.2f ",interx)
      
      %gerando F com os valores de x aplicados na função dada
      F = zeros(m-1,1);%Como a funcao a f(x) = 0 a todos os valore serao nulos
      F(1) = -T0;   %em toda iteracao da primeira linha sera subtraido T0
      F(m-1) = -TL; %em toda iteracao da ultima linha sera subtraido TL
      
      %Matriz da discretizacao
      a = ones(m - 1,1);
      a = a*(-2);
      b = ones(m - 1,1);
      c = ones(m - 1,1);
      
      %Chama funcao Gauss_seidel
      T = Gauss_seidel (m-1, a, b, c, F, tol);
      T = [T0;T;TL];%acrescentar valores de T0 e TL
      
      %Plota gráfico
      plot(x,T,'k',x,T,'ro')
      title('Grafico das temperaturas')
      xlabel('Dominio Discretizado')
      ylabel('Temperaturas')
      
    case 3
      disp("Problema B")
      disp("Resolvendo o PVC")
      disp("Resolvendo para dominio de x=0 a L=3")
      disp("Divisao do dominio (m) 300")
      %Dados do problema B
      m = 300;
      T0 = 0;
      TL = 100;
      tol = 10^-10;
      
      %Calculando o h
      h = 3/m;
      fprintf("Para a uma discretezacao em  m=300 subint. os pontos internos sao: ")
      h
      %gerando vetor pontos internos em x
      x = [0:h:3]; % x tem m+1 elementos
      interx = x(2:(end-1)); %para printar os valores internos essa linha retira o primeiro e o ultimo elemento
      fprintf("Para a uma discretezacao em  m=300 subint. os pontos internos sao: ")
      fprintf("%.2f ",interx) 
      
      %gerando F com os valores de x aplicados na função dada
      F = (h^2)*(10)*(sin(x)); %aplicando a funcao no vetor
      F(1) = F(1) - T0;    %em toda iteracao da primeira linha sera subtraido T0
      F(m-1) = F(m-1) - TL;%em toda iteracao da ultima linha sera subtraido TL
      
      %Matriz da discretizacao
      a = ones(m - 1,1);
      a = a*(-2);
      b = ones(m - 1,1);
      c = ones(m - 1,1);
      
      %Chama funcao Gauss_seidel
      T = Gauss_seidel (m-1, a, b, c, F, tol);      
      T = [T0;T;TL];%Acrescenta os valores T0 e TL que já estavam estabelecidos
      
      %Plota gráfico
      plot(x,T,'k',x,T,'ro')
      title('Grafico das temperaturas')
      xlabel('Dominio Discretizado')
      ylabel('Temperaturas')

    case 4
      disp("Problema C")
      
      %Dados do problema C
      m = 10;
      T0 = 20;
      TL = 70;
      tol = 10^-7;
      
      %Calculando o h
      h = 3/m;
      
      %gerando vetor pontos internos em x
      x = [0:h:3]; % x tem m+1 elementos
      
      %gerando F com os valores de x aplicados na função dada
      F = (h^2)*(10)*(cos(x)); %aplicando a funcao no vetor
      F(1) = F(1) - T0;    %em toda iteracao da primeira linha sera subtraido T0
      F(m-1) = F(m-1) - TL;%em toda iteracao da ultima linha sera subtraido TL
      
      %Matriz da discretizacao
      a = ones(m - 1,1);
      a = a*(-2);
      b = ones(m - 1,1);
      c = ones(m - 1,1);
      
      %Chama funcao Gauss_seidel
      T = Gauss_seidel (m-1, a, b, c, F, tol);      
      T = [T0;T;TL];%Acrescenta os valores T0 e TL que já estavam estabelecidos

      %Plota gráfico
      plot(x,T,'k',x,T,'ro')
      title('Grafico das temperaturas')
      xlabel('Dominio Discretizado')
      ylabel('Temperaturas')
   
    case 5
     disp(" Programa finalizado ")
        
  endswitch
endfunction
