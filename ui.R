
# Define UI for application 

shinyUI(fluidPage(theme = "bootstrap.css",
                  HTML('<nav class="navbar navbar-inverse">
  <div class="container-fluid">

                       <div class="navbar-header">
                       <button type="button" class="navbar-toggle collapsed" data-toggle="collapse">
                       <span class="sr-only">Toggle navigation</span>
                       <span class="icon-bar"></span>
                       </button>
                       <a class="navbar-brand" href="#">商丰瑞のshiny</a>
                       </div>
                       
                       <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
                       <ul class="nav navbar-nav">
                       <li class="active"><a href="http://www.cnblogs.com/shangfr/">我的博客 <span class="sr-only">(current)</span></a></li>
                       </ul>
                       </div>

                       </div>
                       </nav>'),
                  
                  headerPanel("词云应用"),
                  
                  sidebarLayout(
                    sidebarPanel(
                      tags$textarea(id="inputSuccess","请在此输入文本：北京工商大学于1999年6月由北京轻工业学院、北京商学院、机械工业管理干部学院合并组建而成；北京轻工业学院创建于1958年，是中国最早建立的一所轻工业高等学校；北京商学院前身为1953年成立的中央商业干部学校和1950年成立的中华全国供销合作总社干部学校；机械工业管理干部学院建于1982年，隶属于机械工业部。", rows=10, cols=35),
                      
                      actionButton("action", label = "分词按钮", class="btn btn-success"),
                      
                      hr(),
                      
                      sliderInput("freq",
                                  "最小词频：",
                                  min = 1,  max = 20, value = 1),
                      
                      sliderInput("max",
                                  "词云-词量：",
                                  min = 1,  max = 50,  value = 10)),
                    mainPanel(
                      tabsetPanel(
                        tabPanel(
                          h4("关键词",class="btn btn-info"),
                          tableOutput("keywords"),
                          
                          h4("分词文本输出",class="btn btn-warning"),
                          h5(textOutput("output"),class="alert alert-dismissible alert-info")),
                        tabPanel('词频统计表', DT::dataTableOutput("contents")),
                        tabPanel('关键词云',class="btn btn-info",  plotOutput("keyplot")),
                        tabPanel('词云',class="btn btn-info",  plotOutput("plot"))
                        
                      ))) 
                  
                  
                  
                  ))