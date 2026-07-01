env "ci" {
  dev = "docker://postgres/16/dev?search_path=public"

  migration {
    dir    = "file://migrations"
    format = "flyway"
  }

  lint {
    destructive {
      error = true
    }
    data_depend {
      error = true
    }
  }
}
