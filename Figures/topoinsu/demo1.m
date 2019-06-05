M = 137;
ky_step = 137;
tx = 1;
ty = 1;
p = 1;
q = 6;
Phi = p/q;
ky_list = linspace(0,2*pi,ky_step);
result = zeros(ky_step,M);
for y = 1:ky_step
    result(y,:) = eig(cyd_square(M,ky_list(y),tx,ty,Phi));
end

figure1 = figure('pos',[-1049 263 640 498]);

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create multiple lines using matrix input to plot
plot(ky_list,result)

% Create ylabel
ylabel({'$$E$$'},'Interpreter','latex');

% Create xlabel
xlabel('$$k_x$$','Interpreter','latex');

box(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontName','Times New Roman','FontSize',24,'XTick',[0 3.14 6.24],...
    'XTickLabel',{'0','\pi','2\pi'});
annotation(figure1,'arrow',[0.215562565720294 0.353312302839117],...
    [0.710985688729875 0.783542039355993],'Color',[1 0 0],'LineWidth',2);

% Create arrow
annotation(figure1,'arrow',[0.200841219768665 0.262881177707676],...
    [0.604651162790698 0.65474060822898],'Color',[1 0 0],'LineWidth',2);

% Create ellipse
annotation(figure1,'ellipse',...
    [0.172339379600421 0.514293309193841 0.0421125131440589 0.0679785330948121],...
    'Color',[1 0 0],...
    'LineWidth',4);

% Create arrow
annotation(figure1,'arrow',[0.188163774973712 0.235482386961094],...
    [0.417473112485721 0.472929284220962],'Color',[1 0 0],'LineWidth',2);

% Create arrow
annotation(figure1,'arrow',[0.151301261829653 0.195465299684543],...
    [0.275894274773512 0.31703917638353],'Color',[1 0 0],'LineWidth',2);


function H = cyd_square(M,ky,tx,ty,Phi)

diag1 = zeros(M,1);
for i = 1:M
    diag1(i) = -2*ty*cos(ky-2*pi*Phi*i);
end
H = diag(diag1) - tx*diag(ones(M-1,1),-1) - tx*diag(ones(M-1,1),1);
end