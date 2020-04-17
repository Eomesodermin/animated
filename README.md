<!-- README.md is generated from README.Rmd. Please edit that file -->
Animated Palettes
=================

Installation
------------

``` r
devtools::install_github("Eomesodermin/animated", force = TRUE)
```

Usage
-----

``` r
library("animated")

# See all palettes
names(animated_palettes)
#> [1] "A_Bugs_life"  "Aladdin"      "Finding_Nemo" "Inside_out"   "Lion_King"   
#> [6] "Monsters_Inc" "Ratatouille"  "Up"
```

Palettes
--------

### A\_Bugs\_life

``` r
animated("A_Bugs_life")
```

![](figure/A_Bugs_life-1.png)

### Aladdin

``` r
animated("Aladdin")
```

![](figure/Aladdin-1.png)

### Finding\_Nemo

``` r
animated("Finding_Nemo")
```

![](figure/Finding_Nemo-1.png)

### Inside\_out

``` r
animated("Inside_out")
```

![](figure/Inside_out-1.png)

### Lion\_King

``` r
animated("Lion_King")
```

![](figure/Lion_King-1.png)

### Monsters\_Inc

``` r
animated("Monsters_Inc")
```

![](figure/Monsters_Inc-1.png)

### Ratatouille

``` r
animated("Ratatouille")
```

![](figure/Ratatouille-1.png)

### Up

``` r
animated("Up")
```

![](figure/Up-1.png)

``` r
library("ggplot2")
ggplot(mtcars, aes(factor(cyl), fill=factor(vs))) +  geom_bar() +
  scale_fill_manual(values = animated("A_Bugs_life"))
```

![](figure/ggplot1-1.png)

``` r
pal <- animated("A_Bugs_life", 21, type = "continuous")
image(volcano, col = pal)
```

![](figure/volcano-1.png)
