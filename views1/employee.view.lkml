view: employee {
  sql_table_name: `acquired-goods-467720-d6.test.employee` ;;

  # ── Primary Key ───────────────────────────────────────────────────────────────
  dimension: employee_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.employee_id ;;
    label: "Employee ID"
  }

  # ── Personal Info ─────────────────────────────────────────────────────────────
  dimension: full_name {
    type: string
    sql: ${TABLE}.full_name ;;
    label: "Full Name"
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
    label: "Email"
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
    label: "Gender"
  }

  # ── Job Info ──────────────────────────────────────────────────────────────────
  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
    label: "Department"
    drill_fields: [job_level, full_name]
  }

  dimension: job_title {
    type: string
    sql: ${TABLE}.job_title ;;
    label: "Job Title"
  }

  dimension: job_level {
    type: string
    sql: ${TABLE}.job_level ;;
    label: "Job Level"
    order_by_field: job_level_sort
  }

  dimension: job_level_sort {
    hidden: yes
    type: number
    sql: CASE ${TABLE}.job_level
      WHEN 'Junior'   THEN 1
      WHEN 'Mid'      THEN 2
      WHEN 'Senior'   THEN 3
      WHEN 'Lead'     THEN 4
      WHEN 'Manager'  THEN 5
      WHEN 'Director' THEN 6
      ELSE 7
    END ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
    label: "Office Location"
  }

  dimension: employment_status {
    type: string
    sql: ${TABLE}.employment_status ;;
    label: "Employment Status"
  }

  dimension: manager_id {
    type: number
    sql: ${TABLE}.manager_id ;;
    label: "Manager ID"
    hidden: yes
  }

  # ── Dates ─────────────────────────────────────────────────────────────────────
  dimension_group: hire {
    type: time
    timeframes: [date, month, quarter, year]
    datatype: date
    sql: ${TABLE}.hire_date ;;
    label: "Hire"
  }

  dimension_group: termination {
    type: time
    timeframes: [date, month, year]
    datatype: date
    sql: ${TABLE}.termination_date ;;
    label: "Termination"
  }

  dimension: tenure_years {
    type: number
    sql: DATE_DIFF(
           COALESCE(${TABLE}.termination_date, CURRENT_DATE()),
           ${TABLE}.hire_date,
           YEAR
         ) ;;
    label: "Tenure (Years)"
    value_format: "0.0"
  }

  dimension: tenure_band {
    type: string
    label: "Tenure Band"
    sql: CASE
      WHEN ${tenure_years} < 1  THEN '< 1 year'
      WHEN ${tenure_years} < 3  THEN '1-2 years'
      WHEN ${tenure_years} < 5  THEN '3-4 years'
      WHEN ${tenure_years} < 10 THEN '5-9 years'
      ELSE '10+ years'
    END ;;
    order_by_field: tenure_band_sort
  }

  dimension: tenure_band_sort {
    hidden: yes
    type: number
    sql: CASE
      WHEN ${tenure_years} < 1  THEN 1
      WHEN ${tenure_years} < 3  THEN 2
      WHEN ${tenure_years} < 5  THEN 3
      WHEN ${tenure_years} < 10 THEN 4
      ELSE 5
    END ;;
  }

  # ── Compensation ──────────────────────────────────────────────────────────────
  dimension: salary {
    type: number
    sql: ${TABLE}.salary ;;
    label: "Salary ($)"
    value_format: "$#,##0"
    hidden: yes
  }

  dimension: salary_band {
    type: string
    label: "Salary Band"
    sql: CASE
      WHEN ${TABLE}.salary < 70000  THEN '< $70k'
      WHEN ${TABLE}.salary < 90000  THEN '$70k-$90k'
      WHEN ${TABLE}.salary < 110000 THEN '$90k-$110k'
      WHEN ${TABLE}.salary < 140000 THEN '$110k-$140k'
      ELSE '$140k+'
    END ;;
  }

  # ── Performance ───────────────────────────────────────────────────────────────
  dimension: performance_score {
    type: number
    sql: ${TABLE}.performance_score ;;
    label: "Performance Score"
    value_format: "0.0"
    hidden: yes
  }

  # ── Measures ──────────────────────────────────────────────────────────────────
  measure: total_employees {
    type: count
    label: "Total Employees"
    drill_fields: [employee_id, full_name, department, job_level, location, employment_status]
  }

  measure: active_employees {
    type: count
    label: "Active Employees"
    filters: [employment_status: "Active"]
    drill_fields: [employee_id, full_name, department, job_level, location]
  }

  measure: terminated_employees {
    type: count
    label: "Terminated Employees"
    filters: [employment_status: "Terminated"]
  }

  measure: attrition_rate {
    type: number
    sql: SAFE_DIVIDE(${terminated_employees}, NULLIF(${total_employees}, 0)) ;;
    label: "Attrition Rate"
    value_format: "0.0%"
  }

  measure: avg_salary {
    type: average
    sql: ${TABLE}.salary ;;
    label: "Avg Salary ($)"
    value_format: "$#,##0"
    drill_fields: [department, job_level, avg_salary]
  }

  measure: total_salary_cost {
    type: sum
    sql: ${TABLE}.salary ;;
    label: "Total Salary Cost ($)"
    value_format: "$#,##0"
    filters: [employment_status: "Active"]
  }

  measure: avg_performance_score {
    type: average
    sql: ${TABLE}.performance_score ;;
    label: "Avg Performance Score"
    value_format: "0.00"
  }

  measure: avg_tenure_years {
    type: average
    sql: ${tenure_years} ;;
    label: "Avg Tenure (Years)"
    value_format: "0.0"
  }
}
