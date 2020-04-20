<!-- README.md is generated from README.Rmd. Please edit that file -->
Animated Palettes
=================

Recycled code from [Karthik Ram’s `wesanderson`
palette](https://github.com/karthik/wesanderson) with inspiration from
[DL Miller’s `beyonce` palette](https://github.com/dill/beyonce)

**Note**: Where as previously mentioned paletts used a different method
for generating themed color palettes. I have opted for a different
approach. I brief I used movie barcodes (in which every frame of a movie
is shrunk to a couple pixel wide line), I then took the top 10 (using a
k-means algorithm [palette generator](https://palettegenerator.com/))
most represented colors.

Using this approach I have generated color palettes that represent the
most dominant colors of a given movie.

However, I am not sure I like the results all that much, I am working on
implementing a better method for generating color palettes that better
refects the artisticly dominant colors of a movie. So please check back
at some point.

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
for(i in 1:length(animated_palettes)){
  print(animated(paste0(names(animated_palettes[i]))))
}
```

![](figure/palettes_dummy-1.png)![](figure/palettes_dummy-2.png)![](figure/palettes_dummy-3.png)![](figure/palettes_dummy-4.png)![](figure/palettes_dummy-5.png)![](figure/palettes_dummy-6.png)![](figure/palettes_dummy-7.png)![](figure/palettes_dummy-8.png)

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
