include: "/views/raw/rotifer.view.lkml"

view: +rotifer {
  # --------------------------------------------------------------------------
  # 1. KEYS
  # --------------------------------------------------------------------------

  # --------------------------------------------------------------------------
  # 2. DIMENSIONS
  # --------------------------------------------------------------------------

  # --------------------------------------------------------------------------
  # 3. MEASURES
  # --------------------------------------------------------------------------

  measure: observation_count {
    label: "Rotifer Observations"
    type: count
    value_format_name: decimal_0
  }

  measure: species_count {
    label: "Distinct Rotifer Species"
    type: count_distinct
    sql: ${species} ;;
    value_format_name: decimal_0
  }

  measure: average_density_org_l {
    label: "Avg Density (org/L)"
    type: average
    sql: ${org_l} ;;
    value_format_name: decimal_2
  }

  measure: average_biomass_mg_l {
    label: "Avg Biomass (mg/L)"
    type: average
    sql: ${mgww_l} ;;
    value_format_name: decimal_3
  }
}
