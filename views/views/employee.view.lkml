view: employee {
  sql_table_name: `test.employee` ;;
  drill_fields: [employee_id]

  dimension: employee_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.employee_id ;;
  }
  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: employment_status {
    type: string
    sql: ${TABLE}.employment_status ;;
  }
  dimension: full_name {
    type: string
    sql: ${TABLE}.full_name ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension_group: hire {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.hire_date ;;
  }
  dimension: job_level {
    type: string
    sql: ${TABLE}.job_level ;;
  }
  dimension: job_title {
    type: string
    sql: ${TABLE}.job_title ;;
  }
  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }
  dimension: manager_id {
    type: number
    sql: ${TABLE}.manager_id ;;
  }
  dimension: performance_score {
    type: number
    sql: ${TABLE}.performance_score ;;
  }
  dimension: salary {
    type: number
    sql: ${TABLE}.salary ;;
  }
  dimension_group: termination {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.termination_date ;;
  }
  measure: count {
    type: count
    drill_fields: [employee_id, full_name]
  }
}
