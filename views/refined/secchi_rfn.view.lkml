include: "/views/raw/secchi.view.lkml"

view: +secchi {
  # --------------------------------------------------------------------------
  # 1. KEYS
  # --------------------------------------------------------------------------

  # --------------------------------------------------------------------------
  # 2. DIMENSIONS
  # --------------------------------------------------------------------------

  # --------------------------------------------------------------------------
  # 3. MEASURES
  # --------------------------------------------------------------------------

  measure: secchi_reading_count {
    label: "Secchi Depth Readings"
    type: count
    value_format_name: decimal_0
  }

  measure: average_secchi_depth {
    label: "Avg Secchi Depth (m)"
    type: average
    sql: ${secchi_depth} ;;
    value_format_name: decimal_2
    description: "Average water transparency Secchi disk depth in meters."
    drill_fields: []
    link: {
      label: "📈 Secchi Transparency Trend (Line)"
      url: "@{DRILL_LINE_VIZ}{{ link }}&fields=secchi.sample_year,secchi.average_secchi_depth&sorts=secchi.sample_year+asc"
    }
  }

  measure: max_secchi_depth {
    label: "Max Secchi Depth (m)"
    type: max
    sql: ${secchi_depth} ;;
    value_format_name: decimal_2
    description: "Maximum recorded Secchi disk transparency in meters."
  }

  measure: min_secchi_depth {
    label: "Min Secchi Depth (m)"
    type: min
    sql: ${secchi_depth} ;;
    value_format_name: decimal_2
    description: "Minimum recorded Secchi disk transparency in meters."
  }
}
