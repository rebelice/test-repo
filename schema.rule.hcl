predicate "table" "has_primary_key" {
  primary_key {
    condition = self != null
  }
}

predicate "table" "is_users" {
  name { eq = "users" }
}

predicate "table" "has_column" {
  variable "name" {
    type = string
  }
  any {
    column {
      condition = self.name == var.name
    }
  }
}

predicate "column" "is_required" {
  null { eq = false }
}

predicate "column" "is_users_required_column" {
  name { in = ["id", "name", "email"] }
}

rule "schema" "all-tables-have-primary-key" {
  description = "Require every table to have a primary key"
  table {
    assert {
      predicate = predicate.table.has_primary_key
      message   = "table ${self.name} must have a primary key"
    }
  }
}

rule "schema" "users-has-core-columns" {
  description = "Require the users table to keep its core columns"
  table {
    match {
      predicate = predicate.table.is_users
    }
    assert {
      predicate = predicate.table.has_column
      vars      = { name = "id" }
      message   = "table ${self.name} must include an 'id' column"
    }
    assert {
      predicate = predicate.table.has_column
      vars      = { name = "name" }
      message   = "table ${self.name} must include a 'name' column"
    }
    assert {
      predicate = predicate.table.has_column
      vars      = { name = "email" }
      message   = "table ${self.name} must include an 'email' column"
    }
  }
}

rule "schema" "users-required-columns-stay-not-null" {
  description = "Require key users columns to remain not null"
  table {
    match {
      predicate = predicate.table.is_users
    }
    column {
      match {
        predicate = predicate.column.is_users_required_column
      }
      assert {
        predicate = predicate.column.is_required
        message   = "column ${self.name} on table users must be NOT NULL"
      }
    }
  }
}
