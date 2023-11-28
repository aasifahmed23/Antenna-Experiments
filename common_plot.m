function [coeffs,db_n_pencil_array1,db_n_sector_array1,sllmax,drr,sllmax1,ppripmin,hpbw_pencil,hpbw_sector,sll_beamwidth_pencil,sll_beamwidth_sector] = common_plot( x )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
n=10;
a=14;
b=21;
c=16;
lambda=1;
beta=2*pi*lambda;
l_matrix=0.5;
beta_d=0.6*beta;
s1=quantized_amp(x(1:10),5);
s2=quantized_phase(x(11:20),5);
stepx=0.01;
ed=1/stepx;
arr1=s2*(pi/180);
jj=0;
for u=0:stepx:1;
    jj=jj+1;
    for ii=1:n
        dk=(ii-0.5)*beta_d;
        elep=cos(0.5*pi*(u+eps))/(1-(u+eps)^2)^0.5;
        pencil(ii)=s1(ii)*cos(dk*u)*elep;
        sector(ii)=s1(ii)*cos(dk*u)*elep*exp(1i*arr1(ii));
    end
    pencil_array(jj)=abs(2*sum(pencil));
    sector_array(jj)=abs(2*sum(sector));
    
end
eps2=1e-11;
npencil_array=eps2+(pencil_array/(max(pencil_array)+eps2));
nsector_array=eps2+(sector_array/(max(sector_array)+eps2));
db_npencil_array=20*log10(npencil_array);
db_nsector_array=20*log10(nsector_array);

% for calculating HPBW and Beamwidth
for u=1:51
    if(db_npencil_array(u)<-3), u1=(u/100-0.01); break; else
    continue; end
end;

for u=1:51
    if(db_nsector_array(u)<-3), u2=(u/100-0.01); break; else
    continue; end
end;

for u=14:101
    if(db_npencil_array(u)<-25), u3=(u/100-0.01); break; else
    continue; end
end;

for u=36:101
    if(db_nsector_array(u)<-25), u4=(u/100-0.01); break; else
    continue; end
end;

hpbw_pencil=2*u1;
hpbw_sector=2*u2;
sll_beamwidth_pencil=2*u3;
sll_beamwidth_sector=2*u4;

sllmax=(max(db_npencil_array(a:ed+1)));
ppripmin=abs(min(db_nsector_array(1:b)));
sllmax1=(max(db_nsector_array(c:ed+1)));
drr=max(s1)/min(s1);

db_n_pencil_array1=[fliplr(db_npencil_array) db_npencil_array(2:ed+1) ];
db_n_sector_array1=[fliplr(db_nsector_array) db_nsector_array(2:ed+1) ];
coeffs=[s1';s2'];

end

