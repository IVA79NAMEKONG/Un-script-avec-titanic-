# Un-script-avec-titanic-
Utiliser la bibliothèque titanic pour la visualisation des données notamment dans le cadre de notre apprentissage en analyse de données 

---
title: "titanic"
author: "IVANE"
date: "2025-07-19"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```


```{r}
library(titanic)
library(ggplot2)
```

# chargement des donnees
```{r}
db <- titanic::titanic_train
db
str(db)
```
# nettoyage

```{r}
db <- na.omit(db[, c("Name", "Sex", "Age", "Pclass", "Survived")])
db

```

# creer un groupe hommes, femmes et les enfants de moins de 12 ans

```{r}
db$Groupe <-ifelse(db$Age < 12, "Enfant", ifelse(db$Sex =="female", "Femme", "Homme"))
db$Groupe
table(db$Groupe)
table(db$Groupe, db$Pclass, db$Survived)

```

# extraire et afficher le nom des survivants selon leur groupe et classe

```{r}
survivants <- subset(db, Survived == 1)
survivants <- survivants[order(survivants$Pclass), ]
```
# affichage simplifie
```{r}
print(survivants[, c("Name", "Groupe", "Pclass")])

```

# visualiser les survivants par groupe et par classe
```{r}
ggplot(db, aes(x = Groupe, fill = as.factor(Survived))) + geom_bar(position = "dodge") + facet_wrap(~Pclass) + labs(title = "surviepar groupe et par classe", x = "Groupe", fill = "survecu (1=Oui, 0=Non)")
```

