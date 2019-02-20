# The workflow plan data frame outlines what you are going to do.
plan  <-  drake::drake_plan(
    raw_data  =  readxl::read_excel(file.path("data", "raw_data.xlsx")),
    data      =  cleanData(raw_data),
    hist      =  createPlot(data),
    fit       =  fitModel(data),
    report    =  rmarkdown::render(input = drake::knitr_in("doc/report.Rmd"), output_format = c('html_document', 'pdf_document'), output_file = NULL, output_dir = "output/doc/")
)
