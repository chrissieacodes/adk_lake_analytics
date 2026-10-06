include: "/views/raw/nutrients.view.lkml"

view: +nutrients {
  # --------------------------------------------------------------------------
  # 1. KEYS
  # --------------------------------------------------------------------------

  # --------------------------------------------------------------------------
  # 2. DIMENSIONS
  # --------------------------------------------------------------------------

  dimension: trophic_state {
    label: "Trophic State (Chlorophyll-a)"
    type: string
    sql: CASE 
           WHEN ${chl_a_ug_l} < 2.5 THEN 'Oligotrophic (< 2.5 µg/L)'
           WHEN ${chl_a_ug_l} <= 8.0 THEN 'Mesotrophic (2.5 - 8.0 µg/L)'
           ELSE 'Eutrophic (> 8.0 µg/L)'
         END ;;
    description: "Lake trophic state index category based on chlorophyll-a concentrations."
  }

  # --------------------------------------------------------------------------
  # 3. MEASURES
  # --------------------------------------------------------------------------

  measure: nutrient_sample_count {
    label: "Nutrient Samples"
    type: count
    value_format_name: decimal_0
  }

  measure: average_chlorophyll_a {
    label: "Avg Chlorophyll-a (µg/L)"
    type: average
    sql: ${chl_a_ug_l} ;;
    value_format_name: decimal_2
    description: "Average algal chlorophyll-a biomass indicator in µg/L."
    drill_fields: []
    link: {
      label: "📈 Chlorophyll-a Trend (Line)"
      url: "@{DRILL_LINE_VIZ}{{ link }}&fields=nutrients.sample_year,nutrients.average_chlorophyll_a&sorts=nutrients.sample_year+asc"
    }
  }

  measure: average_total_phosphorus {
    label: "Avg Total Phosphorus (µg/L)"
    type: average
    sql: ${totalp_ug_l} ;;
    value_format_name: decimal_2
    description: "Average Total Phosphorus in µg/L."
  }

  measure: average_total_nitrogen {
    label: "Avg Total Nitrogen (mg/L)"
    type: average
    sql: ${totaln} ;;
    value_format_name: decimal_2
    description: "Average Total Nitrogen in mg/L."
  }
}
