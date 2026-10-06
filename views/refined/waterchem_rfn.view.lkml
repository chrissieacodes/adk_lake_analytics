include: "/views/raw/waterchem.view.lkml"

view: +waterchem {
  # --------------------------------------------------------------------------
  # 1. KEYS
  # --------------------------------------------------------------------------

  # --------------------------------------------------------------------------
  # 2. DIMENSIONS
  # --------------------------------------------------------------------------

  dimension: acidity_status {
    label: "Acidity Status"
    type: string
    sql: CASE 
           WHEN ${ph} < 5.0 THEN 'Severely Acidic (< 5.0)'
           WHEN ${ph} < 6.0 THEN 'Moderately Acidic (5.0 - 6.0)'
           WHEN ${ph} < 6.5 THEN 'Transitional (6.0 - 6.5)'
           ELSE 'Circumneutral / Recovered (>= 6.5)'
         END ;;
    description: "Acidification classification based on limnological pH thresholds."
  }

  dimension: anc_status {
    label: "ANC Buffering Capacity"
    type: string
    sql: CASE 
           WHEN ${anc_ueq_l} <= 0 THEN 'Acidified (<= 0 µeq/L)'
           WHEN ${anc_ueq_l} <= 50 THEN 'Extremely Sensitive (0 - 50 µeq/L)'
           WHEN ${anc_ueq_l} <= 200 THEN 'Moderately Sensitive (50 - 200 µeq/L)'
           ELSE 'Well Buffered (> 200 µeq/L)'
         END ;;
    description: "Acid Neutralizing Capacity (ANC) buffering vulnerability tier."
  }

  # --------------------------------------------------------------------------
  # 3. MEASURES
  # --------------------------------------------------------------------------

  measure: waterchem_sample_count {
    label: "Water Chemistry Samples"
    type: count
    value_format_name: decimal_0
    drill_fields: []
    link: {
      label: "📈 Samples Over Time (Line)"
      url: "@{DRILL_LINE_VIZ}{{ link }}&fields=waterchem.sample_year,waterchem.waterchem_sample_count&sorts=waterchem.sample_year+asc"
    }
  }

  measure: average_ph {
    label: "Avg pH"
    type: average
    sql: ${ph} ;;
    value_format_name: decimal_2
    description: "Average water acidity pH (scale 0-14)."
    drill_fields: []
    link: {
      label: "📈 Long-term pH Recovery Trend (Line)"
      url: "@{DRILL_LINE_VIZ}{{ link }}&fields=waterchem.sample_year,waterchem.average_ph&sorts=waterchem.sample_year+asc"
    }
    link: {
      label: "📊 Avg pH by Lake (Bar)"
      url: "@{DRILL_COLUMN_VIZ}{{ link }}&fields=waterchem.lake_name,waterchem.average_ph&sorts=waterchem.average_ph+asc"
    }
  }

  measure: average_anc {
    label: "Avg ANC (µeq/L)"
    type: average
    sql: ${anc_ueq_l} ;;
    value_format_name: decimal_1
    description: "Average Acid Neutralizing Capacity in microequivalents per liter (µeq/L)."
    drill_fields: []
    link: {
      label: "📈 Long-term ANC Trend (Line)"
      url: "@{DRILL_LINE_VIZ}{{ link }}&fields=waterchem.sample_year,waterchem.average_anc&sorts=waterchem.sample_year+asc"
    }
  }

  measure: average_sulfate {
    label: "Avg Sulfate SO4 (mg/L)"
    type: average
    sql: ${so4_minus2} ;;
    value_format_name: decimal_2
    description: "Average Sulfate ion concentration in mg/L (primary acid rain tracer)."
    drill_fields: []
    link: {
      label: "📈 Sulfate Decline Trend (Line)"
      url: "@{DRILL_LINE_VIZ}{{ link }}&fields=waterchem.sample_year,waterchem.average_sulfate&sorts=waterchem.sample_year+asc"
    }
  }

  measure: average_nitrate {
    label: "Avg Nitrate NO3 (mg/L)"
    type: average
    sql: ${no3_minus} ;;
    value_format_name: decimal_2
    description: "Average Nitrate ion concentration in mg/L."
  }

  measure: average_calcium {
    label: "Avg Base Cation Ca (mg/L)"
    type: average
    sql: ${calcium} ;;
    value_format_name: decimal_2
    description: "Average Calcium concentration in mg/L."
  }

  measure: average_doc {
    label: "Avg DOC (mg/L)"
    type: average
    sql: ${doc} ;;
    value_format_name: decimal_2
    description: "Average Dissolved Organic Carbon concentration in mg/L."
  }

  measure: average_conductivity {
    label: "Avg Conductivity (µS/cm)"
    type: average
    sql: ${conduct_us_cm} ;;
    value_format_name: decimal_1
    description: "Average specific conductance at 25°C in µS/cm."
  }

  measure: acidic_sample_count {
    label: "Acidic Samples (pH < 6.0)"
    type: count
    filters: [ph: "<6.0"]
    value_format_name: decimal_0
    description: "Count of sampling events with pH < 6.0."
  }

  measure: acidic_sample_percent {
    label: "Acidic Sample Rate"
    type: number
    sql: SAFE_DIVIDE(${acidic_sample_count}, ${waterchem_sample_count}) ;;
    value_format_name: percent_1
    description: "Percentage of lake samples classified as acidic (pH < 6.0)."
    drill_fields: []
    link: {
      label: "📈 Acidic Rate Over Time (Line)"
      url: "@{DRILL_LINE_VIZ}{{ link }}&fields=waterchem.sample_year,waterchem.acidic_sample_percent&sorts=waterchem.sample_year+asc"
    }
  }
}
