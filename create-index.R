library(knitr)

# Specify the directory containing data files
data_dir <- "data"

# Get a list of data files
data_files <- list.files(data_dir)

# Create an HTML template
html_template <- '
<!DOCTYPE html>
<html>
<head>
  <title>Elements of Statistics: Example Datasets</title>
</head>
<body>
  <h1>Elements of Statistics: List of Example Datasets</h1>
  <ul>
    %s
  </ul>
  <h2>Related Work</h2>
  <ul>
  <li><a href="../elements/">Lecture Slides</a></li>
  <li><a href="../element-labs/">Lab Exercises</a></li>
  </ul>
  <p>2024-12-03, <a href="https://github.com/tpetzoldt">https://github.com/tpetzoldt</a>
  </p>
</body>
</html>
'

# Create HTML content with relative links to data files
html_content <- paste0("<li><a href=\"", paste0(data_dir, "/", data_files), "\">", data_files, "</a></li>", collapse = "\n")

# Fill the template with content
final_html <- sprintf(html_template, html_content)

# Write the HTML file
writeLines(final_html, "index.html")
