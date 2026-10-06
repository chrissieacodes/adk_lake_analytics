view: phyto {
  sql_table_name: `@{DATASET_NAME}.phyto` ;;

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

  dimension: phylum {
    type: string
    sql: ${TABLE}.phylum ;;
  }

  dimension: class {
    type: string
    sql: ${TABLE}.class ;;
  }

  dimension: order {
    type: string
    sql: ${TABLE}.order ;;
  }

  dimension: family {
    type: string
    sql: ${TABLE}.family ;;
  }

  dimension: genus {
    type: string
    sql: ${TABLE}.genus ;;
  }

  dimension: species {
    type: string
    sql: ${TABLE}.species ;;
  }

  dimension: biovol_um3_per_cell {
    type: number
    sql: ${TABLE}.biovol_um3_per_cell ;;
  }

  dimension: cells_per_ml {
    type: number
    sql: ${TABLE}.cells_per_ml ;;
  }

  dimension: biovol_um3_per_ml {
    type: number
    sql: ${TABLE}.biovol_um3_per_ml ;;
  }
}
