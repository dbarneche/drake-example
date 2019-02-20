# Load our packages in the usual way.
# This example requires packages forcats, readxl, and rmarkdown,
# but you do not need to load them here.
library(drake)
require(dplyr)
require(ggplot2)
require(forcats)
require(rmarkdown)
pkgconfig::set_config("drake::strings_in_dots" = "literals") # New file API

# Your custom code is a bunch of functions.
createPlot <- function(data) {
	ggplot2::ggplot(data, ggplot2::aes(x = Petal.Width, fill = Species)) +
		ggplot2::geom_histogram(binwidth = 0.25) +
		ggplot2::theme_gray(20)
}

cleanData  <-  function (object) {
	object %>% dplyr::mutate(Species = forcats::fct_inorder(Species))
}

fitModel  <-  function (data) {
	lm(Sepal.Width ~ Petal.Width + Species, data = data)
}
