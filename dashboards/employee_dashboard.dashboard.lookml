- dashboard: testemployee32
  title: test-employee32
  preferred_viewer: dashboards-next
  layout: newspaper

  elements:
  - title: Employee Table
    name: test-employee
    model: looker_test
    explore: employee
    type: table
    fields: [employees.department, employees.employee_id]
    sorts: [employees.department]
    limit: 500
    column_limit: 50
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    defaults_version: 1
    row: 0
    col: 0
    width: 12
    height: 6

  - title: Employees by Department
    name: tile
    model: looker_test
    explore: employee
    type: looker_column
    fields: [employees.department, employees.employee_id]
    sorts: [employees.department]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    row: 0
    col: 12
    width: 12
    height: 6
