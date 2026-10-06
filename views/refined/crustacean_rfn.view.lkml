include: "/views/raw/crustacean.view.lkml"

view: +crustacean {
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
    label: "Crustacean Observations"
    type: count
    value_format_name: decimal_0
  }

  measure: species_count {
    label: "Distinct Species Count"
    type: count_distinct
    sql: ${species} ;;
    value_format_name: decimal_0
    description: "Number of distinct crustacean zooplankton species observed."
  }

  measure: average_density_org_l {
    label: "Avg Density (org/L)"
    type: average
    sql: ${org_l} ;;
    value_format_name: decimal_2
    description: "Average organism density per liter."
  }

  measure: average_biomass_mg_l {
    label: "Avg Biomass (mg/L)"
    type: average
    sql: ${mgww_l} ;;
    value_format_name: decimal_3
    description: "Average wet-weight biomass in mg/L."
  }
}
