library(ggplot2)

vect <- model$data # t.ex. residualer 
index <- 1:length(vect) # indexering

# delar upp index ifall behövs, används för färgschema
df$col <- c(rep("index_1", 20), rep("index_2", 20), 
            rep("index_3", 20), rep("index_4", 20),
            rep("index_5", 20))

p <- ggplot(df, aes(x = index, y = vect, color = col)) + # använder col 
  geom_line() +  # eventuell linje i plot
  geom_hline(yintercept = 0, col = "black") +  # färg på linjen
  scale_color_manual(values = c("blue", "red", "green", "orange", "purple")) + # färg per del
  ylab("ylab") + 
  ggtitle("plot titel") + 
  theme_bw() +
  theme(axis.title.y = element_text(angle = 0, vjust = 0.5),
        plot.title = element_text(hjust = 0.5)) # anpassar titel
p



### Grupperat spridningsdiagram på t.ex. faktorer

# Tar fram residualerna från modellen
df$resid <- model$residuals
df$index <-  1:27

# Plottar alla residualer för respektive agent
ggplot(p_improv, aes(x = index,y = resid, fill = i, color = i)) + 
  geom_dotplot(binaxis = 'y', stackdir = 'center') + 
  theme_bw() + 
  labs(x = "Medelvärde fr respektiveö celler", y = "Residualer") +
  ggtitle("Residualspridningen för respektive faktor") +
  theme(axis.title.y = element_text(angle = 0, vjust = 0.5)) +
  geom_hline(yintercept = c(1, -1))

