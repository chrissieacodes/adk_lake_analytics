view: secchi {
  sql_table_name: `@{DATASET_NAME}.secchi` ;;

  dimension: pk {
    primary_key: yes
    type: string
    sql: CONCAT(CAST(${TABLE}.permanent_id AS STRING), '_', CAST(${TABLE}.date AS STRING)) ;;
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
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: day {
    type: number
    sql: ${TABLE}.day ;;
  }

  dimension: secchi_depth {
    type: number
    sql: SAFE_CAST(${TABLE}.secchi AS FLOAT64) ;;
  }
}
