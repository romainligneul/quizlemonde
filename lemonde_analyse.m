clear all

% Le quiz a été importé a partir de cette addresse sous la forme d'un
% fichier JSON
% https://assets-decodeurs.lemonde.fr/sheets/XusEdnYa3E1Jjl5VdrKGA2z9bH1uwA_887
% Ce fichier JSON a ensuite été converti au format excel/csv en utilisant
% cet outil: https://data.page/json/csv
% Puis il a été importé (à partir du fichier excel) dans matlab pour
% produire ce fichier:
quiz=importdata('quizlemonde.mat')

% spécifications de l'analyse
nquestions=20;
nsimulations=10000;
correction_nquestion=false;
candidats={'Arthaud', 'Poutou','Roussel', 'Mélenchon', 'Jadot', 'Hidalgo', 'Macron', 'Pécresse', 'Lassalle', 'Dupont-Aignan', 'Le Pen', 'Zemmour'};

% prétraitement du quiz pour obtenir les affectations par candidat et par
% question.
noptions=nan(nquestions,1);
for i=1:nquestions
    for a=1:6
        if (iscell(quiz{i+1,9+a})==0 | isempty(cell2mat(quiz{i+1,9+a}))) & isnan(noptions(i,1))
            noptions(i,1)=a-1;
        end
        for c=1:length(candidats)
            exist_str=strfind(quiz{i+1,9+a},candidats{c});
            try
                if isempty(exist_str{1})==0
                    mat_affect(c,i)=a;
                end
            end
        end
    end
end

% calcule la similarité entre candidats
for c=1:length(candidats)
    for cc=1:length(candidats)
        coaffectation(c,cc)=(sum(mat_affect(c,mat_affect(c,:)>0)==mat_affect(cc,mat_affect(c,:)>0)))/sum(mat_affect(c,:)>0);
    end
end

% corrige pour le nombre de questions
if correction_nquestion
    point_correction=1./(mean(mat_affect>0,2));
else
    point_correction=ones(length(candidats),1);
end

% simulation des réponses aléatoires
scores=zeros(length(candidats),nsimulations);
for s=1:nsimulations
    for i=1:nquestions
         choix=randi(noptions(i));
         points=find(choix==mat_affect(:,i));
         scores(points,s)=scores(points,s)+point_correction(points);
    end
    [dum, dum, invrank] = unique(scores(:,s));
    rang(:,s)=1+max(invrank)-invrank;
end

% calcule des moyennes et des intervalles de confiance à 95%
for c=1:length(candidats)
    proportion_premier(c,1)=mean(rang(c,:)==1);
    confidence_interval(c,:)=bootci(1000,@(x) mean(x), [rang(c,:)==1]');
end

% sauvegarde les données
save('analyses.mat')

% fichiers présauvegardés
% court = 20 questions: première partie du quiz
% long = 40 questions: inclusion des questions supplémentaires
