seq1=input('(Enter Uppercase) Enter First DNA Sequence : ', 's');
try
    k = 1;
    while( true )
        seq1(k);
        k = k + 1;
    end
catch
    seq1Length = k - 1;
end  % Getting length of Sequence 01. (%l = strlength(seq1))

seq2 =input('(Enter Uppercase) Enter Second DNA Sequence : ', 's');
try
    k = 1;
    while( true )
        seq2(k);
        k = k + 1;
    end
catch
    seq2Length = k - 1;
end  % Getting length of Sequence 02.

match =input("match value : ");
mismatch =input("mismatch value : ");
gap =input("gap value : ");

Mtx1 = zeros(seq2Length+2,seq1Length+2);% create matrix with zeros before entering
Mtx2 = zeros(seq2Length+2,seq1Length+2);%matrix to vector values

norRow=0;
for b = 2:(seq1Length+2)
	Mtx1(2,b)=norRow;
   	norRow = norRow+gap;
end % Assign gap value at Start Row

norColumn=0;
for a = 2:(seq2Length+2)
	Mtx1(a,2)=norColumn;
   	norColumn = norColumn+gap;
end % Assign gap value at Start Column

for a = 3:(seq1Length+2)
	Mtx1(1,a)=char(seq1(a-2)); %Assign Sequence 01 Letters to Matrix
end

for b = 3:(seq2Length+2)
	Mtx1(b,1)=char(seq2(b-2)); %Assign Sequence 02 Letters to Matrix
end

for m = 3:(seq2Length+2)
   for n = 3:(seq1Length+2)
   	  	if(Mtx1(m,1)==Mtx1(1,n))
           MatchOrNot=match;
   	    else
           MatchOrNot=mismatch;
   	  	end
      		d=Mtx1(m-1,n-1)+MatchOrNot;
      		u=Mtx1(m-1,n)+gap;
      		l=Mtx1(m,n-1)+gap;     
      			if(d>=u&&d>=l)
      				Mtx1(m,n)=d;
      				Mtx2(m,n)="z"; %Second matrix
   				elseif(u>d&&u>l)
   					Mtx1(m,n)=u;
   					Mtx2(m,n)="y"; %Second matrix
   				else      
   					Mtx1(m,n)=l;
   					Mtx2(m,n)="x"; %Second matrix   				 
   				end
   end
end

for p=1:(seq1Length+2)
	fprintf("%c\t",Mtx1(1,p));
end 
fprintf("\n");
for q=2:(seq2Length+2)
	fprintf("%s\t",Mtx1(q,1));
	for r=2:(seq1Length+2)
		fprintf("%d \t",Mtx1(q,r));
	end	
		fprintf("\n");
end   % Displaying calculated matrix

%to Backtrace Result Matrix with end/backtrace Start amino
if(seq1Length>=seq2Length)
    MtxResult=zeros(2,seq1Length);
	j=seq1Length;
else
    MtxResult=zeros(2,seq2Length);
	j=seq2Length+2;
end

f=seq2Length+2;
e=seq1Length+2;
while (e>=3)
   	if(Mtx2(f,e)==122)
   		MtxResult(1,e)=Mtx1(1,e);
		MtxResult(2,e)=Mtx1(f,1);
    	e=e-1;
    	f=f-1;    	
   	elseif(Mtx2(f,e)==121)
   		MtxResult(1,e)="-";
		MtxResult(2,e)=Mtx1(f,1);		
		f=f-1;
   	else      
   		MtxResult(1,e)=Mtx1(1,e);
		MtxResult(2,e)="-";   	 
		e=e-1;
   	end   	  	      	           			 
end

fprintf("\n\n\n");
for w=1:2
	fprintf("DNA Sequence %d = \t",w);
	for t=3:j
		fprintf("%s\t",MtxResult(w,t));
	end
		fprintf("\n\n");
end