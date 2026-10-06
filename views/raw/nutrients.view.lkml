view: nutrients {
  sql_table_name: `@{DATASET_NAME}.nutrients` ;;

  dimension: pk {
    primary_key: yes
    type: string
    sql: CONCAT(CAST(${TABLE}.permanent_id AS STRING), '_', CAST(${TABLE}.date AS STRING), '_', COALESCE(CAST(${TABLE}.sample_depth AS STRING), '0')) ;;
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

  dimension: z_max {
    type: number
    sql: SAFE_CAST(${TABLE}.z_max AS FLOAT64) ;;
  }

  dimension: sample_depth {
    type: number
    sql: SAFE_CAST(${TABLE}.sample_depth AS FLOAT64) ;;
  }

  dimension: sample_layer {
    type: string
    sql: ${TABLE}.sample_layer ;;
  }

  dimension: totalp_ug_l {
    type: number
    sql: SAFE_CAST(${TABLE}.totalp_ug_l AS FLOAT64) ;;
  }

  dimension: mrp_ug_l {
    type: number
    sql: SAFE_CAST(${TABLE}.mrp_ug_l AS FLOAT64) ;;
  }

  dimension: tfp_ug_l {
    type: number
    sql: SAFE_CAST(${TABLE}.tfp_ug_l AS FLOAT64) ;;
  }

  dimension: totaln {
    type: number
    sql: SAFE_CAST(${TABLE}.totaln AS FLOAT64) ;;
  }

  dimension: chl_a_ug_l {
    type: number
    sql: SAFE_CAST(${TABLE}.chl_a_ug_l AS FLOAT64) ;;
  }

  dimension: fe {
    type: number
    sql: SAFE_CAST(${TABLE}.fe AS FLOAT64) ;;
  }
}
