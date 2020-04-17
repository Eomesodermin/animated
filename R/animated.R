#' Complete list of palettes
#'
#' Use \code{\link{animated}} to construct palettes of desired length.
#'
#' @export
animated_palettes <- list(
  A_Bugs_life = c("#545B3F", "#283036", "#34231C", "#6A6C4F", "#39454A", "#141B22", "#438F28", "#5B6876", "#7D7F63", "#7F8E99"),
  Aladdin = c("#721B22", "#18104B", "#903C44", "#1F1C72", "#462563", "#480B15", "#654057", "#7E5679", "#2F2C36", "#AF6B5D"),
  Finding_Nemo = c("#121716", "#1D3231", "#5F726C", "#505F52", "#364945", "#255874", "#346FA1", "#7F8E86", "#7783D2", "#279EC7"),
  Inside_out = c("#63525D", "#87696E", "#493B42", "#9D848F", "#7C6D96", "#5D5583", "#221E2A", "#B4A0B7", "#E7E7ED", "#51A6D4"),
  Lion_King = c("#151823", "#473523", "#71482D", "#22323A", "#87684D", "#59564F", "#63120A", "#798280", "#B7906F", "#94B5C3"),
  Monsters_Inc = c("#4F5A5F", "#212D36", "#2D4252", "#4D453B", "#716A62", "#5C7384", "#141917", "#808A90", "#2F587C", "#9CADB9"),
  Ratatouille = c("#3E2C21", "#331E12", "#523727", "#644635", "#715644", "#1B100B", "#231F1A", "#816758", "#4C423E", "#9E878B"),
  Up = c("#30261C", "#16120D", "#514D47", "#645F5D", "#757272", "#373A36", "#4C392C", "#818894", "#172029", "#A3AFB7")
  
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
#' animated("A_Bugs_life")
#' animated("Aladdin")
#' animated("Aladdin", 3)
#'
#' # If you need more colours than normally found in a palette, you
#' # can use a continuous palette to interpolate between existing
#' # colours
#' pal <- animated(21, name = "Aladdin", type = "continuous")
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
