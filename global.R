
library(shiny)
library(shinyAce)
library(jiebaR)
library(wordcloud)#可视化
library(RColorBrewer)
library(DT)

cutter = worker(dict = "www/jieba.dict.utf8", hmm = "www/hmm_model.utf8", user = "www/user.dict.utf8",
                idf = "www/idf.utf8", stop_word ="www/stop_words.utf8")
keys = worker("keywords",dict = "www/jieba.dict.utf8", hmm = "www/hmm_model.utf8", user = "www/user.dict.utf8",
              idf = "www/idf.utf8", stop_word ="www/stop_words.utf8", topn = 10)

