include: "/views/raw/lake_characteristics.view.lkml"

view: +lake_characteristics {
  # --------------------------------------------------------------------------
  # 1. KEYS
  # --------------------------------------------------------------------------

  # --------------------------------------------------------------------------
  # 2. DIMENSIONS
  # --------------------------------------------------------------------------

  dimension: lake_name {
    label: "Lake Name"
    description: "Name of the Adirondack lake."
    drill_fields: [lake_details*]
  }

  dimension: coordinates {
    label: "Geographic Location"
    type: location
    sql_latitude: ${lat} ;;
    sql_longitude: ${long} ;;
    description: "Geographic latitude and longitude coordinates for map visualizations."
  }

  dimension: watershed {
    label: "Watershed Basin"
    description: "Regional drainage basin / watershed name (e.g., Black, Raquette, Oswegatchie)."
  }

  dimension: hydro_type {
    label: "Hydrologic Type"
    description: "Hydrologic classification of the lake (e.g. Drainage, Seepage)."
  }

  dimension: elevation_tier {
    label: "Elevation Tier"
    type: tier
    tiers: [400, 500, 600, 700, 800]
    style: integer
    sql: ${elevation_m} ;;
    description: "Lake elevation grouped into 100m brackets."
  }

  dimension: depth_category {
    label: "Depth Category"
    type: string
    sql: CASE 
           WHEN ${max_depth} >= 20 THEN 'Deep (>=20m)'
           WHEN ${max_depth} >= 10 THEN 'Moderate (10-20m)'
           ELSE 'Shallow (<10m)'
         END ;;
    description: "Categorization of lake maximum depth."
  }

  # --------------------------------------------------------------------------
  # 3. MEASURES
  # --------------------------------------------------------------------------

  measure: lake_count {
    label: "Total Lakes Monitored"
    type: count_distinct
    sql: ${permanent_id} ;;
    value_format_name: decimal_0
    drill_fields: []
    link: {
      label: "📊 Lakes by Watershed (Bar)"
      url: "@{DRILL_COLUMN_VIZ}{{ link }}&fields=lake_characteristics.watershed,lake_characteristics.lake_count&sorts=lake_characteristics.lake_count+desc"
    }
  }

  measure: average_surface_area {
    label: "Avg Surface Area (ha)"
    type: average
    sql: ${sa_ha} ;;
    value_format_name: decimal_1
    description: "Average lake surface area in hectares."
  }

  measure: average_elevation {
    label: "Avg Elevation (m)"
    type: average
    sql: ${elevation_m} ;;
    value_format_name: decimal_1
    description: "Average lake elevation in meters above sea level."
  }

  measure: average_mean_depth {
    label: "Avg Mean Depth (m)"
    type: average
    sql: ${mean_depth} ;;
    value_format_name: decimal_1
    description: "Average mean lake depth across monitored lakes in meters."
  }

  measure: average_max_depth {
    label: "Avg Max Depth (m)"
    type: average
    sql: ${max_depth} ;;
    value_format_name: decimal_1
    description: "Average maximum depth across monitored lakes in meters."
  }

  # --------------------------------------------------------------------------
  # 5. SETS
  # --------------------------------------------------------------------------

  set: lake_details {
    fields: [
      permanent_id,
      lake_name,
      watershed,
      hydro_type,
      elevation_m,
      sa_ha,
      max_depth,
      mean_depth
    ]
  }
}
