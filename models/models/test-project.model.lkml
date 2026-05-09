connection: "test-connection1"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: test_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: test_project_default_datagroup

explore: employee {}

