library(ggplot2)

resid <- c(1,2,3,4,5)
index <- 1:5 # index för plot
resid_df <- data.frame(resid, index) 

#####  plottar outliers baserat på observations index #####  
resid_df$color <- ifelse(resid_df$index == 1 | resid_df$index == 2, "outlier", NA) # anger outliers
resid_df$outlier <- ifelse(resid_df$color == "outlier", resid_df$index, NA) # ger respektive nummer

##### plottar outliers baserat på värde #####  
resid_df$color <-ifelse(abs(resid) > 2, "outlier", NA)
resid_df$outlier <- ifelse(abs(resid) > 2, resid, NA)


# rätt outliers i färgschemat
resid_df$color_scheme <- "normal"
resid_df$color_scheme[resid_df$color == "outlier"] <- "outlier"

ggplot(resid_df, aes(x = index,
                     y = resid, 
                     label = outlier)) + 
  geom_point(aes(colour = color_scheme)) + 
  scale_color_manual(values = c("blue", "red")) + 
  geom_text(hjust = -0.2,
            nudge_x = 0.15, 
            size = 3) +
  labs(x = "Index", 
       y = "Resid", 
       colour = "Normal / Outlier") +
  theme_bw() 
