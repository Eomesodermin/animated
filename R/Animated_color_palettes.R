#' Complete list of palettes
#'
#' Use \code{\link{animated_palette}} to construct palettes of desired length.
#'
#' @export
animated_palettes <- list(
  A_Bugs_life = c("#545B3F", "#283036", "#34231C", "#6A6C4F", "#39454A", "#141B22", "#438F28", "#5B6876", "#7D7F63", "#7F8E99"),
  Aladdin = c("#721B22", "#18104B", "#903C44", "#1F1C72", "#462563", "#480B15", "#654057", "#7E5679", "2F2C36#", "#AF6B5D")
  
)

#' A Palette generator for animated films
#'
#' A collection of color palettes from some of the top animated films
#'
#' @param n Number of colors desired. Majority of palettes are the 10 most common colors found in the movies "barcode" sequence
#'   All color palettes were derived from movie barcodes found in:
#'   \href{https://moviebarcode.tumblr.com/}{Movie Barcodes}.
#'   and were then parsed through: 
#'   \href{https://palettegenerator.com/}{Palette Generator}.
#'   If omitted, uses all colours.
#' @param name Name of desired palette. Choices are:
#'   \code{A_Bugs_life}, \code{Aladdin}
#' @param type Either "continuous" or "discrete". Use continuous if you want
#'   to automatically interpolate between colours.
#'   @importFrom graphics rgb rect par image text
#' @return A vector of colours.
#' @export
#' @keywords colors
#' @examples
#' animated_palette("A_Bugs_life")
#' animated_palette("Aladdin")
#' animated_palette("Aladdin", 3)
#'
#' # If you need more colours than normally found in a palette, you
#' # can use a continuous palette to interpolate between existing
#' # colours
#' pal <- animated_palette(21, name = "Aladdin", type = "continuous")
#' image(volcano, col = pal)
animated <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)
  
  pal <- animated_palettes[[name]]
  if (is.null(pal))
    stop("Palette not found.")
  
  if (missing(n)) {
    n <- length(pal)
  }
  
  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colors greater than what palette can offer")
  }
  
  out <- switch(type,
                continuous = grDevices::colorRampPalette(pal)(n),
                discrete = pal[1:n]
  )
  structure(out, class = "palette", name = name)
}

#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))
  
  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")
  
  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
}

#' heatmap
#'
#' A heatmap example
"heatmap"
