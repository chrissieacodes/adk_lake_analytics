view: temp_do_profiles {
  sql_table_name: `@{DATASET_NAME}.temp_do_profiles` ;;

  dimension: pk {
    primary_key: yes
    type: string
    sql: CONCAT(CAST(${TABLE}.permanent_id AS STRING), '_', CAST(${TABLE}.date AS STRING), '_', CAST(${TABLE}.depth AS STRING)) ;;
  }

  dimension: permanent_id {
    type: number
    sql: ${TABLE}.permanent_id ;;
  }

  dimension: lake_name {
    type: string
    sql: ${TABLE}.lake_name ;;
  }

  dimension_group: sample {
    type: time
    timeframes: [raw, date, month, quarter, year]
    sql: ${TABLE}.date ;;
  }

  dimension: depth {
    type: number
    sql: ${TABLE}.depth ;;
  }

  dimension: temp {
    type: number
    sql: SAFE_CAST(${TABLE}.temp AS FLOAT64) ;;
  }

  dimension: doobs {
    type: number
    sql: SAFE_CAST(${TABLE}.doobs AS FLOAT64) ;;
  }
}
