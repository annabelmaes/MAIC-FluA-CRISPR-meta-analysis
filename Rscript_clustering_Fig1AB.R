#####Clustering of the screens

#import maic output (maic_raw)

df <- maic_raw[2:5]   #keep columns with gene name and maic scores for each screen
df <- t(df)
df[df > 0] <- 1       #present = 1; absent = 0

d_df <- dist(df, method = "binary")    #calculate distances between screens distance
hc_df <- hclust(d_df)
plot(hc_df)   #generate plot
