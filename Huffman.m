clc;
clear all;
s=['a','b','c','d','e','f'];
p=[0.22,0.20,0.18,0.15,0.13,0.12];  
i=1;
for m=1:length(p)
   for n=1:length(p)
       if(p(m)>p(n))
         a=p(n);  a1=s(n);
         p(n)=p(m);s(n)=s(m);  
         p(m)=a;   s(m)=a1;
       end
   end
end

tempfinal=[0];
sumarray=[];
w=length(p);
lengthp=[w];
b(i,:)=p;

while(length(p)>2) 
 tempsum=p(length(p))+p(length(p)-1);
 sumarray=[sumarray,tempsum];
 p=[p(1:length(p)-2),tempsum];
 p=sort(p,'descend');
 i=i+1;
 b(i,:)=[p,zeros(1,w-length(p))];
 w1=0;
 lengthp=[lengthp,length(p)];
 
 for temp=1:length(p) 
     if p(temp)==tempsum;
       w1=temp;
     end
 end
 tempfinal=[w1,tempfinal];

end

sizeb(1:2)=size(b);
tempdisplay=0;
temp2=[];
 
 for i= 1:sizeb(2)   
    temp2=[temp2,b(1,i)];
 end 
 
 sumarray=[0,sumarray];
 var=[];
 e=1;
 final_codes={};
 for ifinal= 1:sizeb(2)
    code=[s(ifinal),'      ']
    for j=1:sizeb(1) 
        tempdisplay=0; 
     
        for i1=1:sizeb(2) 
            if( b(j,i1)==temp2(e))  
                tempdisplay=b(j,i1);     
            end
            if(tempdisplay==0 & b(j,i1)==sumarray(j))
                tempdisplay=b(j,i1);
            end
        end
        var=[var,tempdisplay];
        if tempdisplay==b(j,lengthp(j))
            code=[code,'1']; 
        elseif tempdisplay==b(j,lengthp(j)-1)
            code=[code,'0'];
        else
            code=[code,''];
        end 
        temp2(e)=tempdisplay;  
    end  
    final_codes{ifinal}=code;
    e=e+1;
 end


