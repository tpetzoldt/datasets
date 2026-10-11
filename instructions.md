## Under which conditions can I use these data?

This repository contains data sets for teaching purposes. Licenses of data differ, **please read the corresponding _..._info.txt_** files.

This repository contains datasets of two different kinds. Some are "toy datasets" released into the public domain or as free educational resources under a CC BY-SA licence. Others — mainly data on hydrology, meteorology and water quality — remain subject to the terms of the original data providers. For the latter, the files provided here are modified works and not the original data. In these cases the original data provider must always be cited (see the accompanying .txt info files), and no guarantee is given for the correctness or completeness of the data.

## How to read a data set directly from **R**?

Data can be downloaded or directly be opened in a data analysis language like R:

**Example**

```
file <- "https://tpetzoldt.github.io/datasets/data/clementines.csv"
mydata <- read.csv(file)

info <- readChar("https://tpetzoldt.github.io/datasets/data/clementines_info.txt", nchars=4096)
cat(info)
```

**Note:** This repository is experimental and may suddenly change without notice.
