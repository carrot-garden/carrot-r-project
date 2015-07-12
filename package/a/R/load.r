
library(git2r)
library(devtools)

#'
#' Load package from local git repository folder.
#'
#' @param name A package name for loading.
#' @param folder A folder with packages inside the repository.
#' 
#' @details Function assumes that R working folder is inside git repository.
#' 
load.repo = function(name, folder='package'){
	repo = git2r::repository('.', discover=TRUE)
	work = git2r::workdir(repo)
	devtools::load_all(file.path(work, folder, name), export_all=FALSE)
}
