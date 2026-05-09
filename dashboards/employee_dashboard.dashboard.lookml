- dashboard: employee_dashboard
  title: "Employee Analytics Dashboard1"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Headcount, salary, attrition, tenure and performance. Test dashboard for Git deployment validation."

  filters:
    - name: department_filter
      title: "Department"
      type: field_filter
      default_value: ''
      allow_multiple_values: true
      required: false
      ui_config:
        type: checkboxes
        display: popover
      explore: employees
      field: employees.department

    - name: location_filter
      title: "Location"
      type: field_filter
      default_value: ''
      allow_multiple_values: true
      required: false
      ui_config:
        type: checkboxes
        display: popover
      explore: employees
      field: employees.location

    - name: status_filter
      title: "Employment Status"
      type: field_filter
      default_value: 'Active'
      allow_multiple_values: true
      required: false
      ui_config:
        type: button_toggles
        display: inline
      explore: employees
      field: employees.employment_status

  elements:

    # ── KPI Row ────────────────────────────────────────────────────────────────
    - title: "Total Employees"
      name: kpi_total
      model: looker_test
      explore: employees
      type: single_value
      fields: [employees.total_employees]
      listen:
        Department: employees.department
        Location: employees.location
        Employment Status: employees.employment_status
      vis_config:
        type: single_value
        font_size: large
        text_color: "#1A73E8"
      row: 0
      col: 0
      width: 6
      height: 4

    - title: "Active Employees"
      name: kpi_active
      model: looker_test
      explore: employees
      type: single_value
      fields: [employees.active_employees]
      listen:
        Department: employees.department
        Location: employees.location
      vis_config:
        type: single_value
        font_size: large
        text_color: "#34A853"
      row: 0
      col: 6
      width: 6
      height: 4

    - title: "Attrition Rate"
      name: kpi_attrition
      model: looker_test
      explore: employees
      type: single_value
      fields: [employees.attrition_rate]
      listen:
        Department: employees.department
        Location: employees.location
      vis_config:
        type: single_value
        font_size: large
        text_color: "#EA4335"
      row: 0
      col: 12
      width: 6
      height: 4

    - title: "Avg Salary"
      name: kpi_avg_salary
      model: looker_test
      explore: employees
      type: single_value
      fields: [employees.avg_salary]
      listen:
        Department: employees.department
        Location: employees.location
        Employment Status: employees.employment_status
      vis_config:
        type: single_value
        font_size: large
        text_color: "#FBBC04"
      row: 0
      col: 18
      width: 6
      height: 4

    # ── Headcount by Department (bar) ──────────────────────────────────────────
    - title: "Headcount by Department"
      name: headcount_by_dept
      model: looker_test
      explore: employees
      type: looker_bar
      fields:
        - employees.department
        - employees.active_employees
        - employees.terminated_employees
      sorts:
        - employees.active_employees desc
      limit: 20
      listen:
        Department: employees.department
        Location: employees.location
        Employment Status: employees.employment_status
      vis_config:
        type: looker_bar
        stacking: normal
        show_value_labels: true
        legend_position: right
        show_view_names: false
        series_labels:
          employees.active_employees: "Active"
          employees.terminated_employees: "Terminated"
        series_colors:
          employees.active_employees: "#34A853"
          employees.terminated_employees: "#EA4335"
        x_axis_label: "Department"
        y_axis_labels:
          - "Headcount"
        show_x_axis_label: true
        show_x_axis_ticks: true
        show_y_axis_labels: true
        show_y_axis_ticks: true
      row: 4
      col: 0
      width: 12
      height: 8

    # ── Avg Salary by Department ───────────────────────────────────────────────
    - title: "Avg Salary by Department & Level"
      name: salary_by_dept_level
      model: looker_test
      explore: employees
      type: looker_column
      fields:
        - employees.department
        - employees.job_level
        - employees.avg_salary
      pivots:
        - employees.job_level
      sorts:
        - employees.department asc
      limit: 100
      listen:
        Department: employees.department
        Location: employees.location
        Employment Status: employees.employment_status
      vis_config:
        type: looker_column
        stacking: ''
        show_value_labels: false
        legend_position: right
        show_view_names: false
        y_axis_labels:
          - "Avg Salary ($)"
        x_axis_label: "Department"
        show_x_axis_label: true
        show_x_axis_ticks: true
        show_y_axis_labels: true
        show_y_axis_ticks: true
      row: 4
      col: 12
      width: 12
      height: 8

    # ── Headcount Trend (Hires by Month) ───────────────────────────────────────
    - title: "Hires Over Time (by Month)"
      name: hires_over_time
      model: looker_test
      explore: employees
      type: looker_line
      fields:
        - employees.hire_month
        - employees.total_employees
      sorts:
        - employees.hire_month asc
      limit: 500
      listen:
        Department: employees.department
        Location: employees.location
      vis_config:
        type: looker_line
        show_value_labels: false
        legend_position: right
        show_view_names: false
        x_axis_label: "Hire Month"
        y_axis_labels:
          - "New Hires"
        point_style: none
        interpolation: linear
        show_x_axis_label: true
        show_x_axis_ticks: true
        show_y_axis_labels: true
        show_y_axis_ticks: true
      row: 12
      col: 0
      width: 12
      height: 7

    # ── Attrition by Department ────────────────────────────────────────────────
    - title: "Attrition Rate by Department"
      name: attrition_by_dept
      model: looker_test
      explore: employees
      type: looker_bar
      fields:
        - employees.department
        - employees.attrition_rate
      sorts:
        - employees.attrition_rate desc
      limit: 20
      listen:
        Department: employees.department
        Location: employees.location
      vis_config:
        type: looker_bar
        stacking: ''
        show_value_labels: true
        show_view_names: false
        series_colors:
          employees.attrition_rate: "#EA4335"
        x_axis_label: "Department"
        y_axis_labels:
          - "Attrition Rate"
        show_x_axis_label: true
        show_x_axis_ticks: true
        show_y_axis_labels: true
        show_y_axis_ticks: true
      row: 12
      col: 12
      width: 12
      height: 7

    # ── Tenure Distribution ────────────────────────────────────────────────────
    - title: "Employees by Tenure Band"
      name: tenure_distribution
      model: looker_test
      explore: employees
      type: looker_pie
      fields:
        - employees.tenure_band
        - employees.total_employees
      sorts:
        - employees.tenure_band_sort asc
      limit: 10
      listen:
        Department: employees.department
        Location: employees.location
        Employment Status: employees.employment_status
      vis_config:
        type: looker_pie
        show_value_labels: true
        font_size: 12
        legend_position: right
        show_view_names: false
        series_colors:
          "< 1 year":   "#4285F4"
          "1-2 years":  "#34A853"
          "3-4 years":  "#FBBC04"
          "5-9 years":  "#EA4335"
          "10+ years":  "#9C27B0"
      row: 19
      col: 0
      width: 8
      height: 8

    # ── Performance Score Distribution ────────────────────────────────────────
    - title: "Avg Performance Score by Department"
      name: performance_by_dept
      model: looker_test
      explore: employees
      type: looker_column
      fields:
        - employees.department
        - employees.avg_performance_score
      sorts:
        - employees.avg_performance_score desc
      limit: 20
      listen:
        Department: employees.department
        Location: employees.location
        Employment Status: employees.employment_status
      vis_config:
        type: looker_column
        stacking: ''
        show_value_labels: true
        show_view_names: false
        series_colors:
          employees.avg_performance_score: "#7B52AB"
        reference_lines:
          - reference_type: line
            line_value: "3"
            label_position: right
            color: "#EA4335"
            label: "Threshold (3.0)"
        x_axis_label: "Department"
        y_axis_labels:
          - "Avg Performance Score"
        show_x_axis_label: true
        show_x_axis_ticks: true
        show_y_axis_labels: true
        show_y_axis_ticks: true
      row: 19
      col: 8
      width: 8
      height: 8

    # ── Salary Cost by Location ────────────────────────────────────────────────
    - title: "Total Salary Cost by Location"
      name: salary_by_location
      model: looker_test
      explore: employees
      type: looker_bar
      fields:
        - employees.location
        - employees.total_salary_cost
      sorts:
        - employees.total_salary_cost desc
      limit: 20
      listen:
        Department: employees.department
        Location: employees.location
      vis_config:
        type: looker_bar
        stacking: ''
        show_value_labels: true
        show_view_names: false
        series_colors:
          employees.total_salary_cost: "#1A73E8"
        x_axis_label: "Location"
        y_axis_labels:
          - "Total Salary ($)"
        show_x_axis_label: true
        show_x_axis_ticks: true
        show_y_axis_labels: true
        show_y_axis_ticks: true
      row: 19
      col: 16
      width: 8
      height: 8

    # ── Employee Detail Table ─────────────────────────────────────────────────
    - title: "Employee Roster"
      name: employee_roster
      model: looker_test
      explore: employees
      type: looker_grid
      fields:
        - employees.employee_id
        - employees.full_name
        - employees.department
        - employees.job_level
        - employees.location
        - employees.employment_status
        - employees.hire_date
        - employees.salary
        - employees.performance_score
        - employees.tenure_years
      sorts:
        - employees.department asc
        - employees.job_level_sort asc
      limit: 500
      listen:
        Department: employees.department
        Location: employees.location
        Employment Status: employees.employment_status
      vis_config:
        type: looker_grid
        show_view_names: false
        show_row_numbers: true
        size_to_fit: true
        table_theme: white
        enable_conditional_formatting: true
        header_text_alignment: left
        header_font_size: 12
        rows_font_size: 12
      row: 27
      col: 0
      width: 24
      height: 10
