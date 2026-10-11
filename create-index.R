# Specify the directory containing data files
data_dir <- "data"

# Get a list of data files
data_files <- list.files(data_dir)

# Create an HTML template
html_template <- '
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Elements of Statistics: Example Datasets</title>
  <style>
    body {
      font-family: "Noto Sans", "Open Sans", "Segoe UI", Roboto,
                   "Helvetica Neue", Arial, sans-serif;
      margin: 2em auto;
      max-width: 50em;
      padding: 0 1em;
      line-height: 1.5;
    }
  </style>
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
  <p>%s, <a href="https://github.com/tpetzoldt">https://github.com/tpetzoldt</a>
  </p>
</body>
</html>
'

# Create HTML content with relative links to data files
html_content <- paste0("<li><a href=\"", paste0(data_dir, "/", data_files), "\">",
                       data_files, "</a></li>", collapse = "\n")

# Fill the template with content and current date
final_html <- sprintf(html_template, html_content, format(Sys.Date(), "%Y-%m-%d"))

# Write the HTML file
writeLines(final_html, "index.html")
