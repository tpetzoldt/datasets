library(commonmark)

data_dir <- "data"
data_files <- list.files(data_dir)

# ---- read instructions from local workdir ----
instructions_file <- "instructions.md"

instructions_html <- if (file.exists(instructions_file)) {
  commonmark::markdown_html(
    paste(readLines(instructions_file, warn = FALSE, encoding = "UTF-8"),
          collapse = "\n")
  )
} else {
  warning("instructions.md not found in working directory.")
  '<p>See the <a href="https://github.com/tpetzoldt/datasets/blob/main/README.md">README on GitHub</a>.</p>'
}

# ---- file list, .txt entries flagged ----
is_txt  <- grepl("\\.txt$", data_files)
labels  <- ifelse(is_txt, paste0(data_files, " \u24d8"), data_files)
classes <- ifelse(is_txt, ' class="terms"', "")

html_content <- paste0("<li", classes, "><a href=\"",
                       file.path(data_dir, data_files), "\">",
                       labels, "</a></li>", collapse = "\n")

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
      margin: 2em auto; max-width: 60em; padding: 0 1em; line-height: 1.5;
    }
    .disclaimer {
      border-left: 4px solid #999; background: #f5f5f5;
      padding: 0.6em 1em; margin: 1em 0 1.5em 0; font-size: 1.2em;
    }
    ul.filelist {
      column-count: 4; column-gap: 2em; list-style: none; padding-left: 0;
    }
    ul.filelist li { break-inside: avoid; margin-bottom: 0.25em; }
    ul.filelist li.terms a { color: #a33; }
    @media (max-width: 900px) { ul.filelist { column-count: 2; } }
    @media (max-width: 500px) { ul.filelist { column-count: 1; } }
    .readme {
      border-top: 1px solid #ccc; margin-top: 2.5em; padding-top: 1em;
      font-size: 0.95em;
    }
    .readme pre { background: #f7f7f7; padding: 0.8em; overflow-x: auto; }
  </style>
</head>
<body>
  <h1>Elements of Statistics: List of Example Datasets</h1>

  <div class="disclaimer">
    <strong>Terms of use:</strong> Datasets originate from different sources
    and are subject to different licences and attribution requirements.
    Entries shown in <span style="color:#a33">red \u24d8</span> are
    <code>.txt</code> files containing the terms of use, licence and required
    citation for the corresponding dataset.
    <strong>Please read them before downloading or redistributing.</strong>
    See also the notes <a href="#readme">below</a>.
  </div>

  <ul class="filelist">
    %s
  </ul>

 
  <div class="readme" id="readme">
    %s
  </div>
  
   <h2>Related Work</h2>
  <ul>
    <li><a href="../elements/">Lecture Slides</a></li>
    <li><a href="../element-labs/">Lab Exercises</a></li>
  </ul>


  <p>%s, <a href="https://github.com/tpetzoldt">https://github.com/tpetzoldt</a></p>
</body>
</html>
'

final_html <- sprintf(html_template, html_content, instructions_html,
                      format(Sys.Date(), "%Y-%m-%d"))

writeLines(final_html, "index.html")
