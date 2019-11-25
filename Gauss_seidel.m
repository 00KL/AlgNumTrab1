function [x]=Gauss_seidel(N,a,b,c,F,tol)  
      disp ("\n--- G A U S S - S E I D E L ---")
      %N = dimensão
      %a = diagonal principal
      %b = subdiagonal inferior
      %c = subdiagonal superior
      %F = Resposta (é o b de Ax = b) mas como normalmente b se refere 
      %a subdiagnoal inferior descidi chamar de F nesse caso
      %tol = precisão da solução 
  
      x = zeros(N, 1);
      x0 = zeros(N, 1); %inicializa vetores
      erro = 9; %inicializa erros
      itera = 0;
      
      while(tol <= erro )
            x0 = x;
            x(1) = F(1) - c(1)*x(2);
            x(1) = x(1)/a(1); % A primeira iteração não segue o padrão por consultar
                               % apenas o primeiro valor de a(diagnoal principal)
                               % e o primeiro valor de c(subdiagonal superior)
            for i = 2:(N-1)
                  x(i) = F(i) - c(i)*x(i+1) - b(i-1)*x(i-1);
                  x(i) = x(i)/a(i);
            endfor
            
            x(N) = F(N) - b(N-1)*x(N-1);% A última iteração não segue o padrão por consultar
                                    % apenas o último valor de a(diagnoal principal)
                                    % e o último valor de b(subdiagonal inferior)
            x(N) = x(N)/a(N);
            %x
            
            itera++;    
            erro = norm(x - x0, inf) / norm(x, inf); %norm -> ||x-x0||
            %erro                                    %inf  -> tipo de norma
     endwhile                                        %er   -> vetor de erros
     fprintf("A solu��o obtida por GAUSS SEIDEL, com tol = %i, apos %i iteracoes eh\n", tol, itera)
     fprintf("%.2f ", x)
     
     fprintf("\nA distancia relativa entre os ultimos vetores gerados eh de %.10f", erro)
     disp("\n==================================")
     
endfunction