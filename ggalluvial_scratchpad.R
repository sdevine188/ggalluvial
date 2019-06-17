library(tidyverse)
library(ggalluvial)

# https://cran.r-project.org/web/packages/ggalluvial/vignettes/ggalluvial.html

# setwd
setwd("C:/Users/Stephen/Desktop/R/ggalluvial")


#####################################


data(majors)
majors$curriculum <- as.factor(majors$curriculum)
ggplot(majors,
       aes(x = semester, stratum = curriculum, alluvium = student,
           fill = curriculum, label = curriculum)) +
        scale_fill_brewer(type = "qual", palette = "Set2") +
        geom_flow(stat = "alluvium", lode.guidance = "rightleft",
                  color = "darkgray") +
        geom_stratum() +
        theme(legend.position = "bottom") +
        ggtitle("student curricula across several semesters")


#####################################


data(vaccinations)
vaccinations %>% glimpse()

levels(vaccinations$response) <- rev(levels(vaccinations$response))
ggplot(vaccinations,
       aes(x = survey, stratum = response, alluvium = subject,
           y = freq,
           fill = response, label = response)) +
        scale_x_discrete(expand = c(.1, .1)) +
        geom_flow() +
        geom_stratum(alpha = .5) +
        geom_text(stat = "stratum", size = 3) +
        theme(legend.position = "none") +
        ggtitle("vaccination survey responses at three points in time")
