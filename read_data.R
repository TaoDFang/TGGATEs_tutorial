exprs=read.csv("./data/rat_exprs.csv",header = TRUE,row.names = 1)
head(exprs[,1:6])

pathology=read.csv("./data/rat_pathology.csv",header = TRUE,row.names = 1)
# choosing Microgranuloma and "Hypertrophy" 


#reorder_index=sample(nrow(pathology))
reorder_exprs=exprs[reorder_index,]
reorder_pathos=pathology[reorder_index,]

pathoes=reorder_pathos[,c("Microgranuloma","Hypertrophy")]
colSums(pathoes)   # 154, 272

pathoes_train=pathoes[1:round(0.8*nrow(pathoes)),]
colSums(pathoes_train) #121,210

exprs_train=reorder_exprs[1:round(0.8*nrow(exprs)),]
exprs_test=reorder_exprs[round(0.8*nrow(exprs)+1):nrow(exprs),]


pathology_train=pathoes[1:round(0.8*nrow(pathology)),]
pathology_test=pathoes[round(0.8*nrow(pathology)+1):nrow(pathology),]

write.csv(exprs_train,"./exprs_train.csv",quote = TRUE,row.names = TRUE)
write.csv(exprs_test,"./exprs_test.csv",quote = TRUE,row.names = TRUE)
write.csv(pathology_train,"./pathology_train.csv",quote = TRUE,row.names = TRUE)
write.csv(pathology_test,"./pathology_test.csv",quote = TRUE,row.names = TRUE)
#