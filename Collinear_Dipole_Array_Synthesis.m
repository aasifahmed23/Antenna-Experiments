% http://ssakata.sdf.org/software/
xinit=[0.996;0.961;.895;.804;.697;.583;.471;.367;.276;.201;159.1417;148.2797;105.2935;75.6595;44.8760;13.8579;8.9952;-0.3197;0.5017;-107.7602];
xl=[0.100;0.100;0.100;0.100;0.100;0.100;0.100;0.100;0.100;0.100;-180.005;-180.005;-180.005;-180.005;-180.005;-180.005;-180.005;-180.005;-180.005;-180.005];
xu=[1.000;1.000;1.000;1.000;1.000;1.000;1.000;1.000;1.000;1.000;180.005;180.005;180.005;180.005;180.005;180.005;180.005;180.005;180.005;180.005];
xt=-1*ones(20,1);
tic;

asamin('set', 'rand_seed',696869);
asamin('set', 'asa_out_file','asatest2.log');
asamin('set', 'test_in_cost_func',0);
[fstar,xstar,grad,hessian,state]=asamin('minimize', 'cost_variable_amp_n_phase',xinit,xl,xu,xt);

[coeffs,db_n_pencil_array1,db_n_sector_array1,sllmax,drr,sllmax1,ppripmin,hpbw_pencil,hpbw_sector,sll_beamwidth_pencil,sll_beamwidth_sector]=common_plot(xstar);

figure1 = figure;
axes1= axes(...
    'FontName','Times New Roman',...
    'Fontsize', 14, ...
    'YTick',[-70 -60 -50 -40 -30 -20 -10 0],...
    'YTickLabel',['-70', '-60', '-50', '-40', '-30','-20', '-10', '0'],...
    'Parent', figure1);

ylim(axes1,[-75 0]);
xlabel(axes1,'u=Sin\theta');
ylabel(axes1,'Normalised Absolute Power Pattern(dB)');
box(axes1,'on');
hold(axes1,'all');

u=-1:0.01;1;
plot1=plot(u,db_n_pencil_array1,'k',u,db_n_sector_array1,'k');
set(plot(1),'LineStyle','--','LineWidth',2);
set(plot(2),'LineWidth',2);

legend1= legend(...
    axes1,{'Pencil Beam','Sector Beam'},...
    'FontName', 'Times New Roman',...
    'FontSize',14);

toc;
