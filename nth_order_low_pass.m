function [ n_lowpass ] = nth_order_low_pass( input_freq, order )

 n = order;
 fL = input_freq;

 
 
 


%////////////////////////////////////////////////////////////////////////// 
                  %Chebyshev Coefficient Table 3 dB filter Design
%//////////////////////////////////////////////////////////////////////////
 g1 = [1.9953 1.00];
 g2 = [3.1013 0.5339 5.8095];
 g3 = [3.3487 0.7117 3.3487 1.00];
 g4 = [3.4389 0.7483 4.3471 0.5920 5.8095];
 g5 = [3.4817 0.7618 4.5381 0.7618 3.4817 1.000];
 g6 = [3.5045 0.7685 4.6061 0.7929 4.4641 0.6033 5.8095];
 g7 = [3.5182 0.7723 4.6386 0.8039 4.6386 0.7723 3.5182 1.000];
 g8 = [3.5277 0.7745 4.6575 0.8089 4.6990 0.8018 4.4990 0.6073 5.8095];
 g9 = [3.534 0.7760 4.6692 0.8118 4.7272 0.8118 4.6692 0.7760 3.5340 1.000];
 g10 =[3.5384 0.7771 4.6768 0.8136 4.7425 0.8164 4.7260 0.8051 4.5142 0.6091 5.8095];
%////////////////////////////////////////////////////////////////////////// 

%//////////////////////////////////////////////////////////////////////////

if n == 1
      cheby_coeff = g1;
end

if n ==2 
      cheby_coeff = g2;
end
 if n ==3 
      cheby_coeff = g3;
 end
 if n ==4 
      cheby_coeff = g4;
 end
 if n ==5 
      cheby_coeff = g5;
 end
 if n ==6
      cheby_coeff = g6;
 end
 if n == 7 
      cheby_coeff = g7;
 end
 if n == 8 
      cheby_coeff = g8;
 end
 if n == 9 
      cheby_coeff = g9;
 end
 if n ==10 
      cheby_coeff = g10;
 end
    
    
   
    
 counter = 1;
 
while (counter <= length(cheby_coeff))
    
    L = (cheby_coeff(counter) * 50)/(fL * 2* pi) ;
    C = (cheby_coeff(counter))/(50* fL * 2* pi) ;

    if mod(counter, 2) == 0 
        % x is even
          fprintf('Shunt Capacitor  %.15f\n', C); 
    else
        % x is odd
   fprintf('Series Inductor  %.15f\n', L); 
    end
counter=counter+1;

    
end
end
    

