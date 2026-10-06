view: lake_characteristics {
  sql_table_name: `@{DATASET_NAME}.lake_characteristics` ;;

  dimension: permanent_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.permanent_id ;;
  }

  dimension: lake_name {
    type: string
    sql: ${TABLE}.lake_name ;;
  }

  dimension: lat {
    type: number
    sql: ${TABLE}.lat ;;
  }

  dimension: long {
    type: number
    sql: ${TABLE}.long ;;
  }

  dimension: hydro_type {
    type: string
    sql: ${TABLE}.hydro_type ;;
  }

  dimension: watershed {
    type: string
    sql: ${TABLE}.wateshed ;;
  }

  dimension: watershedarea_ha {
    type: number
    sql: ${TABLE}.watershedarea_ha ;;
  }

  dimension: lake_vol_m3 {
    type: number
    sql: ${TABLE}.lake_vol_m3 ;;
  }

  dimension: wa_to_sa {
    type: number
    sql: ${TABLE}.wa_to_sa ;;
  }

  dimension: sa_ha {
    type: number
    sql: ${TABLE}.sa_ha ;;
  }

  dimension: elevation_m {
    type: number
    sql: ${TABLE}.elevation_m ;;
  }

  dimension: max_depth {
    type: number
    sql: ${TABLE}.max_depth ;;
  }

  dimension: mean_depth {
    type: number
    sql: ${TABLE}.mean_depth ;;
  }

  dimension: retention_time_year {
    type: number
    sql: SAFE_CAST(${TABLE}.retention_time_year AS FLOAT64) ;;
  }
}
