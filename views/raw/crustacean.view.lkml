view: crustacean {
  sql_table_name: `@{DATASET_NAME}.crustacean` ;;

  dimension: pk {
    primary_key: yes
    type: string
    sql: CONCAT(CAST(${TABLE}.permanent_id AS STRING), '_', CAST(${TABLE}.date AS STRING), '_', COALESCE(${TABLE}.species, 'sp'), '_', CAST(ROW_NUMBER() OVER() AS STRING)) ;;
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

  dimension: group {
    type: string
    sql: ${TABLE}.group ;;
  }

  dimension: taxa {
    type: string
    sql: ${TABLE}.taxa ;;
  }

  dimension: genus {
    type: string
    sql: ${TABLE}.genus ;;
  }

  dimension: species {
    type: string
    sql: ${TABLE}.species ;;
  }

  dimension: ug_wwperind {
    type: number
    sql: ${TABLE}.ug_wwperind ;;
  }

  dimension: org_l {
    type: number
    sql: ${TABLE}.org_l ;;
  }

  dimension: mgww_l {
    type: number
    sql: ${TABLE}.mgww_l ;;
  }
}
