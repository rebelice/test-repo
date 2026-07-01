env "ci" {
  dev = "docker://postgres/16/dev?search_path=public"

  migration {
    dir = "file://migrations"
  }

  lint {
    destructive {
      error = true
    }
    data_depend {
      error = true
    }
    incompatible {
      error = true
    }
    naming {
      match   = "^[a-z_][a-z0-9_]*$"
      message = "identifier must be lowercase snake_case"
    }
    statement {
      deny "no-select-star" {
        match   = "(?i)SELECT\\s+\\*"
        message = "SELECT * is not allowed; enumerate columns explicitly"
      }
    }
    rule "hcl" "custom-rules" {
      src = ["schema.rule.hcl"]
    }
  }
}
