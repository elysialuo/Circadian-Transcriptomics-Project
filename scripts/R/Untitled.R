volcano_data <- mean_result |> dplyr::select(logFC, P.Value, adj.P.Val) |> rownames_to_column('gene_id') |> left_join(rhythm_result_grouped, by='gene_id')

volcano_data$diffExpressed <- 'NO'
volcano_data$diffExpressed[volcano_data$logFC>0.8 & volcano_data$adj.P.Val<0.05] <- 'UP'
volcano_data$diffExpressed[volcano_data$logFC<(-0.8) & volcano_data$adj.P.Val<0.05] <- 'DOWN'

table(volcano_data$diffExpressed)
table(volcano_data[, c('diffExpressed', 'grouped_chosen_model')])
table(volcano_data[, c('diffExpressed', 'chosen_model')])


volcano_data_rhythmic <- volcano_data |> filter(grouped_chosen_model=='rhythmic')
volcano_data_nonrhythmic <- volcano_data |> filter(grouped_chosen_model=='non-rhythmic')

ggplot(data=volcano_data_rhythmic, aes(x=logFC, y=-log10(adj.P.Val
), col = diffExpressed)) +
  geom_vline(xintercept = c(-0.8, 0.8), col='gray', linetype='dashed') +
  geom_hline(yintercept=c(-log10(0.05)), col='gray', linetype='dashed') +
  geom_point(size=1) +
  scale_color_manual(values = c("#00AFBB", "grey", "#FC4E07"), 
                     labels = c("Downregulated", "Not significant", "Upregulated")) +
  ggtitle("Rhythmic genes") +
  xlim()

ggplot(data=volcano_data_nonrhythmic, aes(x=logFC, y=-log10(adj.P.Val
), col = diffExpressed)) +
  geom_vline(xintercept = c(-0.8, 0.8), col='gray', linetype='dashed') +
  geom_hline(yintercept=c(-log10(0.05)), col='gray', linetype='dashed') +
  geom_point(size=1) +
  scale_color_manual(values = c("#00AFBB", "grey", "#FC4E07"), 
                     labels = c("Downregulated", "Not significant", "Upregulated")) +
  ggtitle("Non-rhythmic genes")
