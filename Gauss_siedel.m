function [x]=Gauss_siedel(N,v1,v2,v3,b,tol,T0,TL)  
      %N = dimensão
      %v1 = diagonal principal
      %v2 = subdiagonal superior
      %v3 = subdiagonal inferior
      %b = termos independentes
      %tol = precisão da solução 
  
      x = zeros(N, 1);
      x0 = zeros(N, 1); %inicializa vetores
      erro = 9; %inicializa erros
      
      
      while(tol <= erro )
            x0 = x;
            x(1) = b(1) - v2(1)*x(2) - T0;
            x(1) = x(1)/v1(1); % A primeira iteração não segue o padrão por consultar
                               % apenas o primeiro valor de v1(diagnoal principal)
                               % e o primeiro valor de v2(subdiagonal superior)
            for i = 2:(N-1)
                  x(i) = b(i) - v2(i)*x(i+1) - v3(i-1)*x(i-1);
                  x(i) = x(i)/v1(i);% A primeira iteração não segue o padrão por consultar
                                    % apenas o último valor de v1(diagnoal principal)
                                    % e o último valor de v2(subdiagonal superior)
            endfor
            
            x(N) = b(N) - v3(N-1)*x(N-1) - TL;
            x(N) = x(N)/v1(N);
            
            erro = norm(x - x0, inf) / norm(x, inf); %norm -> ||x-x0||
            erro;                                         %inf  -> tipo de norma
     endwhile                                        %er   -> vetor de erros
endfunction