
# Define server logic
shinyServer(function(input, output, session) {
  
  output$output <- renderPrint({
    input$action
    return(isolate({
      cat(
        paste(
          cutter <= input$inputSuccess
          ,collapse = "、"
        )
      )
    }))
  })
  
  output$contents <- DT::renderDataTable({
    input$action
    words=cutter <= input$inputSuccess
    wordsfreq=data.frame(table(words))
    wordsfreq[order(wordsfreq$Freq,decreasing = TRUE),]
  })
  
  output$keywords <- renderTable({
    input$action
    words= keys <= input$inputSuccess
    t(data.frame(关键词=words, 权重=names(words)))
  })
  
  output$plot <- renderPlot({
    input$action
    words=cutter <= input$inputSuccess
    wordsfreq=data.frame(table(words))
    wordcloud(wordsfreq$words,freq=wordsfreq$Freq, scale= c(8,.3),
              min.freq = input$freq, max.words=input$max,
              random.order=FALSE,colors=rainbow(7))
    title(main = "词频云",cex=1,col.main="#00C5CD")
    title(sub = "Developed by Shangfr",cex.sub=0.8,col.sub="grey")
  })
  
  output$keyplot <- renderPlot({
    input$action
    outkey= keys <= input$inputSuccess
    wordcloud(outkey,as.numeric(names(outkey)), scale = c(7, 1), 
              min.freq = input$freq, max.words=input$max,
              random.order=FALSE,colors = rainbow(100))
    title(main = "关键词云",cex=1,col.main="#00C5CD")
    title(sub = "Developed by Shangfr",cex.sub=0.8,col.sub="grey")
    
  })
  
  
})
