predicate "table" "has_pk" {
  primary_key {
    condition = self != null
  }
}

rule "migrate" "require-pk" {
  description = "Every new table must have a primary key"
  add {
    table {
      assert {
        predicate = predicate.table.has_pk
        message   = "Table ${self.name} lacks a primary key"
      }
    }
  }
}
