library(tidyverse)
library(readxl)
library(tidyr)


agg_freyja = read_tsv("")                                                      #loading the file path for the original aggregated file

agg_freyja2 = agg_freyja %>% 
  rename(sample_id = 1) %>%                                                    #renaming column one to sample_id since it is unamed
  mutate(sample_id = str_remove(sample_id, ".sorted.freyja_variants.tsv")) %>% #removing the trailing filename
  mutate(summarized = gsub("\\[|\\]", "", summarized)) %>%                     #removing the brackets around the summarized data so it is just tuples
  filter(coverage >= 60) %>%                                                   #filtering so only samples with acceptable coverage metrics are allowed
  separate_rows(lineages, abundances) %>%                                      #spreading the data of lineages and abundances for easier calculations
  select(sample_id,lineages,abundances,coverage)                               # selecting only the information I am interested in for visualizations

        
  