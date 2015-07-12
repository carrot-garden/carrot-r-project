
library(git2r)
library(devtools)

#'
#' Load package from local git repository folder.
#'
#' @param name A package name for loading.
#' @param folder A folder with packages inside the repository.
#' @param export Indicate whether to export all loaded namespace. 
#' 
#' @details Function assumes that R working folder is inside git repository.
#' 
load_repo = function(name, folder='package', export=FALSE){
	repo = git2r::repository('.', discover=TRUE)
	work = git2r::workdir(repo)
	devtools::load_all(file.path(work, folder, name), export_all=export)
}
