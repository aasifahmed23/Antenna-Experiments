function [ cost_value, cost_flag ] = cost_variable_amp_n_phase( x )
%The coding of the MOPP goes Here
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
if sllmax < -25, sler=0; else sler=abs(sllmax+25); end
ppripmin=abs(min(db_nsector_array(1:b)));
if ppripmin<0.5, pp_rip_er=0; else pp_rip_er=abs(ppripmin-0.5); end
sllmax1=(max(db_nsector_array(c:ed+1)));
if sllmax1 < -25, sler1=0; else sler1=abs(sllmax1+25); end

if hpbw_pencil<0.12, er1=0; else er1=abs(hpbw_pencil-0.12); end
if hpbw_sector<0.5, er2=0; else er2=abs(hpbw_sector-0.5); end

if sll_beamwidth_pencil<0.1, er3=0; else er3=abs(sll_beamwidth_pencil-0.3); end
if sll_beamwidth_sector<0.7, er4=0; else er4=abs(sll_beamwidth_sector-0.7); end

% Uncomment this if you need DRR Minimization as well
% drr=max(s1)/min(s1);
% if((drr>6) && (drr<7)), drr_er=0; else drr_er=abs(drr-6); end

cost=[sler^2+sler1^2+pp_rip_er^2+er1^2+er2^2+er3^2+er4^2];
cost_value= cost;
cost_flag=1;


end

