data "archive_file" "script" {
  type             = "zip"
  output_file_mode = "0666"
  output_path      = "${path.module}/app.zip"

  source {
    filename = "main.js"
    content = file("${path.module}/main.js")
  }

  source {
    filename = "alt.js"
    content = file("${path.module}/alt.js")
  }
}

output "hash" {
  value = "${data.archive_file.script.output_md5}"
}