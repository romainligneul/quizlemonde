# Analyse du quiz proposé par Le Monde 

Version du quiz utilisée: https://www.lemonde.fr/les-decodeurs/article/2022/03/31/quiz-sur-la-presidentielle-2022-de-quel-candidat-etes-vous-le-plus-proche_6119971_4355770.html
Le script lemonde_analyse.m extrait les informations du quiz et simule un grand nombre de réponses aléatoires pour évaluer l'équilibre du test.
Cette analyse peut se faire sur la base des 20 premières questions ou du quiz entier, en corrigeant ou non pour le nombre d'affectations possibles par candidats.
Le script lemonde_plot.m crée les figures.

En analysant les 40 questions sans corriger pour le nombre d'affectations (comme affiché sur le site du Monde), on obtient
<img src="/figures/figure_analyses_long_biais.png" width="600">

En analysant les 20 premières questions sans corriger pour le nombre d'affectations (comme affiché sur le site du Monde), on obtient
<img src="/figures/figure_analyses_court_biais.png" width="600">
 
 En analysant les 40 questions et en corrigeant pour le nombre d'affectations, on obtient
 <img src="/figures/figure_analyses_long_correction_biais.png" width="600">

En analysant les 20 premières questions et en corrigeant pour le nombre d'affectations, on obtient
 <img src="/figures/figure_analyses_court_correction_biais.png" width="600">

On peut aussi calculer la similarité entre candidats en se basant sur le pourcentage d'affectations communes dans le quiz (ici pour 20 questions)
 <img src="/figures/figure_analyses_court_similarité.png" width="800">

Le Monde peut se saisir de cet outil pour équilibrer son questionnaire.

Romain Ligneul, 1/4/22
