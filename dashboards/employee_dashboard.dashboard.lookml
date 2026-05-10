---
- dashboard: testemployee
  title: test-employee
  preferred_viewer: dashboards-next
  preferred_slug: rvxhjOsFhcqcbPpdsY70zY
  layout: newspaper
  tabs:
  - name: ''
    label: ''
  elements:
  - title: test-employee
    name: test-employee
    model: looker_test
    explore: employee
    type: table
    fields: [employee.department, employee.employee_id]
    sorts: [employee.department]
    limit: 500
    column_limit: 50
    listen: {}
    row:
    col:
    width:
    height:
    tab_name: ''
  - title: tile
    name: tile
    model: looker_test
    explore: employee
    type: looker_column
    fields: [employee.department, employee.employee_id]
    sorts: [employee.department]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
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
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row:
    col:
    width:
    height:
    tab_name: ''
