
# Loading config ----------------------------------------------------------
pacman::p_load(tidyverse, 
               rvest)

# Reading WSJ homepage url ------------------------------------------------

wsjHomePageURL <- read_html("https://www.wsj.com/?mod=nav_top_section")


# Reading in time ---------------------------------------------------------

Sys.Date()


# Creating a new tibble everyday ------------------------------------------

wsjHomePage2021_03_24 <- tibble(index = 1:5)



# Putting together the Popular news dataset -------------------------------

wsjHomePage2021_03_24 <- wsjHomePage2021_03_24 %>%
  mutate(
    mostPopularNews = wsjHomePageURL %>%
      html_nodes("#most-popular-articles .WSJTheme--text--2yLVyzUM span") %>%
      html_text() %>%
      str_squish(),
    mostPopularOpinion = wsjHomePageURL %>% 
      html_nodes("#most-popular-opinion-articles .WSJTheme--text--2yLVyzUM span") %>% 
      html_text() %>% 
      str_squish(),
    recommendedVideos = wsjHomePageURL %>% 
      html_nodes("#recommended-videos h3") %>% 
      html_text() %>% 
      str_squish(),
    dateAndTime = Sys.time()
  )


# row binding all of the datasets ----------------------------------------------------

wsjHomePageCollections <- rbind(wsjHomePage,wsjHomePage2021_03_23, wsjHomePage2021_03_24)

