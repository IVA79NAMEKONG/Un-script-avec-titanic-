
library(titanic)
library(ggplot2)

db <- titanic::titanic_train
db
str(db)

db <- na.omit(db[, c("Name", "Sex", "Age", "Pclass", "Survived")])
db


db$Groupe <-ifelse(db$Age < 12, "Enfant", ifelse(db$Sex =="female", "Femme", "Homme"))
db$Groupe
table(db$Groupe)
table(db$Groupe, db$Pclass, db$Survived)


survivants <- subset(db, Survived == 1)
survivants <- survivants[order(survivants$Pclass), ]

print(survivants[, c("Name", "Groupe", "Pclass")])


ggplot(db, aes(x = Groupe, fill = as.factor(Survived))) + geom_bar(position = "dodge") + facet_wrap(~Pclass) + labs(title = "surviepar groupe et par classe", x = "Groupe", fill = "survecu (1=Oui, 0=Non)")


