clearvars;clc; clf
cd('/Users/alonshepon/Library/CloudStorage/GoogleDrive-alonshepon@gmail.com/My Drive/Main/Research topics/meat transition/US Dietary Guidelines 2026/codes')

t = tiledlayout(2,2,'Padding', 'tight', 'TileSpacing', 'compact');
nexttile
%----------------------GHG----------------------------
data = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','summary','Range','F5:F5');
MAD=table2array(data);

data = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','summary','Range','F6:F6');
UPF=table2array(data);

data = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','summary','Range','F7:F7');
g08protein=table2array(data);

data = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','summary','Range','F8:F8');
g12protein=table2array(data);

data = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','summary','Range','F9:F9');
g16protein=table2array(data);

data = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','summary','Range','F10:F10');
g16proteinPLANT=table2array(data);

data = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','summary','Range','F11:F11');
g16proteinMEAT=table2array(data);

diff=MAD-UPF;
y=[diff;g08protein-diff;g12protein-diff;g16protein-diff;g16proteinPLANT-diff; g16proteinMEAT-diff];
bottoms=[0;diff;diff;diff;diff;diff];

data = [bottoms, y, [UPF,0,0,0,0,0]'];

% Plot stacked bars
hold on
h = bar(data, 'stacked');

% Customize: Hide the bottom 'foundation' bars
h(1).FaceColor = 'none';
h(1).EdgeColor = 'none';
% Optional: Change color of positive/negative
h(2).FaceColor = 'flat';
h(2).BarWidth=0.5;
h(2).CData(1,:) = rgb('Darkblue');
h(1).CData(1,:) = rgb('SandyBrown');
h(2).CData(2,:) = rgb('IndianRed');
h(2).CData(3,:) = rgb('Crimson');
h(2).CData(4,:) = rgb('FireBrick');
h(2).CData(5,:) = rgb('Green');
h(2).CData(6,:) = rgb('DarkRed');

%add lines connecting scenarios
line([0.75,6.25], [diff,diff],'Color','k','LineWidth',0.5)

%add animal portion of UPFs
ani1 = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','diets','Range','AL53:AL53');
ani=table2array(ani1);
ff=rgb('SandyBrown');
hp=fill([0.75, 0.75, 1.25,1.25],[diff,diff+ani,diff+ani,diff],ff,'FaceAlpha',0.5);
hatchfill(hp);

% Set the x-axis ticks and labels
ylim([0, 2500])
xlim([0.5,6.5])
ylabel('GHG, kgCO_{2e}')
x_positions = [1,2,3,4,5,6];
xticks(x_positions);
xticklabels('')
set(gca,'Box','off')
text(0.7, 2400, 'a', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'center','FontWeight','bold');
hold off


%%%%---------------------water--------------------------
nexttile
data = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','summary','Range','G5:G5');
MAD=table2array(data)/1000;

data = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','summary','Range','G6:G6');
UPF=table2array(data)/1000;

data = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','summary','Range','G7:G7');
g08protein=table2array(data)/1000;

data = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','summary','Range','G8:G8');
g12protein=table2array(data)/1000;

data = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','summary','Range','G9:G9');
g16protein=table2array(data)/1000;

data = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','summary','Range','G10:G10');
g16proteinPLANT=table2array(data)/1000;

data = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','summary','Range','G11:G11');
g16proteinMEAT=table2array(data)/1000;

diff=MAD-UPF;
y=[diff;g08protein-diff;g12protein-diff;g16protein-diff;g16proteinPLANT-diff; g16proteinMEAT-diff];
bottoms=[0;diff;diff;diff;diff;diff];

data = [bottoms, y, [UPF,0,0,0,0,0]'];

% Plot stacked bars
hold on
h = bar(data, 'stacked');

% Customize: Hide the bottom 'foundation' bars
h(1).FaceColor = 'none';
h(1).EdgeColor = 'none';
% Optional: Change color of positive/negative
h(2).FaceColor = 'flat';
h(2).BarWidth=0.5;
h(2).CData(1,:) = rgb('Darkblue');
h(1).CData(1,:) = rgb('SandyBrown');
h(2).CData(2,:) = rgb('IndianRed');
h(2).CData(3,:) = rgb('Crimson');
h(2).CData(4,:) = rgb('FireBrick');
h(2).CData(5,:) = rgb('Green');
h(2).CData(6,:) = rgb('DarkRed');

%add lines connecting scenarios
%line([0.75,2.25], [MAD,MAD],'Color','k','LineWidth',0.5)
line([0.75,6.25], [diff,diff],'Color','k','LineWidth',0.5)

%add animal portion of UPFs
ani1 = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','diets','Range','AK53:AK53');
ani=table2array(ani1)/1000;
ff=rgb('SandyBrown');
hp=fill([0.75, 0.75, 1.25,1.25],[diff,diff+ani,diff+ani,diff],ff,'FaceAlpha',0.5);
hatchfill(hp);

% Set the x-axis ticks and labels
ylim([0, 2500])
xlim([0.5,6.5])
ylabel('water, m^{3}')
x_positions = [1,2,3,4,5,6];
xticklabels('');
set(gca,'Box','off')
text(0.7, 2400, 'b', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'left','FontWeight','bold');
hold off
%----------------------  land   ----------------------------
nexttile
data = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','summary','Range','H5:H5');
MAD=table2array(data)/10^4;

data = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','summary','Range','H6:H6');
UPF=table2array(data)/10^4;

data = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','summary','Range','H7:H7');
g08protein=table2array(data)/10^4;

data = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','summary','Range','H8:H8');
g12protein=table2array(data)/10^4;

data = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','summary','Range','H9:H9');
g16protein=table2array(data)/10^4;

data = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','summary','Range','H10:H10');
g16proteinPLANT=table2array(data)/10^4;

data = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','summary','Range','H11:H11');
g16proteinMEAT=table2array(data)/10^4;

diff=MAD-UPF;
y=[diff;g08protein-diff;g12protein-diff;g16protein-diff;g16proteinPLANT-diff; g16proteinMEAT-diff];
bottoms=[0;diff;diff;diff;diff;diff];

data = [bottoms, y, [UPF,0,0,0,0,0]'];

% Plot stacked bars
hold on
h = bar(data, 'stacked');

% Customize: Hide the bottom 'foundation' bars
h(1).FaceColor = 'none';
h(1).EdgeColor = 'none';
% Optional: Change color of positive/negative
h(2).FaceColor = 'flat';
h(2).BarWidth=0.5;
h(2).CData(1,:) = rgb('Darkblue');
h(1).CData(1,:) = rgb('SandyBrown');
h(2).CData(2,:) = rgb('IndianRed');
h(2).CData(3,:) = rgb('Crimson');
h(2).CData(4,:) = rgb('FireBrick');
h(2).CData(5,:) = rgb('Green');
h(2).CData(6,:) = rgb('DarkRed');

%add lines connecting scenarios
%line([0.75,2.25], [MAD,MAD],'Color','k','LineWidth',0.5)
line([0.75,6.25], [diff,diff],'Color','k','LineWidth',0.5)

%add animal portion of UPFs
ani1 = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','diets','Range','AI53:AI53');
ani=table2array(ani1)/10^4;
ff=rgb('SandyBrown');
hp=fill([0.75, 0.75, 1.25,1.25],[diff,diff+ani,diff+ani,diff],ff,'FaceAlpha',0.5);
hatchfill(hp);

% Set the x-axis ticks and labels
xlim([0.5,6.5])
ylim([0,2.5])
ylabel('land, ha-y')
x_labels = {'MAD', '0.8g/kg', '1.2g/kg','1.6g/kg','1.6g/kgPLANT','1.6g/kgANIMAL'};
x_positions = [1, 2, 3,4,5,6];
xticks(x_positions);
xticklabels(x_labels);
text(0.7, 2.4, 'c', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'left','FontWeight','bold');
set(gca,'Box','off')

%draw protein intake of diet
pro = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','summary','Range','K5:K11');
d=[0.7,1,1,1,1,1];
pro = table2array(pro(:, 'Var1'));
pro_v=pro([1,3,4,5,6,7]);
f=[1,2,3,4,5,6];
h={'white','white','white','white','white','white'};
for i = 1:length(pro)-1
    text(f(i), d(f(i)),num2str(pro_v(f(i)),'%.0f'),'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', 'FontSize',9,'Color',h{i});
end
text(3,0.7,'g protein day^{-1}')
hold off

%%%%---------------------Nitrogen-------------------------
nexttile
data = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','summary','Range','I5:I5');
MAD=table2array(data)/1000;

data = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','summary','Range','I6:I6');
UPF=table2array(data)/1000;

data = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','summary','Range','I7:I7');
g08protein=table2array(data)/1000;

data = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','summary','Range','I8:I8');
g12protein=table2array(data)/1000;

data = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','summary','Range','I9:I9');
g16protein=table2array(data)/1000;

data = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','summary','Range','I10:I10');
g16proteinPLANT=table2array(data)/1000;

data = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','summary','Range','I11:I11');
g16proteinMEAT=table2array(data)/1000;

diff=MAD-UPF;

y=[diff;g08protein-diff;g12protein-diff;g16protein-diff;g16proteinPLANT-diff; g16proteinMEAT-diff];
bottoms=[0;diff;diff;diff;diff;diff];

data = [bottoms, y, [UPF,0,0,0,0,0]'];

% Plot stacked bars
hold on
h = bar(data, 'stacked');

% Customize: Hide the bottom 'foundation' bars
h(1).FaceColor = 'none';
h(1).EdgeColor = 'none';
% Optional: Change color of positive/negative
h(2).FaceColor = 'flat';
h(2).BarWidth=0.5;
h(2).CData(1,:) = rgb('Darkblue');
h(1).CData(1,:) = rgb('SandyBrown');
h(2).CData(2,:) = rgb('IndianRed');
h(2).CData(3,:) = rgb('Crimson');
h(2).CData(4,:) = rgb('FireBrick');
h(2).CData(5,:) = rgb('Green');
h(2).CData(6,:) = rgb('DarkRed');

%add lines connecting scenarios
line([0.75,6.25], [diff,diff],'Color','k','LineWidth',0.5)

%add animal portion of UPFs
ani1 = readtable('NOVA+PROTEIN_DGA25-30_ver5.xlsx','Sheet','diets','Range','AJ53:AJ53');
ani=table2array(ani1)/1000;
ff=rgb('SandyBrown');
hp=fill([0.75, 0.75, 1.25,1.25],[diff,diff+ani,diff+ani,diff],ff,'FaceAlpha',0.5);
hatchfill(hp);

% Set the x-axis ticks and labels
xlim([0.5,6.5])
ylim([0,70])
ylabel('N fertilizer, kg')
x_labels = {'MAD', '0.8g/kg', '1.2g/kg','1.6g/kg','1.6g/kgPLANT','1.6g/kgANIMAL'};
x_positions = [1,2,3,4,5,6];
xticks(x_positions);
xticklabels(x_labels);
text(0.7, 68, 'd', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'left','FontWeight','bold');
set(gca,'Box','off')
hold off
print(gcf,'allImpacts_1.jpeg','-dpng', '-r300')
