# datasets

## Datasets used for teaching purposes

This repository contains data sets for teaching purposes. Licenses of data differ, **please read the corresponding _..._info.txt_** files.

Some data sets are "toy data" released to the public domain or as free educational resources under the CC BY-SA license, while other "free data" underly the copyright of the original maintainers (data related to hydrology, meteorology, and water quality). In this case it is stated that the data provided here are a modified work and NOT the original data. This means that always the original data provider must be cited (see info files) and no guarantee is given for correctness.

## How to download a data set

1. Go to the **data** folder
2. Open the desired data set
3. Click on the download button, right to "Raw"

As an alternative, it is also possible to download the full repostitory with all data as zip file.

## How to read a data set directly from **R**

Data can also be directly be opened in a data analysis language like R:

**Example**

```
file <- "https://raw.githubusercontent.com/tpetzoldt/datasets/main/data/clementines.csv"
mydata <- read.csv(file)

info <- readChar("https://raw.githubusercontent.com/tpetzoldt/datasets/main/data/clementines_info.txt", nchars=4096)
cat(info)
```

**Note:** This repository is experimental and may suddenly change without notice.
