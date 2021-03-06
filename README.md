# Analyse du quiz proposé électoral par Le Monde (2022)
A noter: dans le dossier "sources" se trouvent également les quiz du Figaro, du Télégramme et du Parisien au format brut, extraits le 2/04, pour ceux que ça intéresserait de généraliser l'approche ci-dessous. Vous pouvez trouver le quiz du Monde dans un format lisible ici: sources/quizlemonde.xlsx

Version du quiz utilisée: https://www.lemonde.fr/les-decodeurs/article/2022/03/31/quiz-sur-la-presidentielle-2022-de-quel-candidat-etes-vous-le-plus-proche_6119971_4355770.html

Le script lemonde_analyse.m extrait les informations du quiz et simule un grand nombre de réponses aléatoires pour évaluer l'équilibre du test. Un test non-biaisé devrait aboutir à une répartition homogène des probabilités d'être classé premier d'un candidat à l'autre.
Cette analyse peut se faire sur la base des 20 premières questions ou du quiz entier, en corrigeant ou non pour le nombre d'affectations possibles par candidats.
Le script lemonde_plot.m crée les figures. Les barres d'erreur indiquent les intervalles de confiance à 95%.

Le but de ces analyses est de montrer qu'aucune version du quiz n'est équilibrée. 
Il y a deux facteurs en jeu. Premièrement, tous les candidats n'ont pas le même nombre d'affectations possibles, ce qui diminue mécaniquement le nombre de points qu'ils peuvent se voir attribuer. Deuxièmement, même lorsque l'on corrige pour le nombre d'affectations possibles par candidat (de manière à ce que chaque candidat reçoive en moyenne exactement le même nombre de points), le jeu complexe des co-affectations fait que certains candidats sont avantagés par rapport à d'autres.

En analysant les 20 premières questions sans corriger pour le nombre d'affectations (comme affiché sur le site du Monde), on obtient

<img src="/figures/figure_analyses_court_biais.png" width="600">

En analysant les 40 questions sans corriger pour le nombre d'affectations (comme affiché sur le site du Monde), on obtient

<img src="/figures/figure_analyses_long_biais.png" width="600">

En analysant les 20 premières questions et en corrigeant pour le nombre d'affectations, on obtient

 <img src="/figures/figure_analyses_court_correction_biais.png" width="600">

En analysant les 40 questions et en corrigeant pour le nombre d'affectations, on obtient
 
 <img src="/figures/figure_analyses_long_correction_biais.png" width="600">

On peut aussi calculer la similarité entre candidats en se basant sur le pourcentage d'affectations communes dans le quiz (ici pour 20 questions)

 <img src="/figures/figure_court_similarité.png" width="800">

Le Monde peut se saisir de cet outil pour équilibrer son questionnaire.

Si vous voulez en savoir plus sur les réflexions associées à ce travail, vous pouvez jeter un oeil à mes tweets sur le sujet.
https://twitter.com/nerfsocial/status/1510014154588966913
https://twitter.com/nerfsocial/status/1509852362420236288

Romain Ligneul, 1/4/22
