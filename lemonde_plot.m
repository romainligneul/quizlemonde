clear all;close all;
addpath('helper')

% nom de l'analyse
analyse_source='analyses_court_correction';

% charge l'analyse souhaitée
load([analyse_source '.mat'])

% crée le dossier si besoin
if exist('figures', 'dir')==0
    mkdir('figures')
end

% plot biais
f1=figure('name', 'bias', 'color', 'w', 'position',  [246   328   560   645] )
% code couleur récupéré sur le site du monde
hexcolors={'#9D0D16', '#CE2929', '#F1001C', '#FF3333', '#23B73D', '#FF668B', '#FF9F0E', '#0890C5', '#617B75', '#02279C', '#8D6026','#654519'};
hm=bar([1:12]',diag(100*proportion_premier(:,1)),'stacked');
hold on
he=errorbar(1:12,100*proportion_premier,100*(proportion_premier-confidence_interval(:,1)),100*(confidence_interval(:,2)-proportion_premier));
he.LineStyle='none';
he.Color='k';
he.LineWidth=1;
hold off
for c=1:12
    cartecouleur(c,:)=sscanf(hexcolors{c}(2:end),'%2x%2x%2x',[1 3])/255;
    hm(c).FaceColor=cartecouleur(c,:);
    hm(c).FaceAlpha=0.8;
end
xlim([0 13])
ylabel('premier ou copremier (%)')
set(gca, 'xticklabel', candidats, 'fontsize', 14)
box off
camroll(-90)
saveas(f1, ['figures/figure_' analyse_source '_biais.png'])

% similarité
f2=figure('color', 'w')
imagesc(100*coaffectation)
set(gca,'xtick',1:12);
set(gca,'ytick',1:12);
set(gca,'xticklabel',candidats);
set(gca,'yticklabel',candidats, 'fontsize', 14);
xticklabel_rotate([],45,[], 'fontsize', 14)
title('pourcentage de co-affectations')
colorbar
set(gcf, 'position', [ 808   328   984   645])
saveas(f2, ['figures/figure_' analyse_source(10:end) '_similarité.png'])
