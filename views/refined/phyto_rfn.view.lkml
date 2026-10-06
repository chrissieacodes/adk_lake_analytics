include: "/views/raw/phyto.view.lkml"

view: +phyto {
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
    label: "Phytoplankton Observations"
    type: count
    value_format_name: decimal_0
  }

  measure: taxa_count {
    label: "Distinct Phytoplankton Genera"
    type: count_distinct
    sql: ${genus} ;;
    value_format_name: decimal_0
  }

  measure: average_cells_per_ml {
    label: "Avg Cell Density (cells/mL)"
    type: average
    sql: ${cells_per_ml} ;;
    value_format_name: decimal_1
  }

  measure: average_biovolume_um3_ml {
    label: "Avg Biovolume (µm³/mL)"
    type: average
    sql: ${biovol_um3_per_ml} ;;
    value_format_name: decimal_0
  }
}
