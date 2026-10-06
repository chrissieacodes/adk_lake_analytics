include: "/views/raw/temp_do_profiles.view.lkml"

view: +temp_do_profiles {
  # --------------------------------------------------------------------------
  # 1. KEYS
  # --------------------------------------------------------------------------

  # --------------------------------------------------------------------------
  # 2. DIMENSIONS
  # --------------------------------------------------------------------------

  dimension: depth_bracket {
    label: "Depth Bracket (m)"
    type: tier
    tiers: [0, 2, 5, 10, 15, 20]
    style: integer
    sql: ${depth} ;;
    description: "Depth profile bracket in meters."
  }

  dimension: is_hypoxic {
    label: "Hypoxic Condition (< 2 mg/L)"
    type: yesno
    sql: ${doobs} < 2.0 ;;
    description: "Indicates whether dissolved oxygen is below hypoxic threshold (< 2.0 mg/L)."
  }

  # --------------------------------------------------------------------------
  # 3. MEASURES
  # --------------------------------------------------------------------------

  measure: profile_reading_count {
    label: "Profile Measurements"
    type: count
    value_format_name: decimal_0
  }

  measure: average_water_temperature {
    label: "Avg Water Temp (°C)"
    type: average
    sql: ${temp} ;;
    value_format_name: decimal_1
    description: "Average in-situ water temperature in degrees Celsius."
  }

  measure: average_dissolved_oxygen {
    label: "Avg Dissolved Oxygen (mg/L)"
    type: average
    sql: ${doobs} ;;
    value_format_name: decimal_2
    description: "Average Dissolved Oxygen concentration in mg/L."
  }
}
